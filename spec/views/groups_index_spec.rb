require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  include Devise::Test::IntegrationHelpers
  before do
    @user1 = User.create!(name: 'may', email: 'sein@gmail.com', password: '123456', id: 1)
    @group = Group.create!(group_name: 'Cars', icon: 'fa-cart-shopping', user_id: @user1.id)
     sign_in @user1
  end

  describe 'returns user index page' do
    it 'returns the current data of groups' do
      visit authenticated_root_path
      expect(page).to have_content(@group.group_name)
    end

    it 'returns the content of group page' do
        visit authenticated_root_path
      expect(page).to have_content('Add Group')
      expect(page).to have_content('Groups')
    end
  end

  describe 'Actions for Group page' do
    it 'returns action for Add' do
        visit authenticated_root_path
      click_button('Add Group')
      sleep 10
      expect(current_path).to eq(new_group_path)
    end

  end
end