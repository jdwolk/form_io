require 'active_attr'

module FormIO
  module Output
    # OutputForms encapsulate the middle part of that out data flow:
    # model attributes -> form object -> user display
    class Form
      include ::ActiveAttr::BasicModel

      class << self
        attr_accessor :field_definitions

        def field(name, options = {})
          field_definitions.set(Output::FieldDefinition.new(name, options))
        end

        def field_definitions
          @field_definitions ||= FieldDefinitions.new
        end
      end

      attr_reader :model, :fields

      def initialize(model)
        init_single(model) # TODO: multi-model forms
        init_fields
      end

      def method_missing(meth, *args, &block)
        get(meth) || super(meth, *args, &block)
      end

      def respond_to?(meth, include_all = false)
        field?(meth) || super(meth, include_all)
      end

      def model_attr(attr)
        model.send(attr)
      end

      def get(field)
        fields[field]
      end

      def set(field, value)
        fields[field] = value
      end

      private

      def init_single(model)
        @model = model
      end

      def init_fields
        self.class.field_definitions.fill_fields_on self
      end

      def fields
        @fields ||= {}
      end

      def field?(field)
        fields.key? field
      end
    end
  end
end
