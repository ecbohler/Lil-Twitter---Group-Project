class User < ActiveRecord::Base
  has_many :tweets

  has_many :follower_relationships,
            class_name: 'Relationship',
            foreign_key: 'followee_id'

  has_many :followee_relationships,
            class_name: 'Relationship',
            foreign_key: 'follower_id'

  has_many :followers, through: :follower_relationships
  has_many :followees, through: :followee_relationships

end
