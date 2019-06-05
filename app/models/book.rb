class Book < ApplicationRecord
#検索機能------
	def self.search(search)
      if search
        Book.where(['title LIKE ?', "%#{search}%"])#titleの部分に検索したい部分一致のカラムを入れる
      else
        Book.all
      end
    end
#-------------
 #belongs_to :user
 has_many :post_comments, dependent: :destroy
 has_many :favorites, foreign_key: 'book_id', dependent: :destroy #お気に入り
 has_many :users, through: :favorites #お気に入り

 validates :title, presence: true
 validates :opinion, presence: true,length: {maximum: 200}


end
