Rails.application.routes.draw do
  namespace :api do
    api_version(module: 'V1', path: { value: 'v1' }, default: true) do
      namespace :auth do
        post '/', to: 'users#create'
        post '/sign_in', to: 'sessions#create'
        patch '/refresh', to: 'sessions#update'
        delete 'sign_out', to: 'sessions#destroy'
      end

      resources :projects do
        resources :tasks, shallow: true do
          resources :comments, only: %i[index create destroy]
          patch '/complete', to: 'tasks#complete'
          patch '/position', to: 'tasks#position'
        end
      end
    end
  end
  root 'documentations#docs'
end
