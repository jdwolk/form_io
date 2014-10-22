require 'spec_helper'

#describe FormIO::OutForm do
  #class PhoneReader < Struct.new(:phone)
  #  def value=(model_value)
  #    @value = model_value
  #  end

  #  def value
  #    phone = @value.split('')
  #    area_code = phone.take(3).join
  #    first_three = phone.drop(3).take(3).join
  #    last_four = phone.drop(6).join
  #    "(#{area_code}) #{first_three}-#{last_four}"
  #  end
  #end

  #class UserDetailsForm < FormIO::OutForm
  #  field :name
  #  field :phone, transformer: PhoneReader
  #end

  #describe 'fields' do
  #  it 'normalizes field values according to assigned transfomers' do
  #    user = OpenStruct.new(phone: '9098876543')
  #    subject = UserDetailsForm.new(user)
  #    normalized_phone = '(909) 887-6543'
  #    expect(subject.phone).to eq normalized_phone
  #  end

  #  it 'delegates to model attributes when no transformer is assigned' do
  #    expected_name = 'John Doe'
  #    user = OpenStruct.new(phone: '1234567890', name: expected_name)
  #    subject = UserDetailsForm.new(user)
  #    expect(subject.name).to eq expected_name
  #  end

  #  it 'only has fields for fields slots its own field slots' do
  #    class OtherForm < FormIO::OutForm
  #      field :other_field
  #    end

  #    user = OpenStruct.new(phone: '1234567890', name: 'John Doe')
  #    subject = UserDetailsForm.new(user)
  #    expect(subject).not_to respond_to :other_field

  #    other_model = OpenStruct.new(other_field: '')
  #    other_subject = OtherForm.new(other_model)
  #    expect(other_subject).to respond_to :other_field
  #  end
  #end
#end
