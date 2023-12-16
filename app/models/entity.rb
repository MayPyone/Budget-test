class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :entity_name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
