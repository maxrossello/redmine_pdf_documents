require_dependency 'wiki_controller'
require 'pdf_document_helper_patch'

# allows for resolving wiki macros through html rendering + html/pdf conversion
module PdfDocumentsMacroPatch
    
    def self.included(base)
        base.send(:include, InstanceMethods)
        base.send(:include, PdfDocumentHelperPatch)
        base.class_eval do
            unloadable

            alias_method_chain :show, :fullpdf
        end
    end

    module InstanceMethods

        def show_with_fullpdf
          if params[:format] == 'pdf' and User.current.allowed_to?(:export_wiki_pages, @project)
            @content = @page.content_for_version(params[:version])
            pdf = pdf_html_format
            send_data(pdf, :type => 'application/pdf', :filename => "#{@page.title}.pdf")

          else
            show_without_fullpdf
          end
        end

    end

end

