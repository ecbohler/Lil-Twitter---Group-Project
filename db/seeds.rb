bob = User.create(handle: "bob")
susie = User.create(handle: "susie")

Relationship.create(follower_id: bob.id, followee_id: susie.id)


tweet1 = Tweet.create(content: "tweet1", user_id: bob.id)
tweet2 = Tweet.create(content: "tweet2", user_id: susie.id)
