
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "image_crop_presenter_plugin/version"

Gem::Specification.new do |spec|
  spec.name          = "image_crop_presenter_plugin"
  spec.version       = ImageCropPresenterPlugin::VERSION
  spec.authors       = ["Dennis Monsewicz", "Russell Edens"]
  spec.email         = ["dennismonsewicz@gmail.com", "russell@voomify.com"]

  spec.summary       = "A COPRL presenters plugin for image cropping"
  spec.homepage      = "https://github.com/coprl/image_crop_presenter_plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
