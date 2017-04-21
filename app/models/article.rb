class Article < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  has_many :article_notes
  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :description, presence: true, length: {minimum: 3, maximum: 5000}
  validates :user_id, presence: true
  validates :category_id, presence: true


  def self.search(param)
    where("id = ? OR title LIKE ?", param.to_i, "%#{param}%") 
  end

end