module FormIO
  module Output
    # For defining a field in an Output::Form
    class FieldDefinition
      attr_reader :name, :transformer

      def initialize(name, options = {})
        @name = name
        transformer_class = options[:transformer] || Output::Transformer
        @transformer = transformer_class.new
      end

      def value
        transformer.value
      end

      def value=(model_value)
        transformer.value = model_value
      end
    end
  end
end
