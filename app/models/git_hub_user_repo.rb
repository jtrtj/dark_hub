class GitHubUserRepo
  attr_reader :name, :description, :api_url, :html_url
  def initialize(attributes_json_data)
    @name = attributes_json_data[:name]
    @description = attributes_json_data[:description]
    @api_url = attributes_json_data[:url]
    @html_url = attributes_json_data[:html_url]
  end
end