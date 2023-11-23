Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirm'
    get 'customers/leave'
  end
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: "homes#top"
  get 'about'=>"homes#about",as: "about"


scope module: :public do
  resources :items, only:[:index, :show]
  get 'customers/my_page', to: 'customers#show'
  get 'customers/information/edit', to:'customers#edit'
  patch 'customers/information' , to:'customers#update'
  get 'customers/confirm' , to:'customers#confirm'
  patch 'customers/leave' , to:'customers#leave'

  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete 'cart_items/destroy_all'
  resources :orders, only:[:new, :create, :index, :show]
  post 'oders/confirm'
  get 'oders/completion'
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
 end

  get 'admin',to:'admin/home#top'
  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update,:index]
    resources :order_details, only:[:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
