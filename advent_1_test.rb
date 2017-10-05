load 'advent_1.rb'

puts 'First example'
blocks_away_1 = Path.new('R2, L3').run
puts blocks_away_1 == 5

puts 'Second example'
blocks_away_2 = Path.new('R2, R2, R2').run
puts blocks_away_2 == 2

puts 'Third example'
blocks_away_3 = Path.new('R5, L5, R5, R3').run
puts blocks_away_3 == 12

puts 'Fourth example'
blocks_away_4 = Path.new('R8, R4, R4, R8')
blocks_away_4.run
puts 4 == blocks_away_4.first_location_away

puts "\nFinal output\n"
directions = 'R3, L5, R1, R2, L5, R2, R3, L2, L5, R5, L4, L3, R5, L1, R3, R4, R1, L3, R3, L2, L5, L2, R4, R5, R5, L4, L3, L3, R4, R4, R5, L5, L3, R2, R2, L3, L4, L5, R1, R3, L3, R2, L3, R5, L194, L2, L5, R2, R1, R1, L1, L5, L4, R4, R2, R2, L4, L1, R2, R53, R3, L5, R72, R2, L5, R3, L4, R187, L4, L5, L2, R1, R3, R5, L4, L4, R2, R5, L5, L4, L3, R5, L2, R1, R1, R4, L1, R2, L3, R5, L4, R2, L3, R1, L4, R4, L1, L2, R3, L1, L1, R4, R3, L4, R2, R5, L2, L3, L3, L1, R3, R5, R2, R3, R1, R2, L1, L4, L5, L2, R4, R5, L2, R4, R4, L3, R2, R1, L4, R3, L3, L4, L3, L1, R3, L2, R2, L4, L4, L5, R3, R5, R3, L2, R5, L2, L1, L5, L1, R2, R4, L5, R2, L4, L5, L4, L5, L2, L5, L4, R5, R3, R2, R2, L3, R3, L2, L5'
blocks_away = Path.new(directions)
blocks_away.run

puts "Total blocks away: #{blocks_away.total_blocks_away}"
puts "First cross away: #{blocks_away.first_location_away}"
