require 'voom/presenters/dsl/components/image'

module Voom
  module Presenters
    module Plugins
      module ImageCrop
        class Component < DSL::Components::Image
          def initialize(**attribs_, &block)
            @crop_attrs = %w(crop_x crop_y crop_width crop_height)
            super(type: :image_crop, **attribs_, &block)
          end
        end
      end
    end
  end
end