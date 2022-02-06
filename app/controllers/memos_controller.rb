class MemosController < ApplicationController

  def index
    @memos = Memo.order('created_at DESC')
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else render :new
  end

end
