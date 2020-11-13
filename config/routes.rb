Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :prototypes do  #ネストは、アソシエーション先のレコードのidをparamsに追加してコントローラーに送るため
    resources :comments, only: :create
  end
  resources :users, only: :show #userにするとルーティングエラー
end
