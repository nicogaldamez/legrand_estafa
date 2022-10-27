class GameController < ApplicationController
  def index
    if params[:map]
      @game = Gameplay
        .new(team_number: params[:team], map_number: params[:map])
        .play
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
