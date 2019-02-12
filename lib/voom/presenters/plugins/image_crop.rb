require_relative 'image_crop/component'

module Voom
  module Presenters
    module Plugins
      module ImageCrop
        module DSLComponents
          def image_cropper(**attributes, &block)
            self << ImageCrop::Component.new(**attributes, &block)
          end

          module WebClientComponents
            def render_image_crop(comp, render:, components:, index:)
              view_dir = File.join(__dir__, 'image_crop')
              render.call :erb, :image_crop, views: view_dir,
                        locals: {comp: comp,
                                 components: components, index: index}
            end
          end
        end
      end
    end
  end
end