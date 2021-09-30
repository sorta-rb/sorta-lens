# frozen_string_literal: true

module Sorta
  class Lens
    class LensBase
      def self.on(...)
        new(...)
      end

      @@KEY_TYPE = Symbol
      def initialize(*keys)
        @keys = keys
        validate_keys
      end

      def validate_keys
        validate @keys, @@KEY_TYPE
      end

      def validate(thing, expected)
        thing.each do |sym|
          unless sym.is_a?(expected)
            raise ArgumentError,
                  "Unexpected argument #{sym.class}, must be #{expected}"
          end
        end
      end

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
