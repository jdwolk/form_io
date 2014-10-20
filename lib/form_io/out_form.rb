module FormIO
  class OutForm
    class << self
      attr_accessor :field_slots

      def field(name, options = {})
        field_slots.set(OutFieldSlot.new(name, options))
      end

      def field_slots
        @field_slots ||= FieldSlots.new
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
      has_field?(meth) || super(meth, include_all)
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
      self.class.field_slots.set_fields_on self
    end

    def fields
      @fields ||= {}
    end

    def has_field?(field)
      fields.has_key? field
    end
  end

  class FieldSlots
    attr_reader :slots

    def initialize(field_slots = {})
      @slots = field_slots
    end

    def set(field_slot)
      slots[field_slot.name] = field_slot
    end

    # model -> form
    def set_fields_on(form)
      slots.each do |name, slot|
        # TODO: virtual attributes, multi-model, etc
        slot.value = form.model_attr(name)
        form.set(name, slot.value)
      end
    end
  end

  class OutFieldSlot
    attr_reader :name, :transformer

    def initialize(name, options = {})
      @name = name
      transformer_class = options[:transformer] || FormIO::OutTransformer
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
