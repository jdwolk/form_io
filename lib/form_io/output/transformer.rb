# Provides a default transformer for use in subclasses of FormIO::OutForm
# when one isn't given
module FormIO
  module Output
    class Transformer
      attr_accessor :value
    end
  end
end
