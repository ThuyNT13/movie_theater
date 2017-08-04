class Screen < ApplicationRecord
  has_many :movies, dependent: :destroy

  validates :room_no, :capacity, presence: true
end
