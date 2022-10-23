# frozen_string_literal: true

require "test_helper"

class PaymentRequestTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:jordan)
    @payment_request = payment_requests(:jordans_payment)
  end

  test "status should be present" do
    @payment_request.status = nil

    assert_not @payment_request.valid?
    assert_includes @payment_request.errors.messages[:status], "can't be blank"
  end

  test "amount should be present" do
    @payment_request.amount = nil

    assert_not @payment_request.valid?
    assert_includes @payment_request.errors.messages[:amount], "can't be blank"
  end

  test "amount when initialized with #amount=" do
    @payment_request = PaymentRequest.new(amount: 12_345)

    assert_equal 12_345, @payment_request.amount
    assert_equal 123.45, @payment_request.amount_in_dollars
  end

  test "amount when initialized with #amount_in_dollars=" do
    @payment_request = PaymentRequest.new(amount_in_dollars: "123.45")

    assert_equal 12_345, @payment_request.amount
    assert_equal 123.45, @payment_request.amount_in_dollars
  end

  test "amount when created with #amount=" do
    @payment_request = PaymentRequest.create(amount: 100, status: "generated", customer: @customer)

    assert_equal 100, @payment_request.amount
    assert_equal 1, @payment_request.amount_in_dollars
  end

  test "amount when created with #amount_in_dollars=" do
    @payment_request = PaymentRequest.create(amount_in_dollars: "100.11", status: "generated", customer: @customer)

    assert_equal 10_011, @payment_request.amount
    assert_equal 100.11, @payment_request.amount_in_dollars
  end

  test "amount when updated with #amount=" do
    @payment_request.update(amount: 10_000)
    @payment_request.reload

    assert_equal 10_000, @payment_request.amount
    assert_equal 100, @payment_request.amount_in_dollars
  end

  test "amount when updated with #amount_in_dollars=" do
    @payment_request.update(amount_in_dollars: "100.00")
    @payment_request.reload

    assert_equal 10_000, @payment_request.amount
    assert_equal 100, @payment_request.amount_in_dollars
  end
end
