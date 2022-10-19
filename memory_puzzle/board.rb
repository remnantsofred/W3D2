require_relative "./card.rb"


class Board

    attr_reader :size
    
    def initialize(size = 4)
        @board = Array.new(size) { Array.new(size)}
        if size > 25 
            raise 'too bad! so sad! no play for you :('
        end
        @size = size * size
        populate
    end


    def populate_cards
        new_array = []
        alphabet = ("a".."z").to_a
        i = 0
        while i < @size / 2
            new_array << alphabet[i] << alphabet[i]
            i += 1     
        end
        new_array
    end

    def populate        
        positions = []
        cards_array = populate_cards.shuffle

        @board.each.with_index do |row, i|
            row.each.with_index do |col, j|
                @board[i][j] = Card.new(cards_array.pop)
            end
        end
    end

    def render
        @board.each do |row|
            new_row = []
            row.each do |card|
                if card.face_direction == "true"
                    new_row << card.face_value
                else
                    new_row << "_"
                end
            end
            puts new_row.join(" ")
        end
    end

    def won?
        @board.all? {|row| row.all?{|col| col.face_direction }}
    end

    def reveal(guessed_pos) #[0, 0]
        # print @board[guessed_pos[0], guessed_pos[1]]
        if @board[guessed_pos[0]][guessed_pos[1]].reveal 
            @board[guessed_pos[0]][guessed_pos[1]].card_info
        end
    end

    def is_valid?(guessed_pos)
        return false unless guessed_pos[0] < @board.length && guessed_pos[1] < @board.length
        return true if @board[guessed_pos[0]][guessed_pos[1]].face_direction == false
    end



end