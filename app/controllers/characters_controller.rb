class CharactersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tv_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new
  end

  def create

  end

  private

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description, :television_show_id)
  end
end
