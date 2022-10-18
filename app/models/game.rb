class Game

  def initialize(map_number:)
    @map = Map.new(map_number: map_number)
    @current_position_x, @current_position_y = @map.initial_position
  end

  def up
    try_to_move(
      x: @current_position_x,
      y: @current_position_y + 1
    )
  end

  def down
    try_to_move(
      x: @current_position_x,
      y: @current_position_y - 1
    )
  end

  def left
    try_to_move(
      x: @current_position_x - 1,
      y: @current_position_y
    )
  end

  def right
    try_to_move(
      x: @current_position_x + 1,
      y: @current_position_y
    )
  end

  def best_track
  end

  private

  def try_to_move(x:, y:)
    result = @map.move(x: x, y: y)

    if result.in?([:safe, :win])
      @current_position_x = x
      @current_position_y = y
    end

    puts "Nueva posición: [#{@current_position_x}, #{@current_position_y}]"
    result
  end
end
