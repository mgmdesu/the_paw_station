Rails.application.routes.draw do
  #ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    
    resource :users, only: [:show, :edit, :update] do
      get 'unsubscribe'
      patch 'withdraw'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  
    resources :walks do
      resources :walk_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:index, :create, :destroy]
    end 
    
    resources :post_dogs do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end 
    
    resources :groups, except: [:destroy]
    
    get 'search' => 'searches#search'
  end
  
  #管理者側
  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  #ユーザー側
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #ゲストユーザー
  devise_scope :user do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end
  
  #管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
end