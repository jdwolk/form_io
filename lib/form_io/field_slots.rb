module FormIO
  module FieldSlots
    attr_accessor :fields

    def field?(name)
      fields.key? name
    end

    def field(name, options = {})
      fields[name] = options
      set_field_slot(name, options)
    end

    def fields
      @fields ||= {}
    end
  end
end
