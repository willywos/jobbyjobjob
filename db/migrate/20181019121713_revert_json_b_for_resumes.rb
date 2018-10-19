class RevertJsonBForResumes < ActiveRecord::Migration[5.2]
  def change
    change_column :resumes, :data, :text
  end
end
