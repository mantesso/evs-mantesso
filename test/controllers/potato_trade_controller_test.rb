require 'test_helper'

class PotatoTradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date = '2024-01-01'
    @trade1 = PotatoTrade.create!(time: "#{@date} 10:00:00".to_datetime, value: 150.5)
    @trade2 = PotatoTrade.create!(time: "#{@date} 13:00:00".to_datetime, value: 200.5)
  end

  test 'should get index with valid date' do
    get potato_trades_url, params: { date: @trade1.time.to_date.to_s }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal 2, json_response.size
  end

  test 'should get error on index without date' do
    get potato_trades_url
    assert_response :bad_request
    json_response = JSON.parse(@response.body)
    assert_equal 'Date parameter is required.', json_response['error']
  end

  test 'should calculate max profit with valid date' do
    get max_profit_potato_trades_url, params: { date: @trade1.time.to_date.to_s }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_not_nil json_response['max_profit']
    assert_equal @trade1.time.to_date.to_s, json_response['date']
  end

  test 'should get error on max profit without date' do
    get max_profit_potato_trades_url
    assert_response :bad_request
    json_response = JSON.parse(@response.body)
    assert_equal 'Date parameter is required.', json_response['error']
  end

  test 'should calculate max profit correctly' do
    expected_max_profit = (200.5 - 150.5) * PotatoTrade::TRADE_LIMIT

    get max_profit_potato_trades_url, params: { date: @date.to_s }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_not_nil json_response['max_profit']
    assert_equal expected_max_profit, json_response['max_profit'].to_f
  end
end
