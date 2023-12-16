# spec/requests/groups_spec.rb

require 'rails_helper'
    
RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
   
  before do
    @user1 = User.create!(name: 'may', email: 'sein@gmail.com', password: '123456', id: 1)
    @group = Group.create!(group_name: 'Cars', icon: 'fa-cart-shopping', user_id: @user1.id)

     sign_in @user1
  end

  describe 'GET /index' do
    it 'return success index page' do
      get group_entities_path(@group)
      expect(response).to have_http_status(:success)
    end
    it 'return success create page' do
      get new_group_entity_path(@group)
      expect(response).to have_http_status(:success)
    end
  end

end
