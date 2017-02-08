require 'csv'

auto = Category.create(name: "Automotive")
food = Category.create(name: "Food & Wine")
tech = Category.create(name: "Technology")

user = User.create(email: "roger@gmail.com", password: "password")

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Post.new
  p.user_id = row['user_id']
  p.category_id = row['category_id']
  p.title = row['title']
  p.body = row['body']
  puts "#{p.title} saved!" if p.save
end
