class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    before_action :set_event, only: [:show, :edit, :update]
  
    # Affiche tous les événements
    def index
      @events = Event.all
    end

    def join
      @event = Event.find(params[:id])
    end
  
    # Affiche les détails d'un événement spécifique
    def show
    end
  
    # Initialise un nouvel événement pour le formulaire de création
    def new
      @event = current_user.events.build
    end
  
    # Traite la soumission du formulaire de création d'événement
    def create
      @event = current_user.events.build(event_params)
      if @event.save
        redirect_to @event, notice: 'L\'événement a été créé avec succès.'
      else
        render :new
      end
    end
  
    # Initialise l'événement pour le formulaire d'édition
    def edit
    end
  
    # Met à jour l'événement
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'L\'événement a été mis à jour avec succès.'
      else
        render :edit
      end
    end
  
    private
  
    # Définit l'événement pour les actions 'show', 'edit', et 'update'
    def set_event
      @event = Event.find(params[:id])
    end
  
    # Définit les paramètres autorisés pour un événement
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
    end
  end
  