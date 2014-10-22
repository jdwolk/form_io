class UserOutputForm < FormIO::Output::Form
  field :first_name
  field :last_name
  field :phone, transformer: PhoneReader
  field :email
end
