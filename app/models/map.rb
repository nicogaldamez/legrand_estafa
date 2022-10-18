class Map
  attr_reader :initial_position

  def initialize(map_number: )
    map_config = YAML.load_file("config/maps/map#{map_number}.yml")
    @initial_position = map_config['initial_position']
    @flag_position    = map_config['flag_position']
    @width            = map_config['width']
    @height           = map_config['height']
    @obstacles        = map_obstacles(map_config['obstacles'])
    puts @obstacles
  end

  def move(x:, y:)
    if [x,y] == @flag_position
      return :win
    end

    if x < 0 || y < 0 || x > @width || y > @height
      return :out_of_limit
    end

    if @obstacles.dig(x, y)
      return :dead
    end

    return :safe
  end


  private

  def map_obstacles(raw_obstacles)
    raw_obstacles.each_with_object({}) do |obstacle, hash|
      x_position = obstacle['position'][0]
      y_position = obstacle['position'][1]

      hash[x_position] ||= {}
      hash[x_position][y_position] = obstacle['image_url']

      hash
    end
  end

end

