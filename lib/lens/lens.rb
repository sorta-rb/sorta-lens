# frozen_string_literal: true

# Extracts data from a given object
module Lens
  def self.on(*args)
    new args
  end

  def self.new(*args)
    lambda do |object|
      args.each_with_object({}) do |sym, acc|
        acc[sym] = object.send(sym)
      rescue NoMethodError
        acc[sym] = object[sym]
      end
    end
  end
end
