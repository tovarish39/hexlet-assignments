# frozen_string_literal: true

require 'test_helper'

module Web
  class RepositoriesControllerTest < ActionDispatch::IntegrationTest
    # BEGIN
    test 'should create' do
      url = 'https://github.com/'
      stub_request(:any, url)

      get url
      assert_response :success
    end
    # END
  end
end
