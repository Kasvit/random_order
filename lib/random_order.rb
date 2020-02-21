require "random_order/railtie"

module RandomOrder
  ORDERS = Hash.new(Arel.sql('RANDOM()')).update({"mysql2" => Arel.sql('RAND()')})

  def self.adapter
    @@adapter ||= begin
      if self.const_defined?("ActiveRecord")
        ActiveRecord::Base.configurations[Rails.env]['adapter']
      end
    end
  end

  def RandomOrder.order_func
    ORDERS[adapter]
  end

  def self.sql_query_string(model, n)
    model.from(
      "(SELECT * FROM #{model.table_name}, ( SELECT #{model.primary_key} AS sid "\
      "FROM #{model.table_name} ORDER BY #{RandomOrder.order_func} LIMIT #{n} ) tmp WHERE "\
      "#{model.table_name}.#{model.primary_key} = tmp.sid) as #{model.table_name}"
    )
  end
end
