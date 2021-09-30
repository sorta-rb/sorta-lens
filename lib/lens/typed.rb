# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Typed
      include Sorta::Lens::Validator[Symbol]
      include Sorta::Lens::Extractor
      include Sorta::Lens::Typechecker

      def self.on(...)
        new(...)
      end

      def initialize(**kwargs)
        @types = kwargs.values
        validate_types
        @keys = kwargs.keys
        validate_keys
      end

      def call(object)
        @getable = object.respond_to? :[]
        result =
          @keys.zip(@types).each_with_object({}) do |(sym, ty), acc|
            acc[sym] = extract(sym, object).then do |val|
              typecheck(val, ty)
            end
          end
        @getable = nil
        result
      end
    end
  end
end
