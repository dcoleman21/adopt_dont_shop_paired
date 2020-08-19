Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'

  # this route must come later or else app will think that any path after /shelters/ is an id and will try and use the show action when we don't want it to (ex: new)
  get '/shelters/:id', to: 'shelters#show'
end
