class CreateStripeAccounts < ActiveRecord::Migration
  def change
    create_table :stripe_accounts do |t|
      t.references :user, index: true
      t.string :stripe_id
    end
  end
end
