module PdfDocumentHelperPatch
  def pdf_html_format

    request.format = :html
    export = render_to_string :action => 'export', :layout => false

    # image handling
    export.gsub!(/src=(.)\/([^ ]+)\1/, 'src=\1' + request.protocol + request.host_with_port + '/\2' + '?key=' + User.current.api_key + '\1')
    export.gsub!(/src=(.)([^ ]+)\?([^ ]+)\?([^ ]+)\1/, 'src=\1\2?\3&\4\1')

    # link handling
    export.gsub!(/href=(.)([^#\/])([^ ]+)\.html\1/, 'href=\1' + request.protocol + request.host_with_port + '/projects/' + @project.identifier + '/wiki/\2\3\1')
    export.gsub!(/href=(.)\/([^ ]+)\1/, 'href=\1' + request.protocol + request.host_with_port + '/\2\1')

    # convert html to pdf
    # no-outline due because multiple docs would contain just the first document's outline
    WickedPdf.new.pdf_from_string(export, :extra => '--no-outline')
  end

end
