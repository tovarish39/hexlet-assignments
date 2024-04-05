# frozen_string_literal: true

# BEGIN

# END

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    client = Octokit::Client.new
    link = permitted_params[:link]
    octokit_repo = Octokit::Repository.from_url(link)
    repository_data = client.repository(octokit_repo)
    d = repository_data
    object = {
      default_branch: d[:default_branch],
      description: d[:description],
      language: d[:language],
      link: link,
      owner_name: d[:owner_name],
      repo_created_at: d[:repo_created_at],
      repo_name: d[:repo_name],
      watchers_count: d[:watchers_count]
    }
    @repository = Repository.new(object)
    if @repository.save
      redirect_to repositories_path, notice: 'Создан'
    else
      render :new, status: :unprocessable_entity, alert: 'Не создан'
    end
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
