require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @p1 = Player.new(name1, 13)
    @p2 = Player.new(name2, 6)
    @cups = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14){ [:stone, :stone, :stone, :stone] } # 14 cups
    [@cups[6], @cups[13]].each(&:clear)
  end

  def valid_move?(start_pos)
    start_pos -= 1
    raise "Invalid starting cup" if [6, 13].include?(start_pos) || !start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    #start_pos -= 1 if start_pos.between?(7, 12)
    stones = @cups[start_pos].count
    @cups[start_pos] = []

    nxt_i = start_pos

    until stones == 0
      nxt_i += 1
      nxt_i = 0 if nxt_i > 13

      if ((nxt_i == 13 && @p2.name != current_player_name)  ||
          (nxt_i == 6 && nxt_i == 6 && @p1.name != current_player_name))
        next
      end

      stones -= 1
      @cups[nxt_i] << :stone
    end

    render
    next_turn(nxt_i)
  end


  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    end
    return :switch if @cups[ending_cup_idx].count == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    sides = [@cups[0..5], @cups[7..12]]
    sides.any?{ |s| s.all?(&:empty?) }
  end

  def winner
    #return false unless one_side_empty?
    return @p1.name if @cups[6].count > @cups[13].count
    return @p2.name if @cups[13].count > @cups[6].count
	return :draw if @cups[13].count == @cups[6].count
  end
end
