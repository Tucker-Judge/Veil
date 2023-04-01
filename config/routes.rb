Rails.application.routes.draw do
  resources :flashcards
  resources :flashcard_sets
  resources :userlangs
  resources :languages
  resources :users
  
  #user
   post "/signup", to: "users#create"
   get "/me", to: "users#me"
   post "/login", to: "sessions#create"
   delete "/logout", to: "sessions#destroy"
   get "/profile", to: "users#me"

  # 
end
