require 'rails_helper'

describe GithubUser do
    it "exists" do
      attributes = {}
      github_user = GithubUser.new(attributes)
  
      expect(github_user).to be_a(GithubUser)
  end
end