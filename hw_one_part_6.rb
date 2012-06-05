class CartesianProduct
  include Enumerable
    def initialize(set_one, set_two)
      @set_one = set_one
      @set_two = set_two
    end
    
    def each
     @set_one.each do |i|
        @set_two.each do |j|
          yield [i,j]
        end
      end
    end
end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
#  =>
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# =>
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
