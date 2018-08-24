require 'rails_helper'

describe GitHubUserCommit do
  it 'has attributes' do
    attributes = YAML.load(File.read("fixtures/vcr_cassettes/_user_commits/can_make_a_GitHub_api_search_for_commits_by_a_user"))
    require 'pry'; binding.pry

    commit = GitHubUserCommit.new(attributes)
  end
end
