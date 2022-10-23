# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "#main" do
    get root_path

    assert_response :success
  end
end
