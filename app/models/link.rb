class Link < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :url, presence: true
end
