class PdfDocumentsController < ApplicationController
  unloadable

  include Redmine::Export::PDF

	layout "base"
	menu_item :pdf_documents_menu
	before_filter :find_project, :authorize

  def index
    @documents = PdfDocumentsDocument.all
  end

  def new
    @document = PdfDocumentsDocument.new
    if request.post?
      @document = PdfDocumentsDocument.create(params[:document])
      @document.build_at = Time.now
      if @document.save
        flash[:notice] = "Dokument wurde angelegt"
        redirect_to :action => :edit, :project_id => @project, :id => @document
      end
    end
  end
  
  def edit
    @document = PdfDocumentsDocument.find(params[:id])
    if request.post?
      @document.build_at = Time.now
      if @document.update_attributes(params[:document])
        flash[:notice] = "Dokument wurde aktualisiert"
        redirect_to :action => :edit, :project_id => @project, :id => @document
      end
    end
  end
  
  def delete
    @document = PdfDocumentsDocument.find(params[:id])
    if @document.destroy
      flash[:notice] = "Dokument wurde gelöscht"
      redirect_to :action => :index, :project_id => @project
    end
  end
  
  def generate
    @document = PdfDocumentsDocument.find(params[:id])
    wiki_pages = @document.pdf_documents_wiki_pages
    pdf = ITCPDF.new(current_language)
    pdf.SetTitle(@project.name)
    pdf.alias_nb_pages
    pdf.footer_date = format_date(Date.today)
    pdf.AddPage
    pdf.SetFontStyle('B',11)
    pdf.RDMMultiCell(190,5, @project.name)
    pdf.Ln
    # Set resize image scale
    pdf.SetImageScale(1.6)
    pdf.SetFontStyle('',9)
    wiki_pages.each do |p|
      page = p.wiki_page
      pdf.RDMwriteHTMLCell(190,5,0,0, page.content.text.to_s, page.attachments, "TLRB")
      if page.attachments.any?
        pdf.Ln
        pdf.SetFontStyle('B',9)
        pdf.RDMCell(190,5, l(:label_attachment_plural), "B")
        pdf.Ln
        for attachment in page.attachments
          pdf.SetFontStyle('',8)
          pdf.RDMCell(80,5, attachment.filename)
          pdf.RDMCell(20,5, number_to_human_size(attachment.filesize),0,0,"R")
          pdf.RDMCell(25,5, format_date(attachment.created_on),0,0,"R")
          pdf.RDMCell(65,5, attachment.author.name,0,0,"R")
          pdf.Ln
        end
      end
    end
    send_data(pdf.Output, :type => 'application/pdf', :filename => "export.pdf")
  end

	private

	def find_project
		@project = Project.find(params[:project_id])
	end

end
