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
user1 = User.create!(email: 'felita@lewagon.com', password: '12345678', first_name: 'Felita', last_name: 'Liem', points: 1200, address: "Marina Boulevard, Singapore")
user2 = User.create!(email: 'malia@lewagon.com', password: '12345678', first_name: 'Malia', last_name: 'Newgen', points: 1200, address: "Strait View 1, Singapore")
user3 = User.create!(email: 'danish@lewagon.com', password: '12345678', first_name: 'Danish', last_name: 'Hisham', points: 400, address: "927 Bukit Timah Road, Singapore")
user4 = User.create!(email: 'julian@lewagon.com', password: '12345678', first_name: 'Julian', last_name: 'Wong', points: 700, address: "20 Collyer, Singapore")
user5 = User.create!(email: 'alfred@lewagon.com', password: '12345678', first_name: 'Alfred', last_name: 'Tay', points: 100, address: "Botanical Garden, Singapore")
user6 = User.create!(email: 'ashley@lewagon.com', password: '12345678', first_name: 'Ashley Ignatius', last_name: 'Yeo', points: 9900, address: "33 Robin Road, Singapore")
user7 = User.create!(email: 'grace@lewagon.com', password: '12345678', first_name: 'Grace', last_name: 'Wong', points: 800, address: "Raffles Place MRT, Singapore")
user8 = User.create!(email: 'sarina@lewagon.com', password: '12345678', first_name: 'Sarina', last_name: 'Yeo', points: 500, address: "Stevens MRT, Singapore")
user9 = User.create!(email: 'hugo@lewagon.com', password: '12345678', first_name: 'Hugo', last_name: 'Low', points: 600, address: "Ion Orchard, Singapore")
user10 = User.create!(email: 'yongcheng@lewagon.com', password: '12345678', first_name: 'Yong Cheng', last_name: 'Low', points: 1700, address: "88 Namly Avenue, Singapore")

puts 'Creating Watches ...'
# watch1 = Watch.create!(
#   start_date: Date.new(2022, 6, 20),
#   end_date: Date.new(2022, 9, 25),
#   availability: true,
#   brand: 'Patek Philippe',
#   model: 'Nautilus',
#   year: 2022,
#   price: 799.99,
#   user: user1,
#   avg_rating: 4.5,
#   cleaning_price: 150,
#   delivery_price: 60,

# )
file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661752536/sozq9lxelbl22hcs8kra.jpg")
watch1 = Watch.new(start_date: Date.new(2022, 6, 20),
end_date: Date.new(2022, 9, 25),
availability: true,
brand: 'Patek Philippe',
model: 'Nautilus',
year: 2022,
price: 799.99,
user: user1,
avg_rating: 4.5,
cleaning_price: 150,
delivery_price: 60,)
watch1.photos.attach(io: file, filename: "nautilus.jpg", content_type: "image/jpg")
watch1.save

watch2 = Watch.create!(
  start_date: Date.new(2022, 7, 10),
  end_date: Date.new(2022, 10, 15),
  availability: true,
  brand: 'Lange & Söhne',
  model: 'Lange 1',
  year: 1986,
  price: 499.00,
  user: user2,
  avg_rating: 4.6,
  cleaning_price: 150,
  delivery_price: 60,

)

watch3 = Watch.create!(
  start_date: Date.new(2022, 6, 20),
  end_date: Date.new(2022, 10, 26),
  availability: true,
  brand: 'Audemars Piguet',
  model: 'Code 1165',
  year: 2019,
  price: 290.00,
  user: user3,
  avg_rating: 3.2,
  cleaning_price: 150,
  delivery_price: 60,

)

watch4 = Watch.create!(
  start_date: Date.new(2022, 7, 20),
  end_date: Date.new(2022, 11, 25),
  availability: true,
  brand: 'Rolex',
  model: 'Daytona',
  year: 1972,
  price: 1999.99,
  user: user1,
  avg_rating: 4.9,
  cleaning_price: 150,
  delivery_price: 60,

)

watch5 = Watch.create!(
  start_date: Date.new(2022, 8, 1),
  end_date: Date.new(2022, 11, 25),
  availability: true,
  brand: 'Audemars Piguet',
  model: 'Royal Oak Openwork',
  year: 2009,
  price: 850.99,
  user: user4,
  avg_rating: 4.2,
  cleaning_price: 150,

)

watch6 = Watch.create!(
  start_date: Date.new(2022, 8, 20),
  end_date: Date.new(2022, 10, 31),
  availability: false,
  brand: 'Patek Philippe',
  model: 'Aquanaut',
  year: 2003,
  price: 799.99,
  user: user4,
  avg_rating: 4.1,
  cleaning_price: 150,
  delivery_price: 60,

)

watch7 = Watch.create!(
  start_date: Date.new(2022, 6, 20),
  end_date: Date.new(2022, 10, 22),
  availability: true,
  brand: 'Richard Mille',
  model: 'RM1',
  year: 2000,
  price: 1200.00,
  user: user1,
  avg_rating: 4.3,
  cleaning_price: 150,
  delivery_price: 60,

)

