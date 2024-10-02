require 'test_helper'

class PotatoTradeTest < ActiveSupport::TestCase
  def setup
    @date = '2024-01-01'
    @potato_trade = PotatoTrade.new(time: "#{@date} 10:00:00".to_datetime, value: 150.5)
    @invalid_time = @potato_trade.time.change(hour: 20) # outside trading hours
  end

  test 'valid potato trade' do
    assert @potato_trade.valid?
  end

  test 'invalid without time' do
    @potato_trade.time = nil
    assert_not @potato_trade.valid?
    assert_includes @potato_trade.errors[:time], "can't be blank"
  end

  test 'invalid without value' do
    @potato_trade.value = nil
    assert_not @potato_trade.valid?
    assert_includes @potato_trade.errors[:value], "can't be blank"
  end

  test 'value must be greater than 0' do
    @potato_trade.value = -10
    assert_not @potato_trade.valid?
    assert_includes @potato_trade.errors[:value], 'must be greater than 0'
  end

  test 'invalid trading hour' do
    @potato_trade.time = @invalid_time
    assert_not @potato_trade.valid?
    assert_includes @potato_trade.errors[:time], 'must be within trading hours (9 AM to 5 PM)'
  end
end
