class Movie < ApplicationRecord
  belongs_to :screen

  validates :title, :context, :showtime, presence: true
end
