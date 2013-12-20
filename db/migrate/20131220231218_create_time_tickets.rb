class CreateTimeTickets < ActiveRecord::Migration
  def change
    create_table :time_tickets do |t|
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
