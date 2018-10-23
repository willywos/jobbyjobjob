class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.integer :user_id, null: false
      t.jsonb :data
      t.timestamps
    end
  end
end
