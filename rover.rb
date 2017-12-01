class Rover

  def initialize(x,y)
    @x = x
    @y = y
    @x_coor = rand(1..x)
    @y_coor = rand(1..x)
    possible_directions = ["N", "E", "S", "W"]
    @direction = possible_directions.sample

  end

  def read_instructions
    puts "What are your directions?"
    puts "(Valid instructions are L,R,M)"
    answer = gets.chomp
    answer.chars.each do |instruction|
      if instruction == "L" || instruction == "R"
        turn(instruction)
      elsif instruction == "M"
        move
      else puts "'#{instruction}' was not a valid command, passed over..."
      end
    end
    puts "#{x_coor} #{y_coor} #{direction}"
  end

  def move
    if direction == "N"
      @y_coor += 1
    elsif direction == "S"
      @y_coor -= 1
    elsif direction == "E"
      @x_coor += 1
    elsif direction == "W"
      @x_coor -= 1
    end
    if @x_coor == 0
      @x_coor = @x
      puts "traveled around the world"
    elsif @x_coor == @x + 1
      @x_coor = 1
      puts "traveled around the world"
    elsif @y_coor == 0
      @y_coor = @y
      puts "traveled around the world"
    elsif @y_coor == @y + 1
      @y_coor = 1
      puts "traveled around the world"
    end

  end

  def turn(side)

    if side == "L"
      if direction == "N"
        @direction = "W"
      elsif direction == "W"
        @direction = "S"
      elsif direction == "S"
        @direction = "E"
      elsif direction == "E"
        @direction = "N"
      end
    end

    if side == "R"
      if direction == "N"
        @direction = "E"
      elsif direction == "E"
        @direction = "S"
      elsif direction == "S"
        @direction = "W"
      elsif direction == "W"
        @direction = "N"
      end
    end
  end
#Readers

  def direction
    @direction
  end

  def x_coor
    @x_coor
  end

  def y_coor
    @y_coor
  end


  end

puts "What is the horizontal size of the board?"
x = gets.chomp
puts "What is the vertical size of the board?"
y = gets.chomp

rover = Rover.new(x.to_i,y.to_i)
choice = nil
  puts "#{rover.x_coor} #{rover.y_coor} #{rover.direction}"
  until choice == "n"
  rover.read_instructions
  puts "Any more instructions? (y/n)"
  choice = gets.chomp

  if choice == "n"
    puts "Goodbye, shutting down at x-position #{rover.x_coor} y-position #{rover.y_coor} facing #{rover.direction}."
  end
end
