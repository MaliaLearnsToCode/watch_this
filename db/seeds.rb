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
Booking.destroy_all
User.destroy_all
Review.destroy_all

puts 'Creating Users ...'
user1 = User.create!(email: 'felita@lewagon.com', password: '12345678', first_name: 'Felita', last_name: 'Liem', points: 1200)
user2 = User.create!(email: 'malia@lewagon.com', password: '12345678', first_name: 'Malia', last_name: 'Newgen', points: 1200)
user3 = User.create!(email: 'danish@lewagon.com', password: '12345678', first_name: 'Danish', last_name: 'Hisham', points: 400)
user4 = User.create!(email: 'julian@lewagon.com', password: '12345678', first_name: 'Julian', last_name: 'Wong', points: 700)
user5 = User.create!(email: 'alfred@lewagon.com', password: '12345678', first_name: 'Alfred', last_name: 'Tay', points: 100)
user6 = User.create!(email: 'ashley@lewagon.com', password: '12345678', first_name: 'Ashley Ignatius', last_name: 'Yeo', points: 9900)
user7 = User.create!(email: 'grace@lewagon.com', password: '12345678', first_name: 'Grace', last_name: 'Wong', points: 800)
user8 = User.create!(email: 'sarina@lewagon.com', password: '12345678', first_name: 'Sarina', last_name: 'Yeo', points: 500)
user9 = User.create!(email: 'hugo@lewagon.com', password: '12345678', first_name: 'Hugo', last_name: 'Low', points: 600)
user10 = User.create!(email: 'yongcheng@lewagon.com', password: '12345678', first_name: 'Yong Cheng', last_name: 'Low', points: 1700)

puts 'Creating Watches ...'
watch1 = Watch.create!(
  brand: 'Patek Philippe',
  model: 'Nautilus',
  year: 2022,
  price: 799.99,
  user: user1,
  avg_rating: 4.5,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 1)
)

watch2 = Watch.create!(
  brand: 'Lange & Söhne',
  model: 'Lange 1',
  year: 1986,
  price: 499.00,
  user: user2,
  avg_rating: 4.6,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 25)
)

watch3 = Watch.create!(
  brand: 'Audemars Piguet',
  model: 'Code 1165',
  year: 2019,
  price: 290.00,
  user: user3,
  avg_rating: 3.2,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 4)
)

watch4 = Watch.create!(
  brand: 'Rolex',
  model: 'Daytona',
  year: 1972,
  price: 1999.99,
  user: user1,
  avg_rating: 4.9,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 10)
)

watch5 = Watch.create!(
  brand: 'Audemars Piguet',
  model: 'Royal Oak Openwork',
  year: 2009,
  price: 850.99,
  user: user4,
  avg_rating: 4.2,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 18)
)

watch6 = Watch.create!(
  brand: 'Patek Philippe',
  model: 'Aquanaut',
  year: 2003,
  price: 799.99,
  user: user4,
  avg_rating: 4.1,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 21)
)

watch7 = Watch.create!(
  brand: 'Richard Mille',
  model: 'RM1',
  year: 2000,
  price: 1200.00,
  user: user1,
  avg_rating: 4.3,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 14)
)

watch8 = Watch.create!(
  brand: 'Cartier',
  model: 'Crash',
  year: 1967,
  price: 1599.00,
  user: user5,
  avg_rating: 4.6,
  cleaning_price: 150,
  delivery_price: 60,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 27)
)


puts 'Creating Bookings ...'
booking1 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 1), total: 1500, watch: watch1, renter: user5, status: 'pending', cleaning_service: false, delivery: true)
booking2 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 26), total: 5000, watch: watch2, renter: user6, status: 'confirmed', cleaning_service: false, delivery: false)
booking3 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 27), total: 2311, watch: watch3, renter: user5, status: 'canceled', cleaning_service: false, delivery: true)
booking4 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 1), total: 1800, watch: watch4, renter: user7, status: 'pending', cleaning_service: true, delivery: true)
booking5 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 1), total: 1000, watch: watch5, renter: user8, status: 'pending', cleaning_service: true, delivery: true)
booking6 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 9, 1), total: 3001, watch: watch6, renter: user9, status: 'confirmed', cleaning_service: false, delivery: false)
booking7 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch7, renter: user9, status: 'canceled', cleaning_service: false, delivery: true)
booking8 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch8, renter: user1, status: 'canceled', cleaning_service: true, delivery: true)

puts 'Creating Reviews ...'
review1 = Review.create(rating: 5, comment: 'Nice nice!', booking: booking1)
review1 = Review.create(rating: 4, comment: 'very nice watch! Nice owner too!', booking: booking3)
review1 = Review.create(rating: 4, comment: 'Handsome watch. Did my wrist roll 100 times!', booking: booking2)
review1 = Review.create(rating: 2, comment: 'Worst experience ever!', booking: booking4)
review1 = Review.create(rating: 1, comment: 'Awful awful!', booking: booking6)





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

# puts "Finished!"



# WATCHES CONTROLLER
# rails g model watch brand model year ... user:references
# rails g controller watches index new show create edit update delete

# class Watch < ApplicationRecord
#   belongs_to :user
# end

# class User < ApplicationRecord
#   has_many :watches
# end

# class WatchController < ApplictionsController
#   before_action :set_watch, only %i[show edit update destroy

    # def index
    #   @restaurants = policy_scope(Restaurant) # restaurants are under the policy scope of the model restaurant
    # end

    # def new
    #   @watch = Watch.new
    #   authorize @watch
    # end

#   def create
#     @watch = Watch.new(watch_params)
#     @watch.user = current_user # when in view: we can do this "<%= @watch.user.name %>""
#     authorize @restaurant
#     respond_to do |format| ...etc.
#   end

    # def show
    #   authorize @watch
    # end

    # def edit
    #   authorize @watch
    # end

    # def update
    #   authorize @watch
    # end

    # def destroy
    #   authorize @watch # because needs authorization first (of user) before can deleted
    # end

#   private
#   def set_watch
#     @watch = Watch.find(params[:id])
#   end

#   def watch_params
#     params.require(:watch).permit(:somethingfromwatch)
#   end
# end

# class ApplicationController < ApplictionsController
    # private
    # def skip_pundit?
    #   devise_controller? //...
    # end

# class WatchPolicy
#   class Scope < Scope
#   def resolve
#     user.admin? ? scope.all : scope.where(user: user)
#   end

#   def show?
#     true
#   end

#   def create?
#     true
#   end

#   def update?
#     (record.user == user) || user.admin
#   end

#   def destroy
#     record.user == user
#   end
# end

# class ApplicationPolicy
#   attr_reader :user, :record # record is the watch itself
#   def initialize
#     true
#   end

#   def create?
#     true
#   end
# end
