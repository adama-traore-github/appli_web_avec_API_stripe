class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      profile_path  # Redirige vers la page de profil après connexion
    end
  
    def after_sign_up_path_for(resource)
      profile_path  # Redirige vers la page de profil après inscription
    end
  end
  