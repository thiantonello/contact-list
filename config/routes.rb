# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get 'users' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/edit' => 'users#edit'
  put 'users/update' => 'users#update'
  delete 'users/destroy' => 'users#destroy'
  get 'users/:id' => 'users#show', as: :user
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
