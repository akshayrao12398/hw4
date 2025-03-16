class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_place

  def new
    @entry = @place.entries.build
  end

  def create
    @entry = @place.entries.build(entry_params)
    @entry.user = @current_user

    if @entry.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find_by(id: params[:place_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end