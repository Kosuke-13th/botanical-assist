class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,            presence: true
  validates :region_id,       presence: true, numericality: { other_than: 1 }
  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :plants
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

end
