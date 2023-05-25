class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1      
    @side2 = side2      
    @side3 = side3 
  end

  # Triangle#kind returns :equilateral when all sides are equal
    #  Failure/Error: raise TriangleError unless valid_num? && valid_triangle?
    #  NoMethodError:
      #  undefined method `valid_num?' for #<Triangle:0x00007fe50a17b078 @side1=2, @side2=2, @side3=2>
  def valid_num?
    [@side1, @side2, @side3].all? { |num| num > 0}
  end

  def valid_triangle?
    @side1 + @side2 > @side3 && @side2 + @side3 > @side1 && @side1 + @side3 > @side2
  end

  def kind
    try_error 
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 ||  @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end
  def try_error
    raise TriangleError unless valid_num? && valid_triangle?
  end
  
  class TriangleError < StandardError
    # triangle error code
  end
end