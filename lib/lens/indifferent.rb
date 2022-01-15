# frozen_string_literal: true

module Sorta
  module Lens
    # Extracts data from a given object
    class Indifferent
      include Sorta::Lens::Validator
      include Sorta::Lens::Extractor
      @@KEY_TYPES = [Symbol, String]
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
          acc[sym.to_sym] = extract(sym, object)
        end
        @getable = nil
        result
      end
    end
  end
end
