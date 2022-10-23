# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  include DollarConvertable

  belongs_to :customer

  validates :status, presence: true
  validates :amount, presence: true

  enum status: {
    generated: "generated",
    sent: "sent",
    canceled: "canceled",
    collected: "collected"
  }
end
