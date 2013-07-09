require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    rect_mode CENTER
    ellipse_mode CENTER
    background(0, 0, 0)
    @size=10
    @queue=""
    smooth
  end

  def draw
    # Do Stuff
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"
    if !key.is_a?(String)
      return "This is not a string"
    end


    if key=="+"
      @size+= 100
    elsif key == "-"
      @size-=100
    elsif key != "\n"
      @queue= @queue + key
    else 
        warn "time to run the command #{@queue}"
        run_command(@queue)
        @queue=""
    end
  end 

  def run_command(command)
      puts "Running Command #{command}"
      if command.start_with?("b")
        length = command.length - 1
        color = command[1..length]
        three_colors = color.split(",")
        num1= three_colors[0].to_i
        num2= three_colors[1].to_i
        num3= three_colors[2].to_i
        background(num1,num2,num3)
      elsif command.start_with?("s")
        @shape=command.chomp
      end



    end

  def mouse_dragged
    fill(rand(200..256),rand(200..256),rand(200..256))
    stroke(rand(0), rand(256), rand(256))

    case @shape
     when "s1" then rect(mouse_x, mouse_y, @size, @size)
     when "s2" then rect(mouse_x, mouse_y, @size*2, @size*2)
     when "s3" then oval(mouse_x, mouse_y, @size, @size)
    else
      warn "I dont know that command"
    end
  end
end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)