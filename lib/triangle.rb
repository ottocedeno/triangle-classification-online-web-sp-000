require 'pry'

class Triangle
  attr_reader :sides
  def initialize(side_one, side_two, side_three)
    @sides = [side_one, side_two, side_three]
  end

  def zero_or_negative?
    sides.any? {|side| side <= 0}
  end

  def triangle_inequality?
    sides[0] + sides[1] <= sides[2] || sides[1] + sides[2] <= sides[0] || sides[0] + sides[2] <= sides[1]
  end

  def kind
    raise TriangleError if self.zero_or_negative? || self.triangle_inequality?
    if sides.uniq.size == 1
      :equilateral
    elsif sides.uniq.size == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Go back to elementary school, that's not a triangle..."
    end
  end

end

bad = Triangle.new(0, 2, 3)
good = Triangle.new(4, 4, 4)
binding.pry
