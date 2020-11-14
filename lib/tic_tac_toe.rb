class TicTacToe
    attr_accessor :board
    def initialize
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5], 
        [6,7,8], 
        [0,4,8], 
        [2,4,6], 
        [0,3,6], 
        [1,4,7], 
        [2,5,8]
]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(move)
        index = move.to_i - 1
        index
    end

    def move(index, token) 
        self.board[index] = token 
    end  

    def position_taken?(index)
        if self.board[index] == "X" || self.board[index] == "O"
            true 
        else 
            false 
        end 
    end 
    def valid_move?(index) 
        if self.board[index] == "X" || self.board[index] == "O" || !index.between?(0,8)
            false 
        else 
            true 
        end 
    end

    def turn_count
        self.board.count {|x| x == "X" || x == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter a number from (1-9): "
        user_input = gets.strip
        choice = input_to_index(user_input)
        if valid_move?(choice)
            move(choice, current_player)
        else
            turn
        end
        display_board
    end

    def won?(board)
        WIN_COMBINATIONS.each do |win_combo|
          #check for player 1 win
          if check_win_combination?(board, 'X', win_combo)
            return win_combo
            #check for player 2 win
          elsif check_win_combination?(board, 'O', win_combo)
            return win_combo
          else
            false
          end
        end

        def check_win_combination?(board, player, win_combo)
            win_combo.all? do |position|
              board[position] == player
            end
          end
      end



end
