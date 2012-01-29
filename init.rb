require 'redmine'

Redmine::Plugin.register :redmine_pdf_documents do
  name 'Redmine PDF Documents plugin'
  author 'Klaus Meyer'
  description 'Erzeugung von PDF Dokumenten aus mehreren Wiki Seiten'
  version '0.0.1'
  url 'https://github.com/klausmeyer/Redmine-PDF-Documents'
  author_url 'http://www.klaus-meyer.net'

	# Redmine Version
	requires_redmine :version_or_higher => "1.3.0"

	# Projekt Module
	project_module :pdf_documents do
		permission :pdf_documents_index, {:pdf_documents => [:index, :new, :edit, :delete, :generate], :doc_pu_wiki => [:index]}
	end

	# Menüeintrag
	menu :project_menu, :pdf_documents_menu, {:controller => "pdf_documents", :action => "index"}, :caption => "PDFs", :after => :wiki, :param => :project_id

end
