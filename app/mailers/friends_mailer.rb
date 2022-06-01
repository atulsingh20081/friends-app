class FriendsMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_add_friend_email(friend, user)
    @friend = friend
    @user = user
    puts friend.inspect
    puts user.inspect
    mail( :to => @friend.email,
          :subject => 'You have been added to friend list' )
  end

  def send_test_email
   mail( :to => 'atul.nitk20081@gmail.com',
         :subject => 'You have been added to friend list' )

  end
end
