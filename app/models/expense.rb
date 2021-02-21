class Expense < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :using_date, presence: true
end
