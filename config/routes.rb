Rails.application.routes.draw do
  resources :potato_trades, only: [:index] do
    collection do
      get 'max_profit'
    end
  end
end
