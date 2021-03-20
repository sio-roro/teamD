Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'hello#index'
  get 'post/index'
  get "post/new"=>"post#new"
  post 'posts' => 'post#create'
  post "post/gacha"=>"post#gacha",as:"gacha"
  post "user/add/:id"=>"users#add",as:"add"
  patch "user/set"=>"users#set",as:"set"
  post "user/anser/:id"=>"users#anser",as:"anser"

  resources :users, :only => [:show]
  get "user/mypage" => "users#mypage"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
