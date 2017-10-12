Resource.destroy_all
User.destroy_all

squiggles = User.create(email: "squiggles@hey.com", password: "password")

video = Resource.create(title: "How to Build a Blog in Rails 4", description: "Code along step by step, a great introduction to building projects in Rails.", body: "https://www.youtube.com/watch?v=BI_VnnOLSKY", resource_type: "video")

squiggles.resources << video
squiggles.save
