class Categorie < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    has_many :articles
end
