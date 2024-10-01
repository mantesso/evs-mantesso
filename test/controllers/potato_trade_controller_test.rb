require "test_helper"

class PotatoTradeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get potato_trade_index_url
    assert_response :success
  end

  test "should get max_profit" do
    get potato_trade_max_profit_url
    assert_response :success
  end
end
