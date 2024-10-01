seed_date = Date.today

trading_start_hour = 9
trading_end_hour = 17

(trading_start_hour..trading_end_hour).each do |hour|
  time = seed_date.to_time.change(hour:)
  value = rand(100.0..200.0).round(2)

  PotatoTrade.create(time:, value:)
end

puts "done seeding for #{seed_date}."
