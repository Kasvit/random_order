module RandomOrder
  module Extension
    def random
      self.order(RandomOrder.order_func)
    end

    def fast_random(n = 1)
      if self.primary_key.present?
        RandomOrder.sql_query_string(self, n)
      else
        random.limit(n)
      end
    end
  end
end
