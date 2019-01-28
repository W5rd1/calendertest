Rails.application.routes.draw do
  root to: "calendar#show"
  resources :events
  resources :calendar, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
