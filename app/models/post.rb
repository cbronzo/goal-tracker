class Post < ApplicationRecord
  belongs_to :user
  has_many :users, through: :comments
  has_many :comments
  has_many :users, through: :cheers
  has_many :cheers

  validates :title, presence: true, length: { minimum: 8 }
  validates :description, presence: true, length: { minimum: 20, too_short: "too short" }

  DIFFICULTY_MAPPING = {
    1 => 'Very Easy',
    2 => 'Easy',
    3 => 'Somewhat Easy',
    4 => 'Somewhat Difficult',
    5 => 'Difficult',
    6 => 'Very Difficult'
  }

  def self.difficulty_mapping
    a = []
    Post::DIFFICULTY_MAPPING.each {|k, v| a << [v, k]  }
    a
  end

  def difficulty_to_str
    Post::DIFFICULTY_MAPPING.select {|k, v| k == difficulty}.values.first
  end






end
