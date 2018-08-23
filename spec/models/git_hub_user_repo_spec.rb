require 'rails_helper'

describe GitHubUserRepo do
  it "has attributes" do
    attributes = {
                  name: 'cool_project',
                  description: "kjhgfd",
                  url: 'http://yeahyeah.com',
                  html_url: 'http://yeahyouknowme.com'
                  }

    repo = GitHubUserRepo.new(attributes)
    expect(repo.name).to eq("cool_project")
    expect(repo.description).to eq("kjhgfd")
    expect(repo.api_url).to eq('http://yeahyeah.com')
    expect(repo.html_url).to eq('http://yeahyouknowme.com')
  end
end
