class Map
  attr_reader :initial_position, :flag_position, :width, :height

  def initialize(map_number: )
    map_config = YAML.load_file("config/maps/map#{map_number}.yml")
    @initial_position = map_config['initial_position']
    @flag_position    = map_config['flag_position']
    @width            = map_config['width']
    @height           = map_config['height']
    @obstacles        = map_obstacles(map_config['obstacles'])
  end

  def move(row:, col:)
    if [row,col] == @flag_position
      return :win
    end

    if row < 0 || col < 0 || row == @width || col == @height
      return :out_of_limit
    end

    if there_is_an_obstacle?(row: row, col: col)
      return :dead
    end

    return :safe
  end

  def there_is_an_obstacle?(row:, col:)
    @obstacles.dig(row, col)
  end

  private

  def map_obstacles(raw_obstacles)
    raw_obstacles.each_with_object({}) do |obstacle, hash|
      row_position = obstacle[0]
      col_position = obstacle[1]

      hash[row_position] ||= {}
      hash[row_position][col_position] = true

      hash
    end
  end

end

