# config/routes.rb
Rails.application.routes.draw do
  root 'words#index'

  resources :words do
    collection do
      get 'search'
    end
  end
end