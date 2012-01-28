class CreatePdfDocumentsWikiPages < ActiveRecord::Migration
  def self.up
    create_table :pdf_documents_wiki_pages do |t|
    	t.references :wiki_page
			t.column :wiki_page_order, :integer
			t.references :pdf_documents_document
		end
  end

  def self.down
    drop_table :pdf_documents_wiki_pages
  end
end
