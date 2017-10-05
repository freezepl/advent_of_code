class Path
  attr_reader :total_blocks_away, :first_location_away

  def initialize(directions)
    @directions_array = directions.split(', ')
    @degree = 0
    @vector_array = [[0, 0]]
    @last_point = [0, 0]
    @total_blocks_away = nil
    @first_location_away = nil
    @points_array = []
  end

  def run
    @directions_array.each do |way|
      direction, distance = way.split(/(\d+)/)

      calc_degree(direction)

      distance = distance.to_i
      x = @last_point[0]
      y = @last_point[1]

      case @degree
      when 0
        vector = [x, y + distance]
      when 90
        vector = [x + distance, y]
      when 180
        vector = [x, y - distance]
      when 270
        vector = [x - distance, y]
      end

      @vector_array << vector

      set_first_location(@last_point, vector) if @first_location_away.nil?

      @last_point = @vector_array.last.to_a
    end

    @total_blocks_away = block_distance(@vector_array.last)
  end

  def calc_degree(direction)
    @degree += 90 if direction == 'R'
    @degree -= 90 if direction == 'L'

    if @degree == 360
      @degree = 0
    elsif @degree == -90
      @degree = 270
    end
  end

  def set_first_location(last_point, vector)
    points = calc_points(last_point, vector.to_a)

    points.each do |point|
      @first_location_away = block_distance(point) if @points_array.include?(point)
      @points_array << point
    end
  end

  def block_distance(vector_array)
    vector_array.inject(0) { |sum, x| sum + x.abs }
  end

  def calc_points(point1, point2)
    range_x = *(point1[0]..point2[0])
    range_x = *(point2[0]..point1[0]) if range_x.empty?

    range_y = *(point1[1]..point2[1])
    range_y = *(point2[1]..point1[1]) if range_y.empty?

    points = []

    if range_x.size == 1
      range_y.each { |y| points << [range_x[0], y] }
    else
      range_x.each { |x| points << [x, range_y[0]] }
    end

    points - [point1]
  end
end
