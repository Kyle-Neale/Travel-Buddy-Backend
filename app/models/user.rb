class User < ApplicationRecord
  has_one_attached :avatar
  has_many :friendships
  has_many :notifications
  has_many :comments
  has_many :spots
  has_many :friends, through: :friendships
  has_many :places, through: :spots

  has_secure_password
  
  validates :username, uniqueness: true

  def self.unfriended(current_user)
    self.all.select { |u|
      u != current_user &&
      !current_user.friends.include?(u) &&
      !u.friends.include?(current_user)
    }
  end

  def accepted_friends
    friendships = self.friendships.select do |friendship|
      !friendship.pending && friendship.accepted
    end
    friendships.map{|friendship| friendship.friend}
  end

  def sent_requests
    self.friendships.select do |friendship|
      friendship.pending
    end
  end

  def requested_friends
    sent_requests.map{ |r| r.friend }
  end

  def pending_friends
    requests = Friendship.where(friend_id: self.id, pending: true)
    requests.map{ |request| request.user }
  end

  def friend_request(friend)
    Friendship.create(user_id: self.id, friend_id: friend.id, pending: true, accepted: false)
  end

  def accept_request(friend)
    Friendship.create(user_id: self.id, friend_id: friend.id, pending: false, accepted: true)
    request = Friendship.find_by(user_id: friend.id, friend_id: self.id)
    request.update(pending: false, accepted: true)
  end

  def decline_request(friend)
    request = Friendship.find_by(user_id: friend.id, friend_id: self.id)
    request.update(pending: false, accepted: false)
  end


end
