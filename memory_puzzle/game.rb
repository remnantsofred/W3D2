class Game

    def initialize(size)
        @board = Board.new(size)
        # @guessed_pos = guessed_pos
    
    end

    def get_position
        puts "please enter a position like '2 3'"
        p gets.chomp.split(" ").map(&:to_i)
    end

    def play 
        #render board
        @board.render 
        #prompt user to get a position
        # 2.times do 
        #     if is_valid?(self.get_position)
        #         previous_guess = @board.reveal(get_position)
        #     end
        #check if the position is valid?
        
        #flip card if position is valid & it's not flipped
        #ask for another position
        #check if the two positions are equal to each other
        #if true, loop play
        #if false, flip both cards back to false
        #loop again until won?
    end

    def make_guess(guessed_pos)
        previous_guess = nil
        if previous_guess == nil
            @board.reveal(guessed_pos)
            previous_guess = guessed_pos
        else 
            if @board[previous_guess[0]][previous_guess[1]].face_value == @board[guessed_pos[0]][guessed_pos[1]].face_value 
                @board[previous_guess[0]][previous_guess[1]].reveal && @board[guessed_pos[0]][guessed_pos[1]].reveal
            else
                @board[previous_guess[0]][previous_guess[1]].hide && @board[guessed_pos[0]][guessed_pos[1]].hide
            end
        end
        previous_guess = nil
    end



end