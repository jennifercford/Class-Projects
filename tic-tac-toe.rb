
require "pry"

board = [1,2,3,4,5,6,7,8,9]

 WINS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8,],[3,6,9],[1,5,9],
 [3,5,7]]
## ruby doc map (awin), board[index], uniq

#DATA IN THE system
# *board
# *player1
# def show_board(board)
#   3.times do |row|#do this 3 times
#     puts " board[row * 3, 3].join(" | ") " #take 3 things from array and put space and pipe btwn
#   end
# end
def greeting
  puts
  puts "Welcome to Tic Tac Toe"
  puts "Lets Play"
  puts
  # puts "Player X enter your name"
  #   playerX = gets.chomp.capitalize
  # puts "Player O enter your name"
  #   playerO = gets.chomp.capitalize
  # puts "Player X your up first!"
end
#binding.pry
def turn(current_player)
  puts "Player #{current_player} please pick a space"
  number = gets.chomp.to_i
  number
end
def game_over?(board, turn_count)
  win?(board) || turn_count.zero?
end

def win?(board)
WINS.any? do |x, y, z|
  board[x-1] == board[y-1] && board[y-1] == board[z-1]
end
end
  # if board[0..3] do each.chars
  #   win=true
  #  if board[0] == board[1] && board[1] == board[2]
  #        win = true
  #      elsif board[3] == board[4] && board[4] == board[5]
  #        win = true
  #      elsif board[6] == board[7] && board[7] == board[8]
  #        win = true
  #      elsif board[0] == board[3] && board[3] == board[6]
  #          win = true
  #     elsif board[1] == board[4] && board[4] == board[7]
  #          win = true
  #     elsif board[2] == board[5] && board[5] == board[8]
  #          win = true
  #     elsif board[0] == board[4] && board[4] == board[8]
  #          win = true
  #     else board[2] == board[4] && board[4] == board[6]
  #          win = true
  #        end
  #   win = false
  # end

# def tie?(turn_count)
#   turn_count=0
# end
#
# def win?(board)
#   if
#   end
# end

def tictactoe(board)
  #If I track players and truns , don't need guesses
  # puts "Player X enter your name"
  #   playerX = gets.chomp.capitalize
  # puts "Player O enter your name"
  #   playerO = gets.chomp.capitalize
  players = {playerX:"X", playerO:"O"}
  current_player = players[:playerX]
  turn_count = 9
  greeting
  until game_over?(board,turn_count)#calls on invariant MAX_TURNS & WINS
    display_board(board)#this will be how show progress
    #turn(current_player) = space_number
    space_number = turn(current_player)#when player picks
    board[space_number-1]=current_player
    turn_count -= 1
    unless game_over?(board,turn_count)
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
puts "Congrats! Player #{current_player} you won!"
display_board(board)
end
#board[0] = "x"
tictactoe(board)

#binding.pry
