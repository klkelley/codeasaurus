class ResourcesController < ApplicationController
  def index
    if params[:search] && (params[:search][:term].length > 0 || params[:search][:resource_type] != "Pick a type")
      if params[:search][:term] && params[:search][:resource_type] != "Pick a type"
        @resources = Resource.where('lower(title) LIKE ? AND resource_type = ?', "%#{params[:search][:term]}%".downcase, params[:search][:resource_type])
      elsif params[:search][:term].length > 0
        @resources = Resource.where('lower(title) LIKE ?', "%#{params[:search][:term]}%".downcase)
      elsif params[:search][:resource_type] != "Pick a type"
        @resources = Resource.where('resource_type = ?', params[:search][:resource_type])
      end
    else
      @videos = Resource.where(resource_type: "video").limit(3)
      @snippets = Resource.where(resource_type: "snippet").limit(3)
      @markdowns = Resource.where(resource_type: "markdown").limit(3)
    end
  end

  def new
  end

  def show
    @resource = Resource.find(params[:id])
  end

  private

  def resource_params
    params.require(:resource).permit(:term)
  end
end

