class CreateIndividualSessions < ActiveRecord::Migration
  def change
    create_table :individual_sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end
  end
end
