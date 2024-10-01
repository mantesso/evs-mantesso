class PotatoTradesController < ApplicationController
  before_action :validate_date_param

  def index
    date = potato_params[:date]
    @prices = PotatoTrade.where('DATE(time) = ?', date)
    render json: @prices.as_json(only: %i[time value])
  end

  def max_profit
    date = potato_params[:date]
    @prices = PotatoTrade.where('DATE(time) = ?', date)
    # todo.
  end

  private

  def potato_params
    params.permit(:date)
  end

  def validate_date_param
    return if params[:date].present?

    render json: { error: 'Date parameter is required.' }, status: :bad_request
  end
end
