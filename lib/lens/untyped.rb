# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Untyped
      include Sorta::Lens::Validator
      include Sorta::Lens::Extractor

      def self.on(...)
        new(...)
      end

      def initialize(*keys)
        @keys = keys
        validate_keys
      end

      def call(object)
        @getable = object.respond_to? :[]
        result = @keys.each_with_object({}) do |sym, acc|
          acc[sym] = extract(sym, object)
        end
        @getable = nil
        result
      end
    end
  end
end
