class Memo < ApplicationRecord
  validates :item, presence: true

  belongs_to :room
  belongs_to :user
end
