class AddPasswordToDealers < ActiveRecord::Migration[5.0]
  def change
    add_column :dealers, :password_digest, :string
  end
end
