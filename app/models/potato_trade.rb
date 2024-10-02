class PotatoTrade < ApplicationRecord
  TRADE_LIMIT = 100

  validates :time, presence: true, uniqueness: true
  validates :value, presence: true, numericality: { greater_than: 0 }
  validate :trading_hours

  private

  def trading_hours
    return if time.nil?
    return if (9..17).include?(time.hour)

    errors.add(:time, 'must be within trading hours (9 AM to 5 PM)')
  end
end
