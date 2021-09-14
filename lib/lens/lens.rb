# frozen_string_literal: true

# Extracts data from a given object
class Lens
  def self.on(*args)
    new(*args)
  end

  def initialize(*args)
    @args = args
    validate_arguments
    define_call
  end

  def define_call
    define_singleton_method :call do |object|
      @args.each_with_object({}) do |sym, acc|
        acc[sym] = object.send(sym)
      rescue NoMethodError
        acc[sym] = object[sym]
      end
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