watch8 = Watch.create!(
  start_date: Date.new(2022, 7, 20),
  end_date: Date.new(2022, 11, 18),
  availability: true,
  brand: 'Cartier',
  model: 'Crash',
  year: 1967,
  price: 1599.00,
  user: user5,
  avg_rating: 4.6,
  cleaning_price: 150,
  delivery_price: 60,

)

watch9 = Watch.create!(
  start_date: Date.new(2022, 8, 20),
  end_date: Date.new(2022, 9, 25),
  availability: true,
  brand: 'Audemars Piguet',
  model: 'Royal Oak Offshore',
  year: 2010,
  price: 199.00,
  user: user1,
  avg_rating: 4.6,
  cleaning_price: 150,
  delivery_price: 60,

)

puts 'Creating Bookings ...'
booking1 = Booking.create(start_date: Date.new(2022, 7, 20), end_date: Date.new(2022, 7, 25), total: 1500, watch: watch1, renter: user5, status: 'confirmed', cleaning_service: false, delivery: true, completed: true, meetup_location: "Higher Performace, Singapore")
booking2 = Booking.create(start_date: Date.new(2022, 7, 21), end_date: Date.new(2022, 7, 24), total: 5000, watch: watch2, renter: user6, status: 'confirmed', cleaning_service: false, delivery: false, completed: false, delivery_location: "327 Bukit Timah Road, Singapore")
booking3 = Booking.create(start_date: Date.new(2022, 7, 21), end_date: Date.new(2022, 7, 29), total: 2311, watch: watch3, renter: user5, status: 'nil', cleaning_service: false, delivery: true, completed: false, meetup_location: "3 Robin Road, Singapore")
booking4 = Booking.create(start_date: Date.new(2022, 7, 23), end_date: Date.new(2022, 7, 29), total: 1800, watch: watch4, renter: user7, status: 'confirmed', cleaning_service: true, delivery: true, completed: false, delivery_location: "Forum Mall, Singapore")
booking5 = Booking.create(start_date: Date.new(2022, 7, 24), end_date: Date.new(2022, 7, 30), total: 1000, watch: watch5, renter: user8, status: 'confirmed', cleaning_service: true, delivery: true, completed: true, meetup_location: "1 Robin Road, Singapore")
booking6 = Booking.create(start_date: Date.new(2022, 7, 24), end_date: Date.new(2022, 7, 30), total: 3001, watch: watch6, renter: user7, status: 'confirmed', cleaning_service: false, delivery: false, completed: true, delivery_location: "Barker Road Methodist Church, Singapore")
booking7 = Booking.create(start_date: Date.new(2022, 7, 25), end_date: Date.new(2022, 7, 31), total: 8000, watch: watch7, renter: user6, status: 'nil', cleaning_service: false, delivery: true, completed: false, meetup_location: "15 Robin Road, Singapore")
booking8 = Booking.create(start_date: Date.new(2022, 7, 28), end_date: Date.new(2022, 7, 31), total: 8000, watch: watch8, renter: user1, status: 'nil', cleaning_service: true, delivery: true, completed: false, delivery_location: "Balmoral Plaza, Singapore")
booking9 = Booking.create(start_date: Date.new(2022, 7, 29), end_date: Date.new(2022, 8, 1), total: 1800, watch: watch1, renter: user7, status: 'pending', cleaning_service: true, delivery: true, completed: false, meetup_location: "Ngee Ann City, Singapore")
booking10 = Booking.create(start_date: Date.new(2022, 7, 31), end_date: Date.new(2022, 8, 1), total: 1000, watch: watch3, renter: user4, status: 'confirmed', cleaning_service: true, delivery: true, completed: true, delivery_location: "Plaza Singapura, Singapore")
booking11 = Booking.create(start_date: Date.new(2022, 7, 31), end_date: Date.new(2022, 9, 17), total: 3001, watch: watch6, renter: user9, status: 'confirmed', cleaning_service: false, delivery: false, completed: true, meetup_location: "313 Somerset, Singapore")
booking12 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch7, renter: user9, status: 'pending', cleaning_service: false, delivery: true, completed: false, delivery_location: "Orchard Central, Singapore")
booking13 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch8, renter: user1, status: 'pending', cleaning_service: true, delivery: true, completed: false, meetup_location: "111 Somerset, Singapore")
booking14 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch2, renter: user9, status: 'pending', cleaning_service: false, delivery: true, completed: false, delivery_location: "Orchard Gateway, Singapore")
booking15 = Booking.create(start_date: Date.new(2022, 8, 31), end_date: Date.new(2022, 10, 1), total: 8000, watch: watch4, renter: user1, status: 'confirmed', cleaning_service: true, delivery: true, completed: false, meetup_location: "Paragon Shopping Center, Singapore")

puts 'Creating Reviews ...'
review1 = Review.create(rating: 5, comment: 'Nice nice!', booking: booking1)
review2 = Review.create(rating: 4, comment: 'very nice watch! Nice owner too!', booking: booking5)
review3 = Review.create(rating: 4, comment: 'Handsome watch. Did my wrist roll 100 times!', booking: booking6)
review4 = Review.create(rating: 2, comment: 'Worst experience ever!', booking: booking10)
review5 = Review.create(rating: 1, comment: 'Awful awful!', booking: booking11)




## ADD COMPLETION STATUS AS A BOOLEAN


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
