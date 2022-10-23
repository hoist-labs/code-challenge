# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
end
