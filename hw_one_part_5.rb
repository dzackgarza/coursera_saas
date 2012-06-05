class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(attr_name)
        @attr_name = attr_name
        
        if @#{attr_name}_history != nil
          @#{attr_name}_history.push(attr_name)
        else
          @#{attr_name}_history = Array.new
          @#{attr_name}_history.push(nil)
          @#{attr_name}_history.push(attr_name)
        end  
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

#f = Foo.new
#f.bar = 1
#f.bar = 2
#f.bar_history # => if your code works, should be [nil,1,2]

class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 
  def in(currency_to_change_to)
    singular_currency = currency_to_change_to.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
  
  def method_missing(method_id)
    base_singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(base_singular_currency)
      self * @@currencies[base_singular_currency]
    else
      super
    end
  end
end
#puts 1.dollar.in(:yen)

class String
  def palindrome?()
    string = self.downcase.gsub(/\W/, "")
    string.reverse == string  
  end
end
#puts "A man, a plan, a canal -- Panamas".palindrome?

module Enumerable
  def palindrome?()
    self == self.reverse
  end
end
#puts [1,2,3,2,1].palindrome?