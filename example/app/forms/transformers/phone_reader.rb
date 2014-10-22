class PhoneReader < FormIO::Output::Transformer
  def value
    phone = @value.split('')
    area_code = phone.take(3).join
    first_three = phone.drop(3).take(3).join
    last_four = phone.drop(6).join
    "(#{area_code}) #{first_three}-#{last_four}"
  end
end
