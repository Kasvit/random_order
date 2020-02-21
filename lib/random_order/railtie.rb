require_relative "random_order/extension"

module RandomOrder
  class Railtie < ::Rails::Railtie
    include Extension

     config.before_initialize do
      if RandomOrder.const_defined?("ActiveRecord")
        ActiveRecord::Base.send :extend, Extension
      end
    end
  end
end
