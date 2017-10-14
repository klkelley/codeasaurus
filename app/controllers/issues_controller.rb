class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.resource = Resource.find(params[:resource_id])
    @issue.resolved = false
    @issue.save
    redirect_to '/resources'
  end

  private

  def issue_params
    params.require(:issue).permit(:body)
  end

end

