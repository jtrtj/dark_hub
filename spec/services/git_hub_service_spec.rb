require 'rails_helper'

describe GitHubService do
  context '.user' do
    it 'can make a GitHub api user request', :vcr do
      token = ENV['jtrtj_test_token']

      result = GitHubService.user(token)

      expect(result).to have_key("name")
      expect(result).to have_key("id")
      expect(result).to have_key("login")
      expect(result["name"].class).to be(String)
      expect(result["id"].class).to be(Integer)
      expect(result["login"].class).to be(String)
    end
  end

  context '.user_repos' do
    it "can make a GitHub api user's repo request", :vcr do
      token = ENV['jtrtj_test_token']
      user_name = 'jtrtj'

      result = GitHubService.user_repos(token, user_name)
      repo = result.first

      expect(result.count).to eq(30)
      expect(repo).to have_key("name")
      expect(repo).to have_key("description")
      expect(repo).to have_key("html_url")
      expect(repo["name"].class).to be(String)
      expect(repo["description"].class).to be(String).or be(NilClass) #if no desc. JSON parse makes a nil object
      expect(repo["html_url"].class).to be(String)
    end
  end
end