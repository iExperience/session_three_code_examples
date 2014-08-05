class CardsController < ApplicationController

  def index
    # retrive all cards for the current_user
    @cards = StripeCardsService.new(current_user).cards
  end

  def create
    # be able to add a new card
    token = current_user.stripe_account.stripe_id
    customer = Stripe::Customer.retrieve(token)
    customer.cards.create(card: params[:stripeToken])
    redirect_to cards_path
  end

  def default
    # be able to set the default payment card
    token = params[:card_token]

    customer_id = current_user.stripe_account.stripe_id
    customer = Stripe::Customer.retrieve(customer_id)
    customer.default_card = token
    customer.save

    redirect_to cards_path
  end
end