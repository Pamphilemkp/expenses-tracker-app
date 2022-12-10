class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group

  validates :name, presence: true, allow_blank: false
  validates :amount, presence: true, allow_blank: false
end
