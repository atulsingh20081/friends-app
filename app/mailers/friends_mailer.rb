class FriendsMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_add_friend_email(friend, user)
    @friend = friend
    @user = user
    mail( :to => @friend.email,
          :subject => 'You have been added to friend list' )
  end
end
