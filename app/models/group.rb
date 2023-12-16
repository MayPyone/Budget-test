class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy
  ICONS = {
    'fa-cart-shopping' => 'Shopping Cart',
    'fa-graduation-cap' => 'Education or Learning',
    'fa-music' => 'Music or Audio',
    'fa-calendar' => 'Calendar or Events',
    'fa-wrench' => 'Tools or Settings',
    'fa-microphone' => 'Podcast or Audio',
    'fa-camera' => 'Photography or Images'
  }.freeze

  validates :icon, presence: true, inclusion: { in: ICONS.keys }

  def total_amount
    entities.sum(:amount)
  end
end
