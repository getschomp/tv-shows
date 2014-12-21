TvShows::Application.routes.draw do
  resources :television_shows do
    resources :characters
  end

  root to: 'television_shows#index'
end
