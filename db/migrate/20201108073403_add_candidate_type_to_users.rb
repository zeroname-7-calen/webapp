class AddCandidateTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :candidate_type, :integer
  end
end
