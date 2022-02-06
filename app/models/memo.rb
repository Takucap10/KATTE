class Memo < ApplicationRecord
  validates :item, null: false
  validates :info

  belongs_to :room
  belongs_to :user
end
