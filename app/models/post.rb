class Post < ApplicationRecord
  belongs_to :user
  has_many :users, through: :comments
  has_many :comments

  validates :title, presence: true, length: { minimum: 8 }
  validates :description, presence: true, length: { minimum: 20, too_short: "Description too short" }









end
