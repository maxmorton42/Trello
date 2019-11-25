class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]
  def index
    @boards = Board.all_boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
     @board = Board.create_board(board_params)
   
      redirect_to boards_path

  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  def update
    if @board.update(board_params)
      redirect_to board_path
    else
      render :edit
    end
  end

  def set_board
  @board = Board.single_board(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end

