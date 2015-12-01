![communique logo](https://raw.github.com/Vestorly/communique/master/assets/logo.png)

[![Code Climate](https://codeclimate.com/github/Vestorly/communique/badges/gpa.svg)](https://codeclimate.com/github/Vestorly/communique)

Simple way to store warnings and errors affecting users as messages. Stored
messages can be linked to a helpful link so they can read more about the problem

to test it out without a rails environment
`irb -Ilib -rcommunique`
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'communique'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install communique

## Usage
`include Communique::Notifiable` in the model you want to have notifications eg. the user model.

To create a notification:
```
Communique.notify(
    @user,
    'this_is_the_action_key',
    context: 'you get some context',
    more_context: 'you get some context',
    even_more_context: 'you get some context'
    )
```

## Contributing

1. Fork it ( https://github.com/Vestorly/communique/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
