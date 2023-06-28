class Feed < ApplicationRecord
  has_many :cow_feeds
  has_many :cows, through: :cow_feeds
  belongs_to :user

  validates :name, :price, :volume, presence: true 
end
