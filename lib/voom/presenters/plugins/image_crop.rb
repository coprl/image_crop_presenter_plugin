require_relative 'image_crop/component'

module Voom
  module Presenters
    module Plugins
      module ImageCrop
        module DSLComponents
          def image_crop(**attributes, &block)
            self << ImageCrop::Component.new(**attributes, &block)
          end
        end
      end
    end
  end
end