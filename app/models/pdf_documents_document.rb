class PdfDocumentsDocument < ActiveRecord::Base
  unloadable
  
  belongs_to :user
	belongs_to :project
	has_many :pdf_documents_wiki_pages, :dependent => :destroy, :order => "wiki_page_order"
	
	validates_presence_of :name, :title, :author
	
end