Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # filter out routes
  resources :flashcards
  resources :flashcard_sets
  resources :userlangs
  resources :languages

  
  #user
  #  post "/signup", to: "users#create"
  #  get "/me", to: "users#me"
  #  get "/profile", to: "users#me"
  #  post "/login", to: "sessions#create"
  #  delete "/logout", to: "sessions#destroy"
  #  post "/validate", to: "sessions#validate"
   
   #  flashcard set
  get "/continue", to: "flashcard_sets#continue"
  get "/review_content", to: "flashcard_sets#review_content"
  get "/titles", to: "flashcard_sets#titles"
  get "/types", to: "flashcard_sets#types"
  #flashcard
  get "/next#id", to: "flashcards#next"
end
