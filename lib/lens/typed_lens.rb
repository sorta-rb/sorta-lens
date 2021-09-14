# frozen_string_literal: true

# Extracts data from a given object
class TypedLens
  def self.on(**kwargs)
    new kwargs
  end

  def initialize(**kwargs)
    @kwargs = kwargs
    define_singleton_method :call do |object|
      kwargs.each_with_object({}) do |(sym, _ty), acc|
        val = extract(sym, object)
        acc[sym] = typecheck(sym, val)
      end
    end
  end

  def extract(sym, object)
    object.send(sym)
  rescue NoMethodError
    object[sym]
  end

  def typecheck(sym, val)
    ty = @kwargs[sym]
    return val if val.is_a?(ty)

    raise TypeError.new val.class, ty
  end

  # Type error
  class TypeError < RuntimeError
    def initialize(expected_ty, actual_ty)
      super "Unexpected type. Expected #{expected_ty} got #{actual_ty}"
    end
  end
end
