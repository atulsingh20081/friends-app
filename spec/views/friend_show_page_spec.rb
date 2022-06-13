require 'rails_helper'

RSpec.describe 'friends/show', type: :view do
  before(:each) do
    current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    sign_in current_user
    @friend = assign(:friend, Friend.create!(
      'first_name' => 'Atul',
      'last_name' => 'Singh',
      'dob' => '23/08/1990',
      'user_id' => current_user.id,
      'email' => 'atul@gmail.com',
      'phone' => '1122334455'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Atul/)
    expect(rendered).to match(/Singh/)
    expect(rendered).to match(//)
    expect(rendered).to match(/tul@gmail.com/)
  end
end