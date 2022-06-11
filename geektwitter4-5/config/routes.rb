Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  get 'tweets/page1' => 'tweets#page1'
  get 'tweets/page2' => 'tweets#page2'
  get 'tweets/page3' => 'tweets#page3'
  get 'tweets/page4' => 'tweets#page4'
  get 'tweets/page5' => 'tweets#page5'
  get 'tweets/page6' => 'tweets#page6'
  get 'tweets/article' => 'tweets#article'

  resources :tweets
  
  get 'pv_ranking', to: 'tweets#pv_ranking'
  
end
