# frozen_string_literal: true

module Sorta
  class Lens
    module Typechecker
      def typecheck(val, ty)
        return val if val.is_a?(ty)

        raise TypeError.new val.class, ty
      end
    end

    module Validator
      @@KEY_TYPE = Symbol
      def validate_keys
        validate @keys, @@KEY_TYPE
      end

      def validate_types
        validate @types, Class
      end

      def validate(thing, expected)
        thing.each do |sym|
          unless sym.is_a?(expected)
            raise ArgumentError,
                  "Unexpected argument #{sym.class}, must be #{expected}"
          end
        end
      end
    end

    module Extractor
      def extract(sym, object)
        if @getable
          object[sym]
        elsif object.respond_to? sym
          object.send(sym)
        else
          raise ArgumentError, "Object #{object} does not support extracting symbol #{sym}"
        end
      end
    end
  end
end
