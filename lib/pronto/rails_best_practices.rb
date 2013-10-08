require 'pronto'
require 'rails_best_practices'

module Pronto
  class RailsBestPractices < Runner
    def run(patches)
      return [] unless patches

      patches_with_additions = patches.select { |patch| patch.additions > 0 }

      files = patches_with_additions.map do |patch|
        Regexp.new(patch.new_file_full_path.to_s)
      end

      if files.any?
        analyzer = ::RailsBestPractices::Analyzer.new('.', { 'silent' => true,
                                                             'only' => files })
        analyzer.analyze
        messages_for(patches_with_additions, analyzer.errors).compact
      else
        []
      end
    end

    def messages_for(patches, errors)
      errors.map do |error|
        patch = patch_for_error(patches, error)

        if patch
          line = patch.added_lines.select do |added_line|
            added_line.new_lineno == error.line_number.to_i
          end.first

          new_message(line, error) if line
        end
      end
    end

    def new_message(line, error)
      Message.new(line.patch.delta.new_file[:path], line, :warning,
                  error.message.capitalize)
    end

    def patch_for_error(patches, error)
      patches.select do |patch|
        patch.new_file_full_path.to_s == error.filename
      end.first
    end
  end
end
