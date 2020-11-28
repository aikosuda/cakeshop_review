Rails.application.routes.draw do
  get 'genres/show'
  # メインページルーティング
  root 'home#top'
  get 'home/about' => 'home#about'

  # 会員用ルーティング
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  resource :customers, only: [:edit, :update]
    #マイページ表示
  get 'customers/my_page' => 'customers#show'

    #退会処理
  get 'customers/unsubscribe' => 'customers/unsubscribe'
  patch 'customers/withdraw' => 'customers/withdraw'


  resources :products, only: [:show, :index]
  resources :genres, only: [:show]
  resources :orders, only: [:new, :index, :create, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :shippings, only: [:index, :create, :edit, :update, :destroy]

  resources :cart_items, only: [:create, :index, :update, :destroy] do
    #カート空にする
    collection do
      delete 'destroy_all'
    end
  end



  # 管理者用ルーティング
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'home/top' => 'home#top'
    #検索結果表示用
    get 'search' => 'customers#search'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

end
