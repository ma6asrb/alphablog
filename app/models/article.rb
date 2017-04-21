class Article < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  has_many :article_notes
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 50}
  validates :user_id, presence: true
  validates :category_id, presence: true


  def self.search(search)
    where("id = ? OR title LIKE ?", search.to_i, "%#{search}%") 
  end

end