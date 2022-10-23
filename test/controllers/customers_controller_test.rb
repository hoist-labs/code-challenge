# frozen_string_literal: true

require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "#index" do
    get customers_path

    assert_response :success
  end
end
