if Rails::VERSION::MAJOR >= 3
  
  RedmineApp::Application.routes.draw do

    # routes for pdf documents
    match '/pdf_documents/index', :controller => 'pdf_documents', :action => 'index'
    match '/pdf_documents/new', :controller => 'pdf_documents', :action => 'new'
    match '/pdf_documents/edit', :controller => 'pdf_documents', :action => 'edit'
    match '/pdf_documents/delete', :controller => 'pdf_documents', :action => 'delete'
    match '/pdf_documents/generate', :controller => 'pdf_documents', :action => 'generate'

    # routes for pdf documents wiki pages  
    match '/pdf_documents_wiki_pages/index', :controller => 'pdf_documents_wiki_pages', :action => 'index'
    match '/pdf_documents_wiki_pages/new', :controller => 'pdf_documents_wiki_pages', :action => 'new'
    match '/pdf_documents_wiki_pages/edit', :controller => 'pdf_documents_wiki_pages', :action => 'edit'
    match '/pdf_documents_wiki_pages/edit_order', :controller => 'pdf_documents_wiki_pages', :action => 'edit_order'
    match '/pdf_documents_wiki_pages/delete', :controller => 'pdf_documents_wiki_pages', :action => 'delete'
    
  end
  
else

  ActionController::Routing::Routes.draw do |map|
  
    # routes for pdf documents
    map.connect '/pdf_documents/index', :controller => 'pdf_documents', :action => 'index'
    map.connect '/pdf_documents/new', :controller => 'pdf_documents', :action => 'new'
    map.connect '/pdf_documents/edit', :controller => 'pdf_documents', :action => 'edit'
    map.connect '/pdf_documents/delete', :controller => 'pdf_documents', :action => 'delete'
    map.connect '/pdf_documents/generate', :controller => 'pdf_documents', :action => 'generate'

    # routes for pdf documents wiki pages  
    map.connect '/pdf_documents_wiki_pages/index', :controller => 'pdf_documents_wiki_pages', :action => 'index'
    map.connect '/pdf_documents_wiki_pages/new', :controller => 'pdf_documents_wiki_pages', :action => 'new'
    map.connect '/pdf_documents_wiki_pages/edit', :controller => 'pdf_documents_wiki_pages', :action => 'edit'
    map.connect '/pdf_documents_wiki_pages/edit_order', :controller => 'pdf_documents_wiki_pages', :action => 'edit_order'
    map.connect '/pdf_documents_wiki_pages/delete', :controller => 'pdf_documents_wiki_pages', :action => 'delete'

  end

end