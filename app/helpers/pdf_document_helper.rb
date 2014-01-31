module PdfDocumentHelper

  def pdf_open_url(project, page)
    request.protocol + request.host_with_port + "/projects/" + @project.identifier + "/wiki/" + page.title + ".pdf?key=" + User.current.api_key
  end

end
