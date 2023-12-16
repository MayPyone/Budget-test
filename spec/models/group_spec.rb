require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = Group.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many entities' do
      association = Group.reflect_on_association(:entities)
      expect(association.macro).to eq(:has_many)
    end
  end
end
