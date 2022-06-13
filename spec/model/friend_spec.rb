require 'rails_helper'

RSpec.describe Friend, :type => :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  it 'is not valid without first_name' do
    friend = Friend.new(
      first_name: '',
      last_name: 'Singh',
      dob: '12/07/2021',
      email:'test@gmail.com',
      phone: '9988001122',
      user_id: current_user.id
    )
    expect(friend).to_not be_valid

    friend.first_name = 'At'
    expect(friend).to be_valid
  end

  it 'is not valid without last_name' do
    friend = Friend.new(
      first_name: 'Atul',
      last_name: '',
      dob: '12/07/2021',
      email:'test@gmail.com',
      phone: '9988001122',
      user_id: current_user.id
    )
    expect(friend).to_not be_valid

    friend.last_name = 'Singh'
    expect(friend).to be_valid
  end

  it "is not valid without a proper email" do
    friend = Friend.new(
      first_name: 'Atul',
      last_name: 'Singh',
      dob: '12/07/2021',
      email:'',
      phone: '9988001122',
      user_id: current_user.id
    )
    expect(friend).to_not be_valid

    friend.email = 'atul.com'
    expect(friend).to_not be_valid

    friend.email = "atul@gmail.com"
    expect(friend).to be_valid
  end

  it "is not valid without an integer userid" do
    friend = Friend.new(
      first_name: 'Atul',
      last_name: 'Singh',
      dob: '12/07/2021',
      email:'atul@gmail.com',
      phone: '9988001122',
      user_id: 'current_user.id'
    )
    expect(friend).to_not be_valid

    friend.user_id = 1.0
    expect(friend).to_not be_valid

    friend.user_id = 1
    expect(friend).to be_valid
  end
end