class StripeCardsService

  attr_reader :user
  def initialize(user)
    @user = user
  end

  delegate :cards, to: :customer

  # def cards
  #   customer.cards
  # end

  private

  def customer
    Stripe::Customer.retrieve(customer_id)
  end

  def customer_id
    stripe_account.stripe_id
  end

  def stripe_account
    user.stripe_account || user.create_stripe_account do |u|
      u.stripe_id = Stripe::Customer.create(
        email: user.email
      )
    end
  end
end