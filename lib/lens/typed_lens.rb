# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Typed
      def self.on(...)
        new(...)
      end

      def initialize(**kwargs)
        @kwargs = kwargs
        validate_arguments
      end

      def call(object)
        @getable = object.respond_to? :[]
        @kwargs.each_with_object({}) do |(sym, _ty), acc|
          val = extract(sym, object)
          acc[sym] = typecheck(sym, val)
        end
        @getable = nil
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
        if @getable
          object[sym]
        elsif object.respond_to? sym
          object.send(sym)
        end
      end

      def typecheck(sym, val)
        ty = @kwargs[sym]
        return val if val.is_a?(ty)

        raise TypeError.new val.class, ty
      end
    end
  end
end
