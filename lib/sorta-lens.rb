# frozen_string_literal: true

require 'lens/lens'
require 'lens/typed_lens'
require 'lens/untyped'

module Sorta
  # Type error
  class TypeError < RuntimeError
    def initialize(expected_ty, actual_ty)
      super "Unexpected type. Expected #{expected_ty} got #{actual_ty}"
    end
  end

  def self.todo!
    raise StandardError, 'Unimplemented!'
  end
end
