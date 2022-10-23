class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status
      t.integer :amount

      t.timestamps
    end
  end
end
