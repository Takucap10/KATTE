class MemosController < ApplicationController
    before_action :set_room

  def index
    @memos = Memo.order('created_at DESC')
  end

  def new
    @memo = @room.memos.new
  end

  def create
    @memo = @room.memos.new(memo_params)
    if @memo.save
      redirect_to room_memos_path(@room)
    else 
      @memos = @room.memos.includes(:user)
      render :new
    end
  end
  
  private
  def memo_params
    params.require(:memo).permit(:item, :info).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
