require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = Entity.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many entities' do
      association = Entity.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
