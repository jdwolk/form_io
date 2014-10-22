module FormIO
  module Adapters
    autoload :ActiveAttr, 'form_io/adapters/active_attr'
    autoload :Basic, 'form_io/adapters/basic'

    def adapter(adapter_module)
      include adapter_module
    end
  end
end
