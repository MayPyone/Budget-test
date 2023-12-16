require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  include Devise::Test::IntegrationHelpers
  before do
    @user1 = User.create!(name: 'may', email: 'sein@gmail.com', password: '123456', id: 1)
    @group = Group.create!(group_name: 'Cars', icon: 'fa-cart-shopping', user_id: @user1.id, id: 1)
    @entity = Entity.create!(entity_name: 'Hyundai',amount: '2', user_id: @user1.id, group_id: @group.id)
     sign_in @user1
  end

  describe 'returns user index page' do
    it 'returns the content of food' do
      visit group_path(@group)
      expect(page).to have_content(@entity.entity_name)
      expect(page).to have_content(@entity.amount)
    end

    it 'returns the content of food page' do
      visit group_path(@group)
      expect(page).to have_content('Entities')
      expect(page).to have_content('Add a new transaction')
    end
  end

  describe 'Actions for food page' do
    it 'returns action for delete' do
      
    end

    it 'returns action for add' do
     
    end
  end
end