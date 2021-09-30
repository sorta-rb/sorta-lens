# frozen_string_literal: true

module Sorta
  class Lens
    module Typechecker
      def typecheck(val, ty)
        return val if val.is_a?(ty)

        raise TypeError.new val.class, ty
      end
    end

    module Validator
      # what the fuck
      def self.[](*args)
        mod_name = "Validator#{args.to_s.tr("[] ,", "")}"
        if const_defined? mod_name
          const_get mod_name
        else
          mod = Module.new do
            def validate_keys
              validate @keys, self.class.const_get(:KEY_TYPES)
            end

            def validate_types
              validate @types, [Class]
            end

            def validate(thing, expected)
              thing.each do |sym|
                unless expected.include? sym.class
                  raise ArgumentError,
                        "Unexpected argument #{sym.class}, must be #{expected}"
                end
              end
            end
          end
          mod.const_set(:KEY_TYPES, args)

          const_set(mod_name, mod)
        end
      end
    end

    module Extractor
      def extract(sym, object)
        if @getable
          object[sym]
        elsif object.respond_to? sym
          object.send(sym)
        else
          raise ArgumentError, "Object #{object} does not support extracting symbol #{sym}"
        end
      end
    end
  end
end
