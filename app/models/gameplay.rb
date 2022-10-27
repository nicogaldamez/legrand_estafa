class Gameplay

  def initialize(team_number:, map_number:)
    @team = "Team#{team_number}".constantize.new
    @game = Game.new(map_number: map_number)
  end

  def play
    time = Benchmark.realtime do
      @team.play(@game)
    end

    @game.execution_time = time

    @game
  end
end
