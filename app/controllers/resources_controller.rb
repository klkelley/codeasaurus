class ResourcesController < ApplicationController
  def index
    @videos = Resource.where(resource_type: "video").limit(3)
    @snippets = Resource.where(resource_type: "snippet").limit(3)
    @markdowns = Resource.where(resource_type: "markdown").limit(3)
  end
end
