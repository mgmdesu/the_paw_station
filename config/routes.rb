Rails.application.routes.draw do
  
  namespace :admin do
    get 'homes/top'
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
