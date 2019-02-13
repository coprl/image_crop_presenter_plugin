require_relative 'image_crop/component'

module Voom
  module Presenters
    module Plugins
      module ImageCrop
        module DSLComponents
          def image_crop(**attributes, &block)
            self << ImageCrop::Component.new(parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def render_image_crop(comp, render:, components:, index:)
            view_dir = File.join(__dir__, 'image_crop')
            render.call :erb, :component, views: view_dir,
                      locals: {comp: comp,
                                components: components, index: index}
          end
        end
      end
    end
  end
end