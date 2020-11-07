class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,# :confirmable,
         :timeoutable

  # articleモデルとのリレーション
  has_many :articles, dependent: :destroy

  # micropostモデルとのリレーション
  has_many :microposts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_microposts, through: :votes, source: :micropost

  # message(掲示板)モデルとのリレーション
  has_many :messages, dependent: :destroy
  has_many :fishinginfos, dependent: :destroy

  # special_issues（コラム）モデルとのリレーション
  has_many :special_issues

  # eventsguides(イベントガイド)モデルとのリレーション
  has_many :eventguides

  def votable_for?(micropost)
    micropost && micropost.author != self && !votes.exists?(micropost_id: micropost.id)
  end

  enum role: {
    visitor: 1,
    advertise: 11,
    candidate: 13,
    admin: 99
  }
end
