class Event < ApplicationRecord
	belongs_to :creator, class_name: "User"

	has_many :attendances
	has_many :attendees, through: :attendances, source: :user

	scope :upcoming, -> { where("date > ?", Date.today)}
	scope :previous, -> { where("date < ?", Date.today)}
end