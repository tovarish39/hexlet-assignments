# frozen_string_literal: true

class TasksController < ApplicationController # rubocop:disable Style/Documentation
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notify] = 'Success'
      redirect_to task_path(@task)
    else
      flash[:alert] = 'Failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notify] = 'Success'
      redirect_to task_path(@task)
    else
      flash[:alert] = 'Failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notify] = 'Success'
      redirect_to tasks_path
    else
      flash[:alert] = 'Failed'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
