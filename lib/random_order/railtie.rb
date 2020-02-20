module RandomOrder
  class Railtie < ::Rails::Railtie
    module Extension
      def find_many_random(n)
        random.limit(n || 1)
      end

      def find_random
        random.limit(1)
      end

      def random
        case ActiveRecord::Base.configurations[Rails.env]['adapter']
        when 'mysql2'
          self.order(Arel.sql('RAND()'))
        when 'sqlite3'
          self.order(Arel.sql('RANDOM()'))
        when 'postgresql'
          self.order(Arel.sql('RANDOM()'))
        end
      end
    end

    initializer 'RandomOrder.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :extend, Extension
      end
    end
  end
end
