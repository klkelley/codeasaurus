class ResourcesController < ApplicationController
  def index
    if params[:term]
      @resources = Resource.where('title LIKE ?', "%#{params[:term]}%")
    else
      @videos = Resource.where(resource_type: "video").limit(3)
      @snippets = Resource.where(resource_type: "snippet").limit(3)
      @markdowns = Resource.where(resource_type: "markdown").limit(3)
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:term)
  end
end
