ActiveAdmin.register Sport do
  permit_params :name
  # menu false

  # config.per_page = 5
  config.per_page = [2, 3, 5]

 

  index do
    id_column
    column :name
    actions
  end

  sidebar :help do
    "Need help? Email us at help@example.com"
  end

  # action_item :only => :show do
  #   link_to 'Notify All', notify_all_admin_sports_path
  # end


  # collection_action :notify_all, :method => :post do
  #   puts "notifying...."
  # end

  # index as: :grid do |sport|
  #   link_to "Name", admin_sport_path(sport)
  # end
end
