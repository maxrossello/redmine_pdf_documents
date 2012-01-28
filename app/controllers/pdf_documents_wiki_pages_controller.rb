class PdfDocumentsWikiPagesController < ApplicationController
  unloadable
  
  before_filter :find_project, :find_document
  menu_item :pdf_documents_menu

  def index
    
  end

  def new
    @pdf_documents_wiki_page = PdfDocumentsWikiPage.new()
    if request.post?
      @pdf_documents_wiki_page = @document.pdf_documents_wiki_pages.create(params[:pdf_documents_wiki_page])
      if @pdf_documents_wiki_page.save
				flash[:notice] = t(:flash_page_saved)
				redirect_to :controller => :pdf_documents, :action => :edit, :project_id => @project, :id => @document
				return
			end
    end
  end

  def edit
    @pdf_documents_wiki_page = PdfDocumentsWikiPage.find(params[:id])
    if request.post?
      @pdf_documents_wiki_page.update_attributes(params[:pdf_documents_wiki_page])
      if @pdf_documents_wiki_page.save
        flash[:notice] = t(:flash_page_saved)
				redirect_to :controller => :pdf_documents, :action => :edit, :project_id => @project, :id => @document
				return
      end
    end
  end

  def delete
    @pdf_documents_wiki_page = PdfDocumentsWikiPage.find(params[:id])
    if @pdf_documents_wiki_page.destroy
      flash[:notice] = t(:flash_page_saved)
			redirect_to :controller => :pdf_documents, :action => :edit, :project_id => @project, :id => @document
			return
    end
  end
  
  private
  
  def find_document
		@document = PdfDocumentsDocument.find(params[:pdf_document_id])
	end

	def find_project
		@project = Project.find(params[:project_id])
	end
  
end
