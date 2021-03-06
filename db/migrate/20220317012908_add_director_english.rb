class AddDirectorEnglish < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :director, :string
    add_column :movies, :english, :string
    change_column :movies, :english, 'boolean USING CAST(english AS boolean)'
    change_column_null :movies, :english, false, true
    change_column_default :movies, :english, true
    
    # if the exercise didn't want us to convert string > bool and update tables, it would be:
    # add_column :movies, :english, :boolean, null: false, default: true
  end
end