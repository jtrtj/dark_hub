class GitHubUserCommit
  attr_reader :message, :html_url, :repo_name, :repo_html_url, :date
  def initialize(attributes_json_data)
    @message       = attributes_json_data[:commit][:message]
    @html_url      = attributes_json_data[:commit][:html_url]
    @repo_name     = attributes_json_data[:repository][:name]
    @repo_html_url = attributes_json_data[:repository][:html_url]
    @date          = attributes_json_data[:commit][:author][:date]
  end
end