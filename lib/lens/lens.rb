# frozen_string_literal: true

module Sorta
  # Lens builder
  class Lens
    def self.todo!
      raise StandardError, "Unimplemented!"
    end

    def self.typed
      new.typed
    end

    def self.indifferent
      new.indifferent
    end

    def self.on(...)
      new.on(...)
    end

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

    def on(...)
      case [@indifferent, @typed]
      when [true, true]
        todo!
      when [true, false]
        todo!
      when [false, false]
        Untyped.new(...)
      when [false, true]
        Typed.new(...)
      end
    end
  end
end
