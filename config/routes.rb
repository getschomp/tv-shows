TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create] do
    resources :characters
  end

  root to: 'television_shows#index'
end
