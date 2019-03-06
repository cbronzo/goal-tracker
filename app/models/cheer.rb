class Cheer < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :cheerleader, class_name: 'User', foreign_key: 'user_id'
end
