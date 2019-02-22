require 'voom/presenters/dsl/components/image'

module Voom
  module Presenters
    module Plugins
      module ImageCrop
        class Component < DSL::Components::Image
          attr_accessor :aspect_ratio, :max_width, :max_height, :min_width, :min_height, :size_unit

          def initialize(**attribs_, &block)
            super(type: :image_crop, **attribs_, &block)

            @aspect_ratio = attribs.delete(:aspect_ratio)
            @max_width = attribs.delete(:max_width)
            @max_height = attribs.delete(:max_height)
            @min_width = attribs.delete(:min_width)
            @min_height = attribs.delete(:min_height)
            @size_unit = attribs.delete(:size_unit)
          end
        end
      end
    end
  end
end