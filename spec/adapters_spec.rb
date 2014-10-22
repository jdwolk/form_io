require 'spec_helper'

describe FormIO::Adapters do
  describe '.adapter' do
    module TestAdapter
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def class_level; end
      end

      def instance_level; end
    end

    it 'includes methods from the adapter into class-level scope' do
      subject = Class.new do
        extend FormIO::Adapters
      end

      subject.adapter TestAdapter
      expect(subject).to respond_to :class_level
      expect(subject.new).to respond_to :instance_level
    end
  end
end
