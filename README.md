# Mastodon::Spam::Activity::Rejecter

Reject spam activity for Mastodon 

## Installation

```Gemfile
gem 'mastodon-spam-activity-rejecter', github: 'S-H-GAMELINKS/mastodon-spam-activity-rejecter', branch: :master
```

```ruby
class ActivityPub::Activity::Create < ActivityPub::Activity
  prepend Mastodon::Spam::Activity::Rejecter

　# ...
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mastodon-spam-activity-rejecter.

## License

The gem is available as open source under the terms of the [AGPL License](https://opensource.org/licenses/AGPL).

## Original Author

[rosylilly](https://github.com/rosylilly)

## Original Code

[Reject spammer](https://github.com/best-friends/mastodon/pull/1941)

[mastodon/mastodon](https://github.com/mastodon/mastodon)

