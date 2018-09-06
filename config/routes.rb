Rails.application.routes.draw do
  root 'root#index'
  get '/about', to:"root#about", as:"about"
  post '/search', to:"root#search", as:"search"
  get '/post/:id', to:"root#view_post", as:"view_post"
end
