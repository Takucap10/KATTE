class RoomsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_memos_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def set_item
    @room = Room.find(params[:id])
  end
end
