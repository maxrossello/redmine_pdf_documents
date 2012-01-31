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
  
  def edit_order
    ordered_wikis = @document.pdf_documents_wiki_pages.all
    wiki = PdfDocumentsWikiPage.find(params[:id])
    move_to = params[:pdf_documents_wiki_page][:move_to]
    ordered_wikis.delete(wiki)
    case move_to
      when "highest" then ordered_wikis.insert(0, wiki)
			when "lowest" then ordered_wikis.insert(-1, wiki)
			when "higher" then ordered_wikis.insert(wiki.wiki_page_order - 1, wiki)
			when "lower" then ordered_wikis.insert(wiki.wiki_page_order + 1, wiki)
    end
    reorder_pages(ordered_wikis)
    redirect_to :controller => :pdf_documents, :action => :edit, :project_id => @project, :id => @document
  end
  
  private
  
  def find_document
		@document = PdfDocumentsDocument.find(params[:pdf_document_id])
	end

	def find_project
		@project = Project.find(params[:project_id])
	end
	
	def reorder_pages(ordered_pages)
		idx = 0
		ordered_pages.each do |page|
			unless page.nil?
				page.wiki_page_order = idx
				page.save
				idx += 1
			end
		end
	end
	
	
  
end
