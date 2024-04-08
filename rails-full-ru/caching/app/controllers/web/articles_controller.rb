# frozen_string_literal: true

class Web::ArticlesController < Web::ApplicationController
  # BEGIN
  def index
    @articles = Article.all
  end
  # END

  # BEGIN
  def show
    @article = Article.find(params[:id])
  end
  # END
end
