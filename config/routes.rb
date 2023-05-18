Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # filter out routes
  resources :flashcards
  resources :flashcard_sets
  resources :userlangs
  resources :languages

   #  flashcard set
  get "/continue", to: "flashcard_sets#continue"
  get "/review_content", to: "flashcard_sets#review_content"
  get "/titles", to: "flashcard_sets#titles"
  get "/types", to: "flashcard_sets#types"
  patch "/complete", to: "flashcard_sets#update"

  #flashcard
  get "/next#id", to: "flashcards#next"

  # content management system
  post "/vocab", to: "cms#vocab"

  # book uploader
  post "/upload", to: "book#upload"
  post "/test", to: "book#create"
end
