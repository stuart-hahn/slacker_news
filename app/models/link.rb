class Link < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :url, presence: true

    def category_title=(title)
        self.category = Category.find_or_create_by(title: title, user_id: current_user.id)
      end
    
    def category_title
        self.category ? self.category.title : nil
    end
end
