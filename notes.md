# MODELS

## USER

    - email
    - password

    - has_many :links
    - has_many :categories, through: :links
    - has_many :comments
    - has_many :commented_links, through: :comments

## LINK

    - title
    - url

    - belongs_to :user
    - belongs_to :category

    - has_many :comments
    - has_many :users, through: :comments

## COMMENT

    - body

    - belongs_to :user
    - belongs_to :link


## CATEGORY

    - title
    
    - has_many :links
    - has_many :users, through: :links
    - belongs_to :user