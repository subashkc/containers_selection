puts "*" * 10 + " Enter available containers size, separated by comma " + "*" * 10
containers = gets.chomp
puts "*" * 10 + " Enter load size " + "*" * 10
size = gets.chomp.to_i
result = []
valid_combinations = []

# sort the containers in descending order
containers = containers.split(',').map{|n| n.to_i}.compact.sort.reverse

# find out the minimum number of containers required
min_num_of_containers = containers.sort[0] > size ? 1 : 2

# find all the valid possible combinations of containers distribution
min_num_of_containers.upto(containers.size) do |n|
	valid_combinations << containers.repeated_combination(n).to_a
end

# flatten the combination to have 1 parent array with sub arrays each representing a possible combination of containers
valid_combinations = valid_combinations.inject(:+)

# reject combinations whose total sum doesn't equal to load size
valid_combinations = valid_combinations.reject { |combination| combination.flatten.inject(:+) < size }

# try to find perfect matches
results = valid_combinations.select { |combination| combination.flatten.inject(:+) == size }

# try to find best case combinations if no perfect matches found
results = valid_combinations.select { |combination| combination.flatten.inject(:+) >= size } if results.empty?

# find the smallest array size in the mix of results
smallest_array_length = results.sort_by{ |result| result.length }[0].length

# try to find optimum size for minimizing loss of container space
valid_length = results.reject { |result| result.length > smallest_array_length }.sort[0].inject(:+)

# reject those combinations which do not match the number of containers or minimum loss criteria
results = results.reject { |result| result.length > smallest_array_length || result.inject(:+) != valid_length }

if results.size > 0
	results.each {|r| puts r.join(' ')}
else
	puts valid_combinations[-1].join(' ')
end
