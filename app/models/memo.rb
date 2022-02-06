class Memo < ApplicationRecord
  validates :item, null: false

  belongs_to :room
  belongs_to :user
end
