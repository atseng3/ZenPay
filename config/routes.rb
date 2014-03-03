Portfolio::Application.routes.draw do
  resources :static_pages
  resources :users, :only => [:create, :new, :show, :index, :edit, :update]
  resource :session, :only => [:create, :destroy, :new]
  root :to => "static_pages#index"
end
