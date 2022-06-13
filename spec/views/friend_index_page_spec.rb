require 'rails_helper'

RSpec.describe 'friends/index.html.erb', type: :view do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  before(:each) do
    sign_in current_user
    assign(:friends, [
      Friend.create!(
        'first_name' => 'Atul',
        'last_name' => 'Singh',
        'dob' => '23/08/1990',
        'user_id' => current_user.id,
        'email' => 'atul@gmail.com',
        'phone' => '1122334455'
      ),
      Friend.create!(
        'first_name' => 'Atul',
        'last_name' => 'Singh',
        'dob' => '23/08/1990',
        'user_id' => current_user.id,
        'email' => 'arpit@gmail.com',
        'phone' => '1122334455'
      )
    ])
  end

  it 'renders a list of friends' do
    render
    expect(rendered).to match(/Atul/)
    assert_select "tr>td", text: 'Atul'.to_s, count: 2
    assert_select 'tr>td', text: 'Singh'.to_s, count: 2
    assert_select 'tr>td', text: current_user.id.to_s, count: 2
    assert_select 'tr>td', text: 'atul@gmail.com'.to_s, count: 1
    assert_select 'tr>td', text: 'arpit@gmail.com'.to_s, count: 1
  end
end