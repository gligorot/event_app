class User < ApplicationRecord
	has_many :created_events, foreign_key: :creator_id, class_name: "Event"
	has_many :attendances #foreign key already is user_id, no need for explicit
	has_many :attended_events, through: :attendances, source: :event

	def upcoming_events
		attended_events.upcoming
	end

	def previous_events
		attended_events.previous
	end
end
