Rails.application.routes.draw do
  resources :watchables, param: :watchable_id, only: [:index, :show] do
    member do
      resources :episodes, only: [:index]
      get 'season/:season_number' => 'episodes#season', as: :season
      get 'season/:season_number/episode/:episode_number' => 'episodes#show', as: :episode
    end
  end
end
