class Game

  attr_reader :map, :movements, :killed, :situation, :found_flag
  attr_accessor :execution_time

  def initialize(map_number:)
    @map = Map.new(map_number: map_number)
    @current_position_row, @current_position_col = @map.initial_position
    @movements = 0
    @killed    = 0
    @found_flag = false
  end

  def left
    @movements += 1
    try_to_move(
      row: @current_position_row,
      col: @current_position_col - 1
    )
  end

  def right
    @movements += 1
    try_to_move(
      row: @current_position_row,
      col: @current_position_col + 1
    )
  end

  def up
    @movements += 1
    try_to_move(
      row: @current_position_row - 1,
      col: @current_position_col
    )
  end

  def down
    @movements += 1
    try_to_move(
      row: @current_position_row + 1,
      col: @current_position_col
    )
  end

  def current_position
    [@current_position_row, @current_position_col]
  end

  def move(row, col)
    @movements += 5
    try_to_move(
      row: row,
      col: col
    )
  end

  def guess(position)
    @found_flag = (position == @map.flag_position)
  end

  private

  def try_to_move(row:, col:)
    @situation = @map.move(row: row, col: col)

    if @situation.in?([:safe, :win])
      @current_position_row = row
      @current_position_col = col
    else
      @killed += 1
    end

    @situation
  end
end
