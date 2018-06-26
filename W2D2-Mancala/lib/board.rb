class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    stones = [:stone, :stone, :stone, :stone]
    @cups = Array.new(14){[]}
    (0..13).each do |idx|
      next if idx == 6 || idx == 13
      cups[idx] = stones.dup
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)
    not_store_idx = 6 if current_player_name == @name2
    not_store_idx = 13 if current_player_name == @name1
    stones = @cups[start_pos]
    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      @cups[idx] << stones.pop if idx != not_store_idx
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all? { |cup| cup == [] } || @cups[7..12].all? { |cup| cup == [] }
  end

  def winner
    p1_stones = @cups[6].length
    p2_stones = @cups[13].length
    if p1_stones == p2_stones
      return :draw
    elsif p1_stones > p2_stones
      return @name1
    else
      return @name2
    end
  end
end
