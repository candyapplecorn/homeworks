require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(actual = nil)
    @actual = actual
    @seq = []
    @sequence_length = @seq.length + 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    input = require_sequence || [COLORS.sample]

    @game_over = true if input.any?{|c| !@seq.include?(c)} || input != @seq

    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    p @seq.join(' ')
  end

  def require_sequence
    if @actual
      return gets.chomp.split(' ')
    end

    @seq << COLORS.sample
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "Success!"
  end

  def game_over_message
    p "After #{@sequence_length} rounds, you lose!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
    Simon.new(true).play
end
