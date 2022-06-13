require 'rails_helper'

RSpec.describe 'friends/new', type: :view do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    sign_in current_user
    assign(:friend, Friend.new(
      'first_name' => 'Atul',
      'last_name' => 'Singh',
      'dob' => '23/08/1990',
      'user_id' => current_user.id,
      'email' => 'atul@gmail.com',
      'phone' => '1122334455'
    ))
  end

  it 'renders new friend form' do
    render

    assert_select 'form[action=?][method=?]', friends_path, 'post' do
      assert_select 'input[name=?]', 'friend[first_name]'
      assert_select 'input[name=?]', 'friend[last_name]'
      #assert_select 'input[name=?]', 'friend[dob]'
      assert_select 'input[name=?]', 'friend[user_id]'
      assert_select 'input[name=?]', 'friend[email]'
      assert_select 'input[name=?]', 'friend[phone]'
    end
  end
end