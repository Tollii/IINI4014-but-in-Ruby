

def archimedesPI iterations = 10
	if iterations >= 501;
		puts "Please choose a lower number"
		return nil
	end

	length_of_side = 1
	number_of_sides = 6
	pi = 0
	iterations.times do |x|
		half_side = length_of_side.to_f / 2.0
		a = Math.sqrt(1 - (half_side ** 2))
		b = 1 - a
		new_side = Math.sqrt((b ** 2) + (half_side ** 2))
		perimiter = number_of_sides * length_of_side
		pi = perimiter.to_f / 2.0
		length_of_side = new_side
		number_of_sides *= 2
	end
	return pi
end

#---------------------------

p archimedesPI