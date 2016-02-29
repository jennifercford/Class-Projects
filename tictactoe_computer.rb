
require "pry"

board = [1,2,3,4,5,6,7,8,9]

 WINS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8,],[3,6,9],[1,5,9],
 [3,5,7]]
## ruby doc map (awin), board[index], uniq
def greeting
  puts
  puts "Welcome to Tic Tac Toe"
  puts "Lets Play"
  #puts "Player X your up first"
  puts
end
def game_choice
  puts "Single player Game or Two? (1/2)"
  choice = gets.chomp.to_i
  # until ["1","2"].include?(choice)
  #  puts "Please choose '1'or '2'."
  #   choice = gets.chomp.downcase.to_i
  # end
  choice
end
#binding.pry

def available_moves(board)
  board.select { |piece| piece.is_a?(Fixnum) }
end
def turn(current_player,board, game_type)
  display_board(board)
  if game_type == 2
    puts "Player #{current_player} please pick a space"
  number = gets.chomp.to_i
  until available_moves(board).include?(number)
    puts "You have to choose an available board position. Please pick again."
    number = gets.chomp.to_i
  end
  elsif game_type == 1 && current_player == "O"
    number = available_moves(board).sample.to_i
  # until availible_moves(board).include?(number)
    # end
  else game_type == 1 && current_player == "X"
    puts "Player #{current_player} please pick a space"
  number = gets.chomp.to_i
  until available_moves(board).include?(number)
    puts "You have to choose an available board position. Please pick again."
    number = gets.chomp.to_i
  end
end
  number
end

def game_over?(board)
  win?(board) || draw?(board)
end
def draw?(board)
  board.all? { |piece| piece.is_a?(String) }
end
def win?(board)
  WINS.any? do |x, y, z|
  board[x-1] == board[y-1] && board[y-1] == board[z-1]
end
end

def tictactoe(board)
  # puts "Player X enter your name"
  #   playerX = gets.chomp.capitalize
  # puts "Player O enter your name"
  #   playerO = gets.chomp.capitalize
  players = {playerX:"X", playerO:"O"}
  current_player = players[:playerX]
  #turn_count = 9
  greeting
  game_type = game_choice
  until game_over?(board)#calls on invariant MAX_TURNS & WINS
    #display_board(board)#this will be how show progress
    #turn(current_player) = space_number
    space_number = turn(current_player,board, game_type)#when player picks
    board[space_number-1]=current_player
    #turn_count -= 1
    unless game_over?(board)
    if current_player == players[:playerX]
      current_player = players[:playerO]
    else
      current_player = players[:playerX]
    end
  end
  end
  postmortem(board, current_player)
end
#binding.pry

def display_board(board)
  puts "
  #{board[0]} | #{board[1]} | #{board[2]}
  #{board[3]} | #{board[4]} | #{board[5]}
  #{board[6]} | #{board[7]} | #{board[8]}
  "
end

def postmortem(board, current_player)
  if win?(board)
  puts "Congrats! Player #{current_player} you won!"
  else draw?(board)
  puts "Aww its a draw better luck next time!"
end
display_board(board)
play_again?
end
#board[0] = "x"
#tictactoe(board)
def play_again?
  board=[1,2,3,4,5,6,7,8,9]
  puts "Want to play agian? (y/n)"
  choice = gets.chomp.downcase.to_s
   until ["y", "n"].include?(choice)
     puts "Please choose 'Y' or 'N'."
     choice = gets.chomp.downcase.to_s
   end
  if choice == "y"
  tictactoe(board)
  else
    puts "Thats ok Bye!"
  end
end

#
# def play
#   more = play_again?
# while more == true
# tictactoe(board)
# end
#   more = play_again?
# end

tictactoe(board)
