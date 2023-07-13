class CowFeed < ApplicationRecord
  belongs_to :cow
  belongs_to :feed

  validates :volume, presence: true
end
