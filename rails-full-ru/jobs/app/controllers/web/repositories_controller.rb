# frozen_string_literal: true

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
    @repository = Repository.new(permitted_params)
    if @repository.save
      RepositoryLoaderJob.perform_later(@repository)
      redirect_to repositories_path, notice: 'Успешно создан, загрузка пошла'
    else
      render :new, status: :unprocessable_entity, alert: 'Ошика при создании'
    end
    # END
  end

  def update
    # BEGIN
    @repository = Repository.find(params[:id])
    RepositoryLoaderJob.perform_later(@repository)
    redirect_to repositories_path, notice: 'Успешно обновлён, загрузка пошла'
    # END
  end

  def update_repos
    # BEGIN
    repositories = Repository.order(created_at: :desc)
    repositories.each do |repository|
      RepositoryLoaderJob.perform_later(repository)
    end
    redirect_to repositories_path, notice: 'process begin'
    # END
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
