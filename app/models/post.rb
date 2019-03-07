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

  PRIORITY_MAPPING = {
    1 => 'Very Low Priorty',
    2 => 'Low Priority',
    3 => 'Medium Priority',
    4 => 'High Priority',
    5 => 'Very High Priority'
  }

  PROGRESS_MAPPING = {
    1 => 'Stuggling...',
    2 => 'Just Starting!',
    3 => 'Making Progress!',
    4 => 'Halfway There!',
    5 => 'Almost Done!',
    6 => 'Completed!'
  }


  def cheer(user)
    cheers << Cheer.new(user: user)
  end

  def uncheer(user)
    cheers.where(user_id: user.id).first.destroy
  end

  def self.difficulty_mapping
    a = []
    Post::DIFFICULTY_MAPPING.each {|k, v| a << [v, k]  }
    a
  end

  def difficulty_to_str
    Post::DIFFICULTY_MAPPING.select {|k, v| k == difficulty}.values.first
  end

  def self.priority_mapping
    a = []
    Post::PRIORITY_MAPPING.each {|k, v| a << [v, k]  }
    a
  end

  def priority_to_str
    Post::PRIORITY_MAPPING.select {|k, v| k == priority}.values.first
  end

  def self.progress_mapping
    a = []
    Post::PROGRESS_MAPPING.each {|k, v| a << [v, k]  }
    a
  end

  def progress_to_str
    Post::PROGRESS_MAPPING.select {|k, v| k == progress}.values.first
  end



end
