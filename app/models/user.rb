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

  enum candidate_type: {
    representative: 1,
    councilor: 2,
    governor: 3,
    prefectural_assembly: 4,
    mayor: 5,
    city_council: 6,
    mitane_mayor: 7,
    mitane_council: 8,
    happou_mayor: 9,
    happou_council: 10,
    fujisato_mayor: 11,
    fujisato_council: 12
  }

  CANDIDATE_TYPE_1 = "PRESIDENT"
  CANDIDATE_TYPE_2 = "REPRESENTATIVE"
  CANDIDATE_TYPE_3 = "COUNCILOR"
  CANDIDATE_TYPE_4 = "GOVERNOR"

end
