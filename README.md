# Image Crop Presenter Plugin

A plugin for [COPRL](http://github.com/coprl/presenters) to crop images.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_crop_presenter_plugin', git: 'https://github.com/coprl/image_crop_presenter_plugin', require: false
```

And then execute:

    $ bundle

## Usage

Example POM:

    plugin :image_crop

    image_crop image: 'https://cdn.mos.cms.futurecdn.net/4f6d31c116fdada59a5cb16d136e3068-970-80.jpg' do
      event :change do
        # handle the change event here
      end
    end

Use the [DEMO](https://coprl-ruby.herokuapp.com/plugins/image_crop) and view source or to get started with more examples.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coprl/chart_presenter_plugin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the COPRL project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/coprl/coprl/blob/master/CODE-OF-CONDUCT.md).
