class TicTacToe
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [6,4,2]]

def initialize
    @board = Array.new(9," ")
end
def input_to_index(input)
    index = input.to_i-1            # to_i - 1 converts sting to integer
end
def move(index, play_token = "X")
    @board[index] = play_token
end
def position_taken?(index)
    @board[index] != " "
end
def move( index, play_token = "X")
    @board[index] = play_token
end 
def position_taken?(index)
    @board[index] != " "
end
def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) #! checks the opposite of position taken is it taken!
end
def turn_count
    @board.count {|space| space == "X"|| space == "O"}
end
def current_player
    turn_count.even?  ? "X" : "O"
end
def turn
   index = input_to_index(gets.chomp)
   if valid_move?(index)
    move(index, current_player)
    display_board
   else
    turn
   end
end
def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all?{|square| square != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end



def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end



end