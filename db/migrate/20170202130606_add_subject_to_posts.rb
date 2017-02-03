class AddSubjectToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :subject, :text
  end
end
