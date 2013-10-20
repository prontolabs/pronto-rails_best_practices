require 'spec_helper'
require 'ostruct'

module Pronto
  describe RailsBestPractices do
    let(:rails_best_practice) { RailsBestPractices.new }

    describe '#run' do
      subject { rails_best_practice.run(patches, nil) }

      context 'patches are nil' do
        let(:patches) { nil }
        it { should == [] }
      end

      context 'no patches' do
        let(:patches) { [] }
        it { should == [] }
      end
    end
  end
end
