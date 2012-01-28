class PdfDocumentsDocument < ActiveRecord::Base
  unloadable
  
  belongs_to :user
	belongs_to :project
	has_many :pdf_documents_wiki_pages, :dependent => :destroy
	
end
