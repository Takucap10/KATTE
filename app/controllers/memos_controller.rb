class MemosController < ApplicationController
    before_action :set_room
    before_action :set_memo, only: [:edit, :update, :destroy]

  def index
    @memos = @room.memos.order('created_at ASC')
  end

  def index2
  end

  def new
    @memo = @room.memos.new
  end

  def create
    @memo = @room.memos.new(memo_params)
    if @memo.save
      redirect_to room_memos_path(@room)
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
    redirect_to root_path
    else
    render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end
  
  private
  def memo_params
    params.require(:memo).permit(:item, :info).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_memo
    @memo = @room.memos.find(params[:id])
  end

end
