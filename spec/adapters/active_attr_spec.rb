require 'spec_helper'

describe FormIO::Adapters::ActiveAttr do
  class UserDetailsForm
    extend FormIO::Adapters
    extend FormIO::FieldSlots

    adapter FormIO::Adapters::ActiveAttr
  end

  describe '#set_field_slot', focus: true do
    it 'creates an attribute for the given name' do
      slot_name = :phone
      UserDetailsForm.set_field_slot(slot_name)
      subject = UserDetailsForm.new
      expect(subject).to respond_to slot_name
    end
  end
end
