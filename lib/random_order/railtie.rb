require_relative "random_order/extension"

module RandomOrder
  class Railtie < ::Rails::Railtie
    include Extension

    initializer 'RandomOrder.initialize' do
      if RandomOrder.const_defined?("ActiveRecord")
        ActiveRecord::Base.send :extend, Extension
      end
    end
  end
end
