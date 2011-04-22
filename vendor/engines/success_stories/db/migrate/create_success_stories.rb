class CreateSuccessStories < ActiveRecord::Migration

  def self.up
    create_table :success_stories do |t|
      t.string :title
      t.integer :photo_id
      t.text :story
      t.integer :position

      t.timestamps
    end

    add_index :success_stories, :id

    load(Rails.root.join('db', 'seeds', 'success_stories.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "success_stories"})

    Page.delete_all({:link_url => "/success_stories"})

    drop_table :success_stories
  end

end
