class PotatoTradesController < ApplicationController
  before_action :validate_date_param

  def index
    date = potato_params[:date]
    potato_trades = PotatoTrade.where('DATE(time) = ?', date)
    render json: potato_trades.as_json(only: %i[time value])
  end

  def max_profit
    date = potato_params[:date]
    prices_arr = fetch_prices_for_date(date)

    calculator = PotatoTradeMaxProfitCalculator.new(prices_arr)
    max_profit = calculator.max_profit * PotatoTrade::TRADE_LIMIT

    render json: { date:, max_profit: }
  end

  private

  def potato_params
    params.permit(:date)
  end

  def validate_date_param
    return if params[:date].present?

    render json: { error: 'Date parameter is required.' }, status: :bad_request
  end

  # returns an array of price values for a given date
  def fetch_prices_for_date(date)
    PotatoTrade.where('DATE(time) = ?', date).pluck(:value)
  end
end
