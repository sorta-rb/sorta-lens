# frozen_string_literal: true

module Sorta
  class Lens
    module Refines
      module Getter
        refine Object do
          # @example
          #   lens = Sorta::Lens.on(:a, :b)
          #   object
          #     .method
          #     .on(lens)
          #
          def on(lens)
            lens.call(self)
          end

          # @example
          #   lens = Sorta::Lens.on(:a, :b)
          #   collection.map_on(lens)
          #
          def map_on(lens)
            map { |e| lens.call(e) }
          end
        end
      end
    end
  end
end
