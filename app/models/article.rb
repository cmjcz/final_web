class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence:true, length: {maximum: 1000}

    def self.search(params)
        articles = Article.where("text LIKE ? or title LIKE ?", "%#{params[:search]}%",
             "%#{params[:search]}%") 
        if params[:search].present?
            articles
        end
    end
end
