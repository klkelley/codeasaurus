Resource.destroy_all
User.destroy_all

squiggles = User.create(email: "squiggles@hey.com", password: "password", teacher: true)

student_sammy = User.create(email: "sammy@student.com", password: "gocubsgo", teacher: false)

resources = [
Resource.create(title: "How to Build a Blog in Rails 4", description: "Code along step by step, a great introduction to building projects in Rails.", body: "https://www.youtube.com/watch?v=BI_VnnOLSKY", resource_type: "video"),

Resource.create(title: "Ruby on Rails Tutorial", description: "Introduction to Ruby on Rails", body: "https://www.youtube.com/watch?v=GY7Ps8fqGdc", resource_type: "video"),

Resource.create(title: "Ruby On Rails In 60 Minutes", description: "In this video we will cover all of the fundamentals of the Ruby on Rails framework by building a blog application with comment functionality.", body: "https://www.youtube.com/watch?v=pPy0GQJLZUM", resource_type: "video"),

Resource.create(title: "How to Learn Rails and Change Your Life: Two Ruby on Rails Developers Share Their Secrets", description: "You're going to learn:
*What it takes to learn Ruby on Rails (from 2 awesome women who did!)
*Examples of the interesting (and high-paying) jobs you can get when you know Rails
*Exactly what you need to learn to land your first job as a Rails developer
*The 3 most important things to focus on while learning Rails", body: "https://www.youtube.com/watch?v=lbqG1-uQf0Q", resource_type: "video"),


 Resource.create(title: "Validating Rails Models", description: "An example of some simple validation methods in Rails.", body: "class Joke < ActiveRecord::Base
    validates_presence_of :joketext
    validates_uniqueness_of :joketext

  def self.published_jokes
    find(:all, :conditions => 'published = 1')
  end
end", resource_type: "snippet"),

Resource.create(
  title: "Writing useful commit messages",
  description: "A very important skill to learn",
  body: "The **rendered** markdown is on the *right*
  This is a [link](https://google.com)
  * apples
  * oranges",
  resource_type: "markdown")
]

squiggles.resources = resources
squiggles.save
