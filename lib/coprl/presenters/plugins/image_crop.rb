require_relative 'image_crop/component'

module Coprl
  module Presenters
    module Plugins
      module ImageCrop
        module DSLComponents
          def image_crop(**attributes, &block)
            self << ImageCrop::Component.new(parent: self, **attributes, &block)
          end
        end

        module WebClientComponents

          def view_dir_image_crop(pom)
            File.join(__dir__, '../../../../views/image_crop')
          end

          def render_image_crop(comp, render:, components:, index:)
            render.call :erb, :image_crop, views: view_dir_image_crop(components),
                        locals: {comp: comp,
                                 components: components, index: index}
          end

          # The string returned from this method will be added to the HTML header section of the page layout
          # It will be called once for the page.
          # The pom is passed along with the sinatra render method.
          def render_header_image_crop(pom, render:)
            render.call :erb, :image_crop_header, views: view_dir_image_crop(pom)
          end
        end
      end
    end
  end
end
