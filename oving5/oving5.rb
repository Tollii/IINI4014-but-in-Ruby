module TextScanner

	# Returns a hash with each word in file as key and # of occurences as value
	def self.get_word_frequency filename
		begin 
			file = File.open filename
		rescue
			Dir.chdir get_file_directory filename
			retry
		end
		word_hash = {}
		file_data = file.readlines.map &:chomp
		file_data.each do |line| 
			line.split.each do |word|
				downcase = word.downcase
				if word_hash.has_key? downcase; word_hash[downcase] += 1 else word_hash[downcase] = 1 end
			end
		end
		file.close
		return word_hash
	end

	# Returns a list of line numbers where word is contained
	def self.get_line_with_word filename, word
		begin 
			file = File.open filename
		rescue
			Dir.chdir get_file_directory filename
			retry
		end
		line_counter = 0
		line_list = []
		file_data = file.readlines.map &:chomp
		file_data.each do |line|
			line_counter += 1
			if line.include? word; line_list.append line_counter end
		end
		return line_list
	end

	private

	# Returns the relative directory of filename
	def self.get_file_directory filename
		file_directory = nil
		Dir.glob('**/*') { |f| file_directory = f.to_s if f.to_s.split("/")[-1] == filename}
		file_directory = file_directory.split "/"
		file_directory.pop
		return file_directory.join "/"
	end
end

#---------------------------

#TextScanner::get_word_frequency "random.txt"
#TextScanner::get_line_with_word "random.txt", "Ghost"

