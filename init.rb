require 'redmine'
require 'application_controller'

module PdfDocumentsWikiExtFilterControllerPatch
  ApplicationController.accept_api_auth :filter
end

Redmine::Plugin.register :redmine_pdf_documents do
  name 'Redmine PDF Documents plugin'
  author 'Klaus Meyer, Massimo Rossello'
  description 'Create PDF documents from multiple wiki pages'
  version '0.0.3'
  url 'https://github.com/maxrossello/redmine_pdf_documents'
  author_url 'http://www.klaus-meyer.net'

	# Redmine Version
	requires_redmine :version_or_higher => "2.0.0"

	# Project Module
	project_module :pdf_documents do
		permission :pdf_documents_index, {:pdf_documents => [:index, :new, :edit, :delete, :generate], :doc_pu_wiki => [:index]}
	end

	# Menu entries
	menu :project_menu, :pdf_documents, {:controller => "pdf_documents", :action => "index"}, :caption => "PDF Export", :after => :wiki, :param => :project_id

end

Rails.configuration.to_prepare do
  unless WikiController.included_modules.include?(PdfDocumentsMacroPatch)
      WikiController.send(:include, PdfDocumentsMacroPatch)
  end

  begin
    require_dependency 'wiki_external_filter_controller'
    unless WikiExternalFilterController.included_modules.include?(PdfDocumentsWikiExtFilterControllerPatch)
      WikiExternalFilterController.send(:include, PdfDocumentsWikiExtFilterControllerPatch)
    end
  rescue LoadError
    # wiki external filter plugin not installed
  end
end



