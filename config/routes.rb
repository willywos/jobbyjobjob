Rails.application.routes.draw do
  devise_for :users
  root 'root#index'
  get '/about', to:"root#about", as:"about"
  get '/my_jobs', to:"my_jobs#index"
  post '/save_job/:id', to: 'root#save_job'
  post '/remove_job/:id', to: 'root#remove_job'
  post '/search', to:"root#search", as:"search"
  get '/post/:id', to:"root#view_post", as:"view_post"

  resources :resumes do 
    collection do 
      get :new_category
    end
  end
end
