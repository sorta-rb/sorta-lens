# frozen_string_literal: true

module Sorta
  class Lens
    # Extracts data from a given object
    class Untyped < LensBase
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
