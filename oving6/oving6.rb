module WordSorter


  def self.sort_words filename
    begin
      file = File.open filename
    rescue
      Dir.chdir get_file_directory filename
      retry
    end
    sortList = []

    file_data = file.readlines.map &:chomp
    file_data.each do |line|
      line.split.each do |word|
        sortList.append(word.gsub(/[^0-9A-Za-z]/, ''))
      end
    end

    n = sortList.size - 1
    n.times do |i|
      index_min = i
      i.next.upto n do |j|        
        index_min = j if sortList[j].length < sortList[index_min].length
      end
      sortList[i], sortList[index_min] = sortList[index_min], sortList[i] if index_min != i
    end

    swapped = true
    while swapped do
      swapped = false
      (sortList.length - 1).times do |i|
        if sortList[i] > sortList[i.next]
         sortList[i], sortList[i.next] = sortList[i.next], sortList[i]
         swapped = true
        end
      end
    end
    return sortList
  end

  def self.get_file_directory filename
    file_directory = nil
	Dir.glob('**/*') { |f| file_directory = f.to_s if f.to_s.split("/")[-1] == filename}
	file_directory = file_directory.split "/"
	file_directory.pop
	return file_directory.join "/"
  end
end

p WordSorter::sort_words "random.txt"
