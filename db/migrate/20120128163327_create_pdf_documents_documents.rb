class CreatePdfDocumentsDocuments < ActiveRecord::Migration
  def self.up
    create_table :pdf_documents_documents do |t|
			t.column :name, :string
			t.references :user
			t.references :project
			t.column :build_at, :datetime
			t.column :author, :string
			t.column :title, :string
			t.timestamps    
		end
  end

  def self.down
    drop_table :pdf_documents_documents
  end
end
