Rails.application.routes.draw do
  root 'words#index'

  resources :words do
    collection do
      get 'search'
    end

    member do
      post 'create_comment'
    end
  end
end