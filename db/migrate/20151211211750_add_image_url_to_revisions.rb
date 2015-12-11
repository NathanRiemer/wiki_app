class AddImageUrlToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :image_url, :string
  end
end
