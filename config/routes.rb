Rails.application.routes.draw do
  resources :weathers do
    collection do
      post 'import'
    end
  end

  resources :citibikes do
    collection do
      # Rails will now recognize /citibikes/import with POST and will route to the import action in CitibikesController
      post 'import'
    end
  end

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
