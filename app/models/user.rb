class User < ApplicationRecord

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,# :confirmable,
         :timeoutable

  # articleモデルとのリレーション
  has_many :articles

  # micropostモデルとのリレーション
  has_many :microposts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_microposts, through: :votes, source: :micropost

  # message(掲示板)モデルとのリレーション
  has_many :messages
  has_many :fishinginfos

  # special_issues（コラム）モデルとのリレーション
  has_many :special_issues

  # eventsguides(イベントガイド)モデルとのリレーション
  has_many :eventguides

  # cover_storiesモデルとのリレーション
  has_many :cover_stories

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
    representative: 1,          #衆院選
    councilor: 2,               #参院選
    governor: 3,                #県知事選
    prefectural_assembly: 4,    #県議選
    mayor: 5,                   #市長選
    city_council: 6,            #市議選
    mitane_mayor: 7,            #三種町長選
    mitane_council: 8,          #三種町議選
    happou_mayor: 9,            #八峰町長選
    happou_council: 10,         #八峰町議選
    fujisato_mayor: 11,         #藤里町長選
    fujisato_council: 12        #藤里町議選
  }
end
