class PotatoTradeMaxProfitCalculator
  def initialize(prices)
    @prices = prices
  end

  # 2 pointer algo
  def max_profit
    return 0 if @prices.length < 2

    left = 0  # best time to buy
    right = 1 # best time to sell
    max_profit = 0
    while right < @prices.length
      if @prices[left] < @prices[right]
        profit = @prices[right] - @prices[left]
        max_profit = [profit, max_profit].max
      else
        left = right
      end
      right += 1
    end
    max_profit
  end
end
