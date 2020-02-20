module RandomOrder
  module Extension
    def find_many_random(n)
      random.limit(n)
    end

    def find_random
      random.first
    end

    def random
      case RandomOrder.adapter
      when 'mysql2'
        self.order(Arel.sql('RAND()'))
      when 'postgresql'
        self.order(Arel.sql('RANDOM()'))
      when 'sqlite3'
        self.order(Arel.sql('RANDOM()'))
      end
    end
  end
end
