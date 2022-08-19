class Movie < ApplicationRecord
	has_many :lists, through: :bookmarks
	has_many :bookmarks, dependent: :destroy
	validates :title, uniqueness: true
	validates :title, :overview, presence:true
end
