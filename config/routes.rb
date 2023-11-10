# config/routes.rb
Rails.application.routes.draw do

  Rails.application.routes.draw do
    root 'words#index'
  
    resources :words do
      post 'create_comment', on: :member
    end
  end
end
