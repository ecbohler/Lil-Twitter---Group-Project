bob = User.create(handle: "bob")
susie = User.create(handle: "susie")

Relationship.create(follower_id: bob.id, followee_id: susie.id)
