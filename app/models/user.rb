class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets

  has_many :follower_relationships,
            class_name: 'Relationship',
            foreign_key: 'followee_id'

  has_many :followee_relationships,
            class_name: 'Relationship',
            foreign_key: 'follower_id'

  has_many :followers, through: :follower_relationships
  has_many :followees, through: :followee_relationships

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
