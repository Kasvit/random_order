require "random_order/railtie"

module RandomOrder
  def self.adapter
    @@adapter ||= detect_adapter
  end

  def self.detect_adapter
    if self.const_defined?("ActiveRecord")
      ActiveRecord::Base.configurations[Rails.env]['adapter']
    end
  end
end
