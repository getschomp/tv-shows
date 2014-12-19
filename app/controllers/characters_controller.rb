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
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show_id = @television_show.id
    if @character.save
      redirect_to @television_show, notice: "character sucessfully created."
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description, :television_show_id)
  end
end
