class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities, dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :icon, presence: true, allow_blank: false
end
