require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  include Devise::Test::IntegrationHelpers
  before do
    @user1 = User.create!(name: 'may', email: 'sein@gmail.com', password: '123456', id: 1)
    @group = Group.create!(group_name: 'Cars', icon: 'fa-cart-shopping', user_id: @user1.id)
     sign_in @user1
  end

  describe 'returns show page' do
    it 'returns the current data of groups' do
      visit group_path(@group)
      expect(page).to have_content(@group.group_name)
    end

    it 'returns the content of group page' do
        visit group_path(@group)
      expect(page).to have_content('Entities')
      expect(page).to have_content('Total Amount')
      expect(page).to have_content('Add a new transaction')
    end
  end

  describe 'Actions for Group page' do
    it 'returns action for Add' do
        visit group_path(@group)
      click_button('Add a new transaction')
      sleep 10
      expect(current_path).to eq(new_group_entity_path(@group))
    end

  end
end