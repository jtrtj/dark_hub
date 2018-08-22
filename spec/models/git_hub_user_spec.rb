require 'rails_helper'

describe GitHubUser do
  it "has attributes" do
    attributes = {
                  name: 'John',
                  avatar_url: "kjhgfd",
                  followers: 5,
                  following: 5
                  }

    user = GitHubUser.new(attributes)
    expect(user.name).to eq("John")
    expect(user.avatar_url).to eq("kjhgfd")
    expect(user.followers).to eq(5)
    expect(user.following).to eq(5)
  end
end