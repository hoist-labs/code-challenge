# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    customers_generated = Customer.joins(:payment_requests).order('payment_requests.updated_at').where('payment_requests.status = ?', PaymentRequest.statuses[:generated]).select('first_name, last_name, status, amount, payment_requests.id as payment_id')
    customers_responsed = Customer.joins(:payment_requests).where('payment_requests.status != ?', PaymentRequest.statuses[:generated]).select('first_name, last_name, status, amount, payment_requests.id as payment_id')

    @customers = customers_generated - customers_responsed

  end

  def update_payment
    if params[:payment_id].present?
      PaymentRequest.update(params[:payment_id], status: PaymentRequest.statuses[:collected])
      redirect_to :action => "main"
    else
      render :file => Rails.root.join('public', '404.html'), :status => 404
    end
  end
end
