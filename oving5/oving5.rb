class TextScanner
	def self.get_word_frequency filename
		Dir.chdir get_file_directory filename
		word_hash = {}
	end

	def self.get_line_with_word filename, word
		Dir.chdir get_file_directory filename
	end



	def get_file_directory filename
		file_directory = nil
		 Dir.glob('**/*') { |f| file_directory = f.to_s if f.to_s.split("/")[-1] == filename}
		  file_directory = file_directory.split("/")
		  file_directory.pop
		  file_directory.join("/")
	end
end

#---------------------------

TextScanner.get_file_directory "84-0.txt"
TextScanner.get_word_frequency "84-0.txt", "shall"

