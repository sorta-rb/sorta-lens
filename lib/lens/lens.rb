# frozen_string_literal: true

require_relative "builder"

module Sorta
  # Public API
  module Lens
    # @return [Untyped]
    def self.on(...)
      Builder.new.on(...)
    end

    # @return [Builder]
    def self.typed
      Builder.new.typed
    end

    # @return [Builder]
    def self.indifferent
      Builder.new.indifferent
    end

    # @return [Builder]
    #
    # @example
    #   lens = Sorta::Lens.build.typed.on(foo: String)
    #   lens.call(foo: 'Bar')
    #
    def self.build
      Builder.new
    end
  end
end
