# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "nokogiri"

puts "Cleaning database"
Watch.destroy_all
User.destroy_all

user1 = User.create!(email: 'felita@lewagon.com', password: '12345678', first_name: 'Felita', last_name: 'Liem')
user2 = User.create!(email: 'malia@lewagon.com', password: '12345678', first_name: 'Malia', last_name: 'Newgen')
user3 = User.create!(email: 'danish@lewagon.com', password: '12345678', first_name: 'Danish', last_name: 'Hisham')
user4 = User.create!(email: 'julian@lewagon.com', password: '12345678', first_name: 'Julian', last_name: 'Wong')
user5 = User.create!(email: 'susan@lewagon.com', password: '12345678', first_name: 'Susan Sen', last_name: 'Yeo')

Watch.create!(brand: 'Patek Philippe', model: 'Nautilus', year: 2022, price: 799.99, user: user1)
Watch.create!(brand: 'Lange & Söhne', model: 'Lange 1', year: 1986, price: 499.00, user: user2)
Watch.create!(brand: 'Audemars Piguet', model: 'Code 1165', year: 2019, price: 290.00, user: user3)
Watch.create!(brand: 'Rolex', model: 'Daytona', year: 1972, price: 1999.99, user: user1)
Watch.create!(brand: 'Audemars Piguet', model: 'Royal Oak Openwork', year: 2009, price: 850.99, user: user4)
Watch.create!(brand: 'Patek Philippe', model: 'Aquanaut', year: 2003, price: 799.99, user: user1)
Watch.create!(brand: 'Richard Mille', model: 'RM1', year: 2000, price: 1200.00, user: user1)
Watch.create!(brand: 'Cartier', model: 'Crash', year: 1967, price: 1599.00, user: user5)

# ingredient = "chocolate"
# url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search(".standard-card-new__article-title").each do |element|
#   puts element.text.strip
#   puts element.attribute("href").value
# end


# url = 'https://tmdb.lewagon.com/movie/top_rated'
# movie_url = URI.open(url).read
# movies = JSON.parse(movie_url).first(10)
# movies[1][1].each do |movie|
#   poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

#   Movie.create(title: movie['title'],
#     overview: movie['overview'],
#     poster_url: poster_url,
#     rating: movie['vote_average']
#   )
# end

# puts "Creating list..."
# list = List.create!(
#   name: 'My List'
# )

# puts 'Creating some bookmarks...'
# Bookmark.create!(
#   comment: "This is a bookmark",
#   list: list,
#   movie: Movie.first
# )

puts "Finished!"
