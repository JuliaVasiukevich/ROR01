require 'exchange_service'

class CurrencyController < ApplicationController
  API_HOST = 'https://www.freeforexapi.com/api/live'

  def initialize
    @exchange_service = ExchangeService.new
    super
  end

  def currency
    render plain: @exchange_service.fetch_rates
  end

  def exchange
    from = params[:from]
    to = params[:to]
    number = params[:acc]
    begin
      result = @exchange_service.get_exchange(from, to, number)
    rescue StandardError => e
      return render plain: e.message
    end

    render plain: result
  end
end