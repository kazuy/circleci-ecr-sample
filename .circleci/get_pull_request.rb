require 'octokit'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

user = ENV['CIRCLE_PROJECT_USERNAME']
repository = ENV['CIRCLE_PROJECT_REPONAME']
pr_number=ENV['PR_NUMBER'].to_i

pr = client.pull_request("#{user}/#{repository}", pr_number)
p pr.body.gsub(/- \[(\s|x)\]\s/, '').gsub(/\s@[a-zA-Z0-9\-_]+/, '')
