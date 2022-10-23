# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    @customers = Customer.all
  end
end
