ActiveAdmin.register_page "Calendar" do

  breadcrumb do
    ['admin', 'calendar']
  end
  
  content do
    render partial: 'calendar'
  end
end