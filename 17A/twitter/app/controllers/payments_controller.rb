class PaymentsController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    StripePaymentService.new(current_user, params[:stripeToken]).create!(@amount)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end