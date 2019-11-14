class Category < ApplicationRecord
    has_many :links
    has_many :users, through: :links

    validates :title, presence: :true
end
