
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "image_crop_presenter_plugin"
  spec.version       = "0.1.0"
  spec.authors       = ["Dennis Monsewicz"]
  spec.email         = ["dennismonsewicz@gmail.com"]

  spec.summary       = "A plugin to add image cropping to presenters"
  spec.homepage      = "https://github.com/dennismonsewicz/image_crop_presenter_plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
