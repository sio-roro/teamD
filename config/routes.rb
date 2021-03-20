Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'hello#index'
  get 'post/index'
  get "post/new"=>"post#new"
  post 'posts' => 'post#create'
  post "post/gacha"=>"post#gacha",as:"gacha"
  post "user/add/:id"=>"users#add",as:"add"
  resources :users, :only => [:show]
  get "user/mypage" => "users#mypage"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
