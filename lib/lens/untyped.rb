# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Untyped
      def self.on(...)
        new(...)
      end

      def initialize(*args)
        @args = args
        validate_arguments
      end

      def call(object)
        @args.each_with_object({}) do |sym, acc|
          acc[sym] = object.send(sym)
        rescue NoMethodError
          acc[sym] = object[sym]
        end
      end

      def validate_arguments
        @args.each do |sym|
          unless sym.is_a?(Symbol)
            raise ArgumentError,
                  "Unexpected argument #{sym.class}, must be Symbol"
          end
        end
      end
    end
  end
end
