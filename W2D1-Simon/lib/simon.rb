class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn(*args)
    show_sequence
    require_sequence
    @sequence_length += 1
    round_success_message unless game_over
  end

  def show_sequence
    add_random_color
    p seq
    sleep(2)
    system ("clear")
  end

  def require_sequence
    user_sequence = []

    while user_sequence.length < sequence_length
    puts "Please repeat sequence that was displayed, one color at a time"
    user_sequence << gets.chomp
    end

    @game_over = true if user_sequence != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! Let's move on to next round!"
  end

  def game_over_message
    puts "Sorry, you guessed incorrectly! Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end
