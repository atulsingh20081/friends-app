class EmailWorker
  include Sidekiq::Worker

  def perform(friend, user)
    puts friend.inspect
    puts friend.to_yaml
    puts user.inspect
    FriendsMailer.send_add_friend_email(friend, user).deliver
  end

=begin
  def perform(friend, user)
    FriendsMailer.send_test_email.deliver
  end
=end
end
