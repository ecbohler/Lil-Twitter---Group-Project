bob = User.create(handle: "@bob")
susie = User.create(handle: "@susie")
erica = User.create(handle: "@erica")
paul = User.create(handle: "@paul")
majd = User.create(handle: "@majd")

Relationship.create(follower_id: bob.id, followee_id: susie.id)

bob.followers += [susie, erica, paul, majd]
majd.followers += [susie, erica, paul, bob]

paul_tweet = Tweet.create(content: "Hello World", user_id: 4)
