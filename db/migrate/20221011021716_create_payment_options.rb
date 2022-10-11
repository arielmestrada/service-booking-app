class CreatePaymentOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_options do |t|
      t.bigint :card_number
      t.string :card_type
      t.date :expiry_date
      t.string :registered_name

      t.timestamps
    end
  end
end
