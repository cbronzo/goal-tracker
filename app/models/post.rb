class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
  # validates :title, :minimum => 10, allow_blank: false
  # validates :description, :minimum => 20, allow_blank: false
  # validates :due_date, allow_blank: true
  # validates :due_date, :type => Date






end
