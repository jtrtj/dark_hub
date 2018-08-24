require 'rails_helper'

describe GitHubUserCommit do
  it 'has attributes' do
    attributes = JSON.parse(File.read("fixtures/sample_repo.json"), symbolize_names: true)

    commit = GitHubUserCommit.new(attributes)

    expect(commit.message).to eq(attributes[:commit][:message])
    expect(commit.html_url).to eq(attributes[:html_url])
    expect(commit.repo_name).to eq(attributes[:repository][:name])
    expect(commit.repo_html_url).to eq(attributes[:repository][:html_url])
    expect(commit.date).to eq(attributes[:commit][:author][:date])
  end
end
