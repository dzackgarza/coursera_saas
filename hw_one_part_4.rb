class Desserts
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  attr_accessor :name, :calories
  
  def healthy?
    if self.calories < 200 
      return true
    else
      return false
    end
  end
  
  def delicious?
    return true
  end
end

class Jellybean < Desserts
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor  
  end
  attr_accessor :flavor
  def delicious?
    if self.flavor == "black licorice"
      return false
    else 
      return true
    end
  end
end
