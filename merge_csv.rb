require 'csv'

read_csv = CSV.read('sample1.csv')
read_csv += CSV.read('sample2.csv')

duplication_data = read_csv.select{ |i| read_csv.count(i) > 1 }
duplication_data = duplication_data.uniq
read_csv.uniq!

marge_csv = CSV.open('marged.csv','w')
for data in read_csv
  marge_csv.puts data
end
marge_csv.close
puts "重複：#{duplication_data}"
