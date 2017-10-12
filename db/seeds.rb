Resource.destroy_all
User.destroy_all

squiggles = User.create(email: "squiggles@hey.com", password: "password")

resources = [
video = Resource.create(title: "How to Build a Blog in Rails 4", description: "Code along step by step, a great introduction to building projects in Rails.", body: "https://www.youtube.com/watch?v=BI_VnnOLSKY", resource_type: "video"),

snippet = Resource.create(title: "Validating Rails Models", description: "An example of some simple validation methods in Rails.", body: "class Joke < ActiveRecord::Base
  validates_presence_of :joketext
  validates_uniqueness_of :joketext
  def self.published_jokes find(:all, :conditions => 'published = 1')
  end end", resource_type: "snippet"),

markdown = Resource.create(title: "Writing useful commit messages", description: "A very important skill to learn", body: "Good commit messages should always have the following 5 qualities: 1) The first line is 50 characters or less... More info here: https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message", resource_type: "markdown")
]

squiggles.resources = resources
squiggles.save
