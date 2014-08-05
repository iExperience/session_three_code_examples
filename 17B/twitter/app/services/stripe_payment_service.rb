class StripePaymentService

  attr_reader :user, :stripe_token
  def initialize(user, stripe_token)
    @user, @stripe_token = user, stripe_token
  end

  def create!(amount)
    charge = Stripe::Charge.create(
      :customer    => customer_id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  end

  private

  def customer_id
    if user.stripe_account
      user.stripe_account.stripe_id
    else
      customer = Stripe::Customer.create(
        :email => user.email,
        :card  => stripe_token
      )

      user.create_stripe_account(stripe_id: customer.id)
      customer.id
    end
  end
end