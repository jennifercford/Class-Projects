
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
  puts "Player X your up first!"
end
#binding.pry
def turn(current_player,number)
  puts "Player #{current_player} please pick a space"
  number = gets.chomp.to_i
  number
end
def game_over?(current_player, board, turn_count)
  win?(current_player, board) || turn_count.zero?
end

def win?(board, current_player)
      if board[0] == board[1] && board[1] == board[2]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[3] == board[4] && board[4] == board[5]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[6] == board[7] && board[7] == board[8]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[0] == board[3] && board[3] == board[6]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[1] == board[4] && board[4] == board[7]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[2] == board[5] && board[5] == board[8]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[0] == board[4] && board[4] == board[8]
          puts
          puts "#{currentplayer} wins!"
          win = true
      elsif board[2] == board[4] && board[4] == board[6]
          puts
          puts "#{currentplayer} wins!"
          win = true
      else
        win = false
      end
      win
  end

# def turn_count(board, turn)
#   board
#   turn = #number of strings in the array
#   MAX_TURNS-turn
# end
# def tie?(turn_count)
#   turn_count=0
# end
#
# def win?(board)
#   if
#   end
# end

def tictactoe(board, current_player, space_number)
  #If I track players and truns , don't need guesses
  players = {playerX:"X", playerO:"O"}
  current_player = players[:playerX]
  turn_count = 9
  greeting
  until game_over?(current_player,board,turn_count)#calls on invariant MAX_TURNS & WINS
    display_board(board)#this will be how show progress
    space_number = turn(current_player, number)#when player picks
    board[space_number-1]=current_player[:playerX]
    turn_count -= 1
    if current_player == players[:playerX]
      current_player = players[:playerO]
    else
      current_player = players[:playerX]
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
tictactoe(board,current_player,space_number)

#binding.pry
