class Game_status
WIN_COMBINATION = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]]

  def win_check(board)
    WIN_COMBINATION.detect do |win|
        board[win[0] - 1] == board[win[1] - 1] &&
          board[win[1] - 1] == board[win[2] - 1]          
    end
  end

  def valid_move?(input, board)
    input.to_i > 0 &&
    input.to_i < 10 &&
    board[input.to_i - 1].is_a?(Integer)
  end

  def draw?(counter)
    counter == 9
  end

end
