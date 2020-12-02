# RecursionStrip

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/recursion_strip`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recursion_strip'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install recursion_strip

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/recursion_strip.


给对象添加一个递归删除字符串前后空格的方法 strip!

1. ActionController::Parameters 对象删除参数前后字符串

```
ActionController::Parameters.class_eval do
  include RecursionStrip
end
```

application_controller.rb
```
before_action :strip_params

def strip_params
  params.strip!
end
```

2. Array
```
class Array
  include RecursionStrip
end

a = ["hello ", " world"]
a.strip! #=> ["hello", "world"]
```

3. instance
```
a = ["hello ", " world"]
a.instance_eval do
	class << self
		include  RecursionStrip
	end
end
a.strip!

```
