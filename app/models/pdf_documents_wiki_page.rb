class PdfDocumentsWikiPage < ActiveRecord::Base
  unloadable

  after_initialize :default_values
  
  belongs_to :wiki_page
	belongs_to :doc_pu_document
                                  
  private
  
  def default_values
    self.wiki_page_order ||= 0
  end  
  
end 