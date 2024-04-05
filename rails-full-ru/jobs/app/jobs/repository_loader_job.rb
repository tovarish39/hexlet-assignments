# frozen_string_literal: true

class RepositoryLoaderJob < ApplicationJob # rubocop:disable Style/Documentation
  queue_as :default

  def perform(repository) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    repository.fetch
    client = Octokit::Client.new
    octokit_repo = Octokit::Repository.from_url(repository.link)
    github_data = client.repository(octokit_repo)
    repository.update(
      default_branch: github_data[:default_branch],
      description: github_data[:description],
      language: github_data[:language],
      owner_name: github_data[:owner][:login],
      repo_created_at: github_data[:created_at],
      repo_name: github_data[:name],
      repo_updated_at: github_data[:updated_at],
      watchers_count: github_data[:watchers_count]
    )
    repository.success
  rescue StandardError
    repository.fail
  ensure
    repository.save
  end
end
