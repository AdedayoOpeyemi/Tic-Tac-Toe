# class Game
# win_combination = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
#   def win_check(win_combination, player_record)
#     win_combination.each do |win|
#       win.all? { |win1| player_record.include?(win1) }
#     end
#   end
# end  
# ADD THE NEXT AS A METHOD
#   if win_check(win_combination, current_player.record)
#     puts '#{current_player.name} is the winner for this round'
#     game_on = false
#   end