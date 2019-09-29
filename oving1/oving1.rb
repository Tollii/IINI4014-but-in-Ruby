_name = gets.chomp
name_array = _name.split
intitials = [name_array[0][0], name_array[1][0]]

p "Welcome to Ruby #{_name}, #{intitials[0]}.#{intitials[1]}"

