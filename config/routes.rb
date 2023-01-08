Rails.application.routes.draw do

  #ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    
    resource :users, only: [:show, :edit, :update] do
      get 'unsubscribe'
      patch 'withdraw'
    end
    
    resources :walks do
      resources :walk_comments, only: [:create, :destroy]
      get :bookmarks, on: :collection
      resource :bookmarks, only: [:index, :create, :destroy]
    end 
    
    resources :post_dogs do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end 
    
    resources :groups
    
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
  
  #管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
