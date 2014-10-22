module FormIO
  # Represents the collection of all field definitions on a form
  class FieldDefinitions
    attr_reader :definitions

    def initialize(field_definitions = {})
      @definitions = field_definitions
    end

    def set(field_definition)
      definitions[field_definition.name] = field_definition
    end

    # model -> form
    def fill_fields_on(form)
      definitions.each do |name, definition|
        # TODO: virtual attributes, multi-model, etc
        definition.value = form.model_attr(name)
        form.set(name, definition.value)
      end
    end
  end
end
