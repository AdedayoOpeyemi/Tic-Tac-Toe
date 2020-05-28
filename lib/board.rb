class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    # return " #{board[0]} | #{board[1]} | #{board[2]}",
    #      '-' * 11,
    #      " #{board[3]} | #{board[4]} | #{board[5]}",
    #      '-' * 11,
    #      " #{board[6]} | #{board[7]} | #{board[8]}"

    "#{board[0]} | #{board[1]} | #{board[2]}" \
     "\n-----------\n" \
      "#{board[3]} | #{board[4]} | #{board[5]}" \
       "\n-----------\n" \
        "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def input_board(player, input)
    @board[input.to_i - 1] = player.sign
  end
end
