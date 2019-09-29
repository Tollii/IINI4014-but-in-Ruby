def is_prime n
	return false if n == 1 or n == 0 or (n > 2 and n % 2 == 0)
	return true if n == 2
	max_divisor = Math.sqrt(n).floor

	for d in (3...max_divisor).step(2) do
		if n % d == 0
			return false
		end
		return true
	end
end

#---------------------------

1000.times do |x|
	if is_prime x
		puts "#{x} is a prime number!"
	end
end