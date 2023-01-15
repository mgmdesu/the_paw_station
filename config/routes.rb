Rails.application.routes.draw do
  
  #ユーザー側
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #ゲストユーザー
  devise_scope :user do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  #ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    
    resources :users, only: [:show, :edit, :update] do
      get 'unsubscribe'
      patch 'withdraw'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :bookmarks
      end 
    end
  
    resources :walks do
      resources :walk_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:index, :create, :destroy]
    end 
    
    resources :post_dogs do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end 
    
    resources :groups, except: [:destroy] do
      resource :group_users, only: [:create, :destroy]
    end
    
    get '/search' => 'searches#search'
  end
  
  #管理者側
  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :edit, :update]
    resources :walks, only: [:index, :show, :destroy] do 
      resources :walk_comments, only: [:destroy]
    end
    resources :post_dogs, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end 
    resources :groups, except: [:destroy] 
  end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
end