[![Gem Version](https://badge.fury.io/rb/raise_to_slack.svg)](https://badge.fury.io/rb/raise_to_slack)

# RaiseToSlack

Simply raise error messsage to slack

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raise_to_slack'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install raise_to_slack

## Usage

Create your slack app, add bot user, install to your workspace, and take Bot User OAuth Access Token.

Give environment variables, RAISE_TO_SLACK_OAUTH2_TOKEN(=Bot User OAuth Access Token), RAISE_TO_SLACK_CHANNEL_NAME(e.g. #notify).

And write code such as:

```ruby
RaiseToSlack.run do
  your_awesome_job
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/raise_to_slack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RaiseToSlack project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/raise_to_slack/blob/master/CODE_OF_CONDUCT.md).
