class ResourcesController < ApplicationController
  def index
    if params[:search]
      search_term = "%#{params[:search][:term]}%".downcase
      if params[:search][:term].length > 0 && params[:search][:resource_type] != "Pick a type"
        @resources = Resource.where('lower(title) LIKE ? or lower(description) LIKE ? AND resource_type = ?', search_term, search_term, params[:search][:resource_type])
      elsif params[:search][:term].length > 0
        @resources = Resource.where('lower(title) LIKE ? or lower(description) LIKE ?', search_term, search_term)
      elsif params[:search][:resource_type] != "Pick a type"
        @resources = Resource.where('resource_type = ?', params[:search][:resource_type])
      elsif params[:search] && (params[:search][:term].length == 0 && params[:search][:resource_type] == "Pick a type")
        redirect_to resources_path, notice: "Please enter a keyword or resource type and try again."
      end

    else
      @videos = Resource.where(resource_type: "video").limit(3)
      @snippets = Resource.where(resource_type: "snippet").limit(3)
      @markdowns = Resource.where(resource_type: "markdown").limit(3)
    end
  end

  def new
    p params
    @resource = Resource.new(resource_type: params[:type])
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    redirect_to root_path if !current_user.teacher
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(update_resource_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to root_path
  end

  private

  def resource_params
    params.require(:resource).permit(:term)
  end

  def update_resource_params
    params.require(:resource).permit(:title, :body, :description)
  end

  def delete_resource_params
    params.require(:id)
  end
end

