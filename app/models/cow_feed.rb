class CowFeed < ApplicationRecord
  belongs_to :cow
  belongs_to :feed
end
