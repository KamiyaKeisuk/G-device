Rails.application.routes.draw do

  #管理者側のルーティング
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :customers, except: [:new, :create, :destroy]
    resources :devices, except: [:destroy] do
      resources :reviews, only: [:show, :destroy]
    end
    resources :categories, except: [:new, :show, :destroy]
    resources :makers, except: [:new, :show, :destroy]
    resources :contacts, only: [:show, :destroy]

    get "/device_search", to: "admin/searches#device_search"
    get "/category_search", to: "admin/searches#category_search"
    get "/maker_search", to: "admin/searches#maker_search"
  end

  #会員側のルーティング
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  scope module: :customer do
    root to: "homes#top"
    get "/about", to: "homes#about"
    resources :contacts, only: [:new, :create] do
      collection do
        get :complete
      end
    end
    resources :devices, only: [:index, :show] do
      resources :reviews, except: [:index] do
        resources :review_likes, only: [:create, :destroy]
        resources :review_comments, only: [:create, :destroy]
      end
    end

    get "/customers/mypage", to: "customers#show"
    get "/customers/mypage/edit", to: "customers#edit"
    patch "/customers/mypage/update", to: "customers#update"
    put "/customers/mypage/update", to: "customers#update"
    get "/customers/quit", to: "customers#quit"
    patch "/customers/withdraw", to: "customers#withdraw"
    put "/customers/withdraw", to: "customers#withdraw"

    get "/device_search", to: "searches#device_search"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
