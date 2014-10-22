require 'active_attr'

module FormIO
  module Adapters
    module ActiveAttr
      include ::ActiveAttr::Model
      #extend ::ActiveAttr::Model

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def set_field_slot(name, options = {})
          self.attribute name #TODO filter options
        end
      end
    end
  end
end
