class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end