# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :payment_requests, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
