module Sorta
  class LensBuilder
    def self.typed
      new.typed
    end

    def self.indifferent
      new.indifferent
    end

    def self.build(arg)
      new.build(arg)
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

    def build(arg)
      case [@indifferent, @typed]
      when [true, true]
      when [true, false]
      when [false, false]
        Lens.new(*arg)
      when [false, true]
        TypedLens.new(**arg)
      end
    end
  end
end
