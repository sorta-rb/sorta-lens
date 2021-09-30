# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Typed < LensBase
      def initialize(**kwargs)
        @types = kwargs.values
        validate_types
        super(*kwargs.keys)
      end

      def call(object)
        @getable = object.respond_to? :[]
        result =
          @keys.zip(@types).each_with_object({}) do |(sym, ty), acc|
            val = extract(sym, object)
            acc[sym] = typecheck(val, ty)
          end
        @getable = nil
        result
      end

      def validate_types
        validate @types, Class
      end
    end
  end
end
