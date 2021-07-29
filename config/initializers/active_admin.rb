ActiveAdmin.setup do |config|
  
  config.site_title = "Shopping Website"
  
  # config.site_title_image = "logo.png"
  
  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.batch_actions = true

  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  
  config.localize_format = :long

  config.footer = "Shopping Website"

  config.download_links = [:csv, :xml, :json, :pdf]

  # config.download_links = false

  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: "Application", url: "/", priority: 0

      menu.add label: "Sites" do |sites|
        sites.add label: "Google",
                  url: "http://google.com",
                  html_options: { target: :blank }

        sites.add label: "Facebook",
                  url: "http://facebook.com"

        sites.add label: "Github",
                  url: "http://github.com"
      end
    end
  end
end
