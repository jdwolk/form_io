module FormIO
  module Adapters
    autoload :ActiveAttr, 'form_io/adapters/active_attr'

    def adapter(adapter_module)
      include adapter_module
    end
  end
end
