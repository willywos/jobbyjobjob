class AddNameToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :name, :string
  end
end
