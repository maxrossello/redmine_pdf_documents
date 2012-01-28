class PdfDocumentsWikiPage < ActiveRecord::Base
  unloadable
  
  belongs_to :wiki_page
	belongs_to :doc_pu_document
  
end
