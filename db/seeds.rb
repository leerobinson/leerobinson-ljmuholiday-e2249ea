require 'faker'
require 'populator'
require 'sha1'

User.destroy_all
Holiday.destroy_all

	10.times do

	user = User.new
	user.username = Faker::Internet.user_name
	user.email = Faker::Internet.email
	user.password = "tests"
	user.password_confirmation = "tests"
	user.save
	end

	User.all.each do |user|
	Holiday.populate(5..10) do |holiday|

	holiday.amountofdays = "3"
	holiday.startdate = Date.today
	holiday.enddate = Date.today
	holiday.user_id =  user.id
	end
	end
