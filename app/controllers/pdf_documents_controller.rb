require 'open-uri'
require_dependency 'pdf_document_helper'
require 'prawn/outline'

class PdfDocumentsController < ApplicationController
  unloadable
  
  include Redmine::Export::PDF
  include PdfDocumentHelper
  include Prawn

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
        flash[:notice] = t(:pdf_message_document_created)
        redirect_to :action => :edit, :project_id => @project, :id => @document
      end
    end
  end
  
  def edit
    @document = PdfDocumentsDocument.find(params[:id])
    if params.include?(:document)
      @document.build_at = Time.now
      if @document.update_attributes(params[:document])
        flash[:notice] = t(:pdf_message_document_saved)
        redirect_to :action => :edit, :project_id => @project, :id => @document
      end
    end
  end
  
  def delete
    @document = PdfDocumentsDocument.find(params[:id])
    if @document.destroy
      flash[:notice] = t(:pdf_message_document_deleted)
      redirect_to :action => :index, :project_id => @project
    end
  end
  
  def generate
    @document = PdfDocumentsDocument.find(params[:id])
    wiki_pages = @document.pdf_documents_wiki_pages

    filename = Rails.root.join("tmp/pdf/_doc.pdf").to_s
    append_filename = Rails.root.join("tmp/pdf/_append.pdf").to_s

    Prawn::Document.generate(filename, :template => open(pdf_open_url(@project,wiki_pages[0].wiki_page))) do |pdf|
      wiki_pages.delete_at(0)
     # pdf.footer_date = format_date(Date.today) + " - " + @document.author

      wiki_pages.each do |p|
        page = p.wiki_page
        pdf.go_to_page(pdf.page_count)
        append = Prawn::Document.new(:template => open(pdf_open_url(@project,page)))
        append.render_file(append_filename)
        (1..append.page_count).each do |template_page_number|
          pdf.start_new_page(:template => append_filename, :template_page => template_page_number)
        end
      end
    end
    
    # headers and footers

    send_file(filename, :type => 'application/pdf', :filename => @document.name + ".pdf")
  end

	private

	def find_project
		@project = Project.find(params[:project_id])
	end

end
