# frozen_string_literal: true

require_relative "typed"
require_relative "untyped"

module Sorta
  # Lens builder
  module Lens
    class Builder
      def initialize
        @typed = false
        @indifferent = false
      end

      def typed
        @typed = true
        self
      end

      def indifferent
        @indifferent = true
        self
      end

      # @return [Typed, Untyped]
      def on(...)
        case [@indifferent, @typed]
        when [true, true]
          raise NotImplementedError
        when [true, false]
          raise NotImplementedError
        when [false, false]
          Untyped.new(...)
        when [false, true]
          Typed.new(...)
        end
      end
    end
  end
end
