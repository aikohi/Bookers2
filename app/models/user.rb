class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :books,through: :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy #コメント機能
    has_many :favorites       #お気に入り
    has_many :favposts, through: :favorites, source: :book #お気に入り

  

    attachment :profile_image

    validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
    validates :introduction, length: {maximum: 50}

    def email_required?
   false
 	end
 	def email_changed?
   false
 	end

end
