# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'the truth' do
    assert true
  end

  test 'should not save article without title' do
    task = Task.new
    assert_not task.save, 'Saved the article without a title'
  end
end
