containers = gets.chomp
size = gets.chomp.to_i
result = []

containers = containers.split(',').map{|n| n.to_i}.compact.sort.reverse

num_of_combination = containers.inject(:+) >= size ? containers.size : ( size % containers[0] == 0 ? size / containers[0] : ( size / containers[0] ) + 1 )

valid_combinations = containers.repeated_combination(num_of_combination).to_a

valid_combinations = valid_combinations.reject { |combination| combination.inject(:+) < size }

result = valid_combinations.select { |combination| combination.inject(:+) == size }

if result.size > 0
	result.each {|r| puts r.join(' ')}
else
	puts valid_combinations[-1].join(' ')
end
