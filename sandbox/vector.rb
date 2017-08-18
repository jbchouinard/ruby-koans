class Scalar
  attr_reader :v

  def initialize(v)
    if v.is_a? Fixnum
      @v = v
    elsif v.is_a? Float
      @v = v
    else
      raise ArgumentError('Expected a number.')
    end
  end

  def *(other)
    if other.is_a? Scalar
      return Scalar.new(@v * other.v)
    else
      return other.*(@v)
    end
  end
end


class Vector
  def initialize(v)
    @v = v
  end

  def +(vec)
    n = self.dim
    if n != vec.dim
      raise ArgumentError.new('Vectors must have same length.')
    end
    sum = Array.new(n)
    for i in 0..n-1
      sum[i] = vec[i] + self[i]
    end
    Vector.new(sum)
  end

  def *(scalar)
    Vector.new(@v.map { |x| x * scalar })
  end

  def [](y)
    @v[y]
  end

  def dim
    @v.length
  end

  def coerce(other)
    [Scalar.new(other), self]
  end

  def inspect
    "Vector(#{@v})"
  end
end
