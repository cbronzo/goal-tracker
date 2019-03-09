class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :posts
  has_many :comments
  has_many :commented_goals, class_name: 'Post', foreign_key: 'post_id', through: :comments
  has_many :cheers
  has_many :cheered_goals, class_name: 'Post', foreign_key: 'post_id', through: :cheers


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
    end
  end

  def voted_this(post_id)
    Cheer.find_by(user_id: id, post_id: post_id)
  end






end
