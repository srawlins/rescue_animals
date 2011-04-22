Refinery::Application.routes.draw do
  resources :success_stories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :success_stories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
