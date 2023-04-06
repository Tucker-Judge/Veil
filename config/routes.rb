Rails.application.routes.draw do
  # filter out routes
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

  #  flashcard set
  get "/continue", to: "flashcard_sets#continue"
  get "/review_content", to: "flashcard_sets#review_content"
  get "/titles", to: "flashcard_sets#titles"
  get "/types", to: "flashcard_sets#types"
  #flashcard
  get "/next#id", to: "flashcards#next"
end
