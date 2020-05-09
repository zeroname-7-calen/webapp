class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,# :confirmable,
         :timeoutable

  has_many :microposts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_microposts, through: :votes, source: :micropost

  def votable_for?(micropost)
    micropost && micropost.author != self && !votes.exists?(micropost_id: micropost.id)
  end
end
