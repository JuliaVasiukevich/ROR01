class ExchangeService
  API_HOST = 'https://www.freeforexapi.com/api/live'

  def fetch_rates
    currency_request = Curl.get(API_HOST)
    currency = JSON.parse(currency_request.body)
    currencies = []

    currency.dig('supportedPairs').map do |element|
      currencies << element.slice(0, 3)
      currencies << element.slice(3, element.length)
    end

    currencies.uniq
  end

  def get_exchange(from, to, number)
    currency = [from, to].join
    current_rate = Currency.where(name: currency).last
    if data_expired? (current_rate)
      current_rate = get_updated_rates(currency, number)
    end

    result = number.to_f * current_rate.rate
    "Your exchange from #{from} to #{to} is #{result.round(2)}."
  end

  def get_updated_rates(currency, number)
    currency_request = Curl.get(API_HOST + "?pairs=#{currency}")
    result = JSON.parse(currency_request.body)
    raise StandardError.new('Sorry, currency doesn\'t exist or smt went wrong :(') if result.dig('code') != 200
    rate = result.dig('rates', currency, 'rate')
    Currency.create(name: currency, rate: rate)
  end

  def data_expired?(current_rate)
    !current_rate || current_rate.updated_at < 1.minute.ago
  end
end