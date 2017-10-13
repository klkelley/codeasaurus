require 'rails_helper'

describe "Video virtual attributes" do
  let :video {Resource.find_by(resource_type: "video")}
  it "returns the url for a thumbnail image" do
    expect(video.thumb).to include "jpg"
  end

  it "returns the iframe tag for embedded video" do
    expect(video.iframe).to include "iframe"
  end
end
