Rails.application.routes.draw do

  # devise_for :podcasts

  devise_for :podcasts, :path => '', :path_names => {:sign_in => 'signin', :sign_out => 'signout', :sign_up => 'signup', :edit => 'edit'}

  resources :podcasts, only: [:index, :show] do
    resources :episodes
  end

  authenticated :podcast do
    root 'podcasts#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'

end
