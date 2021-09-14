# frozen_string_literal: true

module Sorta
  # Extracts data from a given object
  class TypedLens
    def self.on(**kwargs)
      new(**kwargs)
    end

    def initialize(**kwargs)
      @kwargs = kwargs
      validate_arguments
      define_call
    end

    def define_call
      define_singleton_method :call do |object|
        @kwargs.each_with_object({}) do |(sym, _ty), acc|
          val = extract(sym, object)
          acc[sym] = typecheck(sym, val)
        end
      end
    end

    def validate_arguments
      @kwargs.each do |(sym, ty)|
        unless sym.is_a?(Symbol) && ty.is_a?(Class)
          raise ArgumentError,
                "Unexpected argument (#{sym.class} => #{ty.class}), must be (Symbol => Class)"
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
  end
end
