Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'root#index'
  get '/about', to:"root#about", as:"about"
  get '/my_jobs', to:"my_jobs#index"
  post '/save_job/:id', to: 'root#save_job', as:"save_job"
  post '/remove_job/:id', to: 'root#remove_job', as:"remove_job"
  get '/post/:id', to:"root#view_post", as:"view_post"
  delete '/remove_history_item/:id', to: 'root#remove_history_item'
  get '/company/:company_slug', to: 'root#view_company', as: "view_company"
  get '/settings', to:"users#settings", as:"user_settings"
  patch '/update_settings', to:"users#update_settings", as:"update_user_settings"

  resources :resumes do
    member do
      get :download_json
    end
    collection do
      get :new_category
      get :preview
      post :preview
    end
  end
end
