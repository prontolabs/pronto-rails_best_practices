require 'rspec'
require 'rspec/its'
require 'pronto/rails_best_practices'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }
end
