# Binance::Ruby::Api

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/binance/ruby/api`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binance-ruby-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binance-ruby-api

## Usage

```ruby
# system status
Binance::System.status

# market information
Binance::Market.ping
Binance::Market.server_time
Binance::Market.exchange_info
Binance::Market.orderbook(symbol: 'BTCUSDT', limit: 200)
Binance::Market.aggTrades(symbol: 'BTCUSDT', params: { limit: 10 })
Binance::Market.klines(symbol: 'BTCUSDT', interval: '1h', params: {limit: 100})
Binance::Market.ticker # get ticker for all symbols
Binance::Market.ticker(symbol: 'BTCUSDT')
Binance::Market.ticker_price
Binance::Market.ticker_price(symbol:'BTCUSDT')
Binance::Market.orderbook_ticker(symbol:'BTCUSDT')
Binance::Market.orderbook_ticker

ENV['BINANCE_PUBLIC_API_KEY'] = 'xxxxxx'
# historical trades require public api key
Binance::Market.historical_trades(symbol: 'BTCUSDT', limit: 5, from_id: 222256836)

# user information

ENV['BINANCE_PUBLIC_API_KEY'] = 'xxxxxx'
ENV['BINANCE_PRIVATE_API_KEY'] = 'yyyyy'
# showing all coins information
Binance::Account.all_coins

#show account balance
Binance::Account.snapshot(type: 'SPOT')
Binance::Account.balance(type: 'SPOT')

# withdraw coin
puts Binance::Account.withdraw(
  asset: 'BNB',
  address: 'bnbxxxx',
  amount: '0.01',
  params: {
    addressTag: '11111',
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/binance-ruby-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Binance::Ruby::Api project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/binance-ruby-api/blob/master/CODE_OF_CONDUCT.md).
