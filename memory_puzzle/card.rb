require_relative "./board.rb"

class Card

    attr_reader :face_value, :face_direction
    

    def initialize(face_value)
        @face_value = face_value
        @face_direction = false
    end

    def card_info
        if @face_direction == true
            @face_value
        end
    end

    def hide
        @face_direction = false
    end

    def reveal
        @face_direction = true
    end
end