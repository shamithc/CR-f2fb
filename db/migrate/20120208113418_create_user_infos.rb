class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :fb_id
      t.string :access_token
       t.references :user
      t.timestamps
    end
  end
end
