class Income < ApplicationRecord
    validates :title, presence: true
    validates :salary, presence: true
    validates :salary_date, presence: true
end
