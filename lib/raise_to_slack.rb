require "raise_to_slack/version"
require 'net/http'
require 'uri'
require 'json'

module RaiseToSlack
  def self.run
    begin
      yield
    rescue => e
      if channel_name.nil? || oauth2_token.nil?
        STDERR.puts "RaiseToSlack does not work. Please set ENV['RAISE_TO_SLACK_OAUTH2_TOKEN'] and ENV['RAISE_TO_SLACK_CHANNEL_NAME']."
      else
        begin
          post(e)
        rescue => e2
          STDERR.puts "RaiseToSlack failed: #{e2.message}"
        end
      end
      raise e
    end
  end

  def self.post(e)
    url = URI.parse('https://slack.com/api/files.upload')
    req = Net::HTTP::Post.new(url.path)
    req.set_form([
      ["content", e.backtrace.join("\n")],
      ["filename", e.class.to_s],
      ["channels", channel_name],
      ["token", oauth2_token],
    ], 'multipart/form-data')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.start {|http| http.request(req) }
    res.value

    file_id = JSON.parse(res.body)['file']['id']
    res = Net::HTTP.post_form(
      URI.parse('https://slack.com/api/files.comments.add'),
      { 'file' => file_id, 'comment' => e.message, 'token' => oauth2_token }
    )
    res.value
  end

  def self.oauth2_token
    ENV['RAISE_TO_SLACK_OAUTH2_TOKEN']
  end

  def self.channel_name
    ENV['RAISE_TO_SLACK_CHANNEL_NAME']
  end
end
