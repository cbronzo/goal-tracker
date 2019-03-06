class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :commented_goals, class_name: 'Post', foreign_key: 'post_id', through: :comments
  has_many :cheers
  has_many :cheered_goals, class_name: 'Post', foreign_key: 'post_id', through: :cheers

end
