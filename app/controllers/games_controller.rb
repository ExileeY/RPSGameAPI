class GamesController < ApplicationController
  def create_or_show
    @game = Game.find_or_initialize_by(uuid: params[:uuid])

    if @game.new_record?
      @game.update(game_params)
      render json: { result: @game.result }, status: :created
    else
      render json: { result: @game.result }, status: :ok
    end
  end

private

  def game_params
    params.require(:game).permit(
      :user_choice,
      :computer_choice
    )
  end
end
