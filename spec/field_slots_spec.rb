require 'spec_helper'

describe FormIO::FieldSlots do
  module DummyAdapter
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def set_field_slot(*args); end
    end
  end

  class UserDetailsForm
    extend FormIO::Adapters
    extend FormIO::FieldSlots
  end

  describe '.field?' do
    it 'is true when there is a slot for the given field name' do
      subject = UserDetailsForm
      subject.adapter DummyAdapter
      subject.field :phone
      expect(UserDetailsForm.field?(:phone)).to be true
    end
  end

  describe '.field' do
    it 'adds a field slot for the given name'  do
      subject = UserDetailsForm
      subject.adapter DummyAdapter
      subject.field :phone
      expect(subject.fields.keys).to match_array [:phone]
    end

    it 'calls set_field_slot on the included adapter' do
      subject = UserDetailsForm
      subject.adapter DummyAdapter
      allow(subject).to receive(:set_field_slot)
      subject.field :phone
      expect(subject).to have_received(:set_field_slot)
    end
  end
end
