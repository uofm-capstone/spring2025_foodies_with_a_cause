RailsAdmin.config do |config|
  config.asset_source = :webpacker
  config.main_app_name = ["Produce Bridge Admin", ""]

  ### Gem Integration
  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)
   # Authorize access to Rails Admin only for admin users
   config.authorize_with do
     # Redirect non-admin users to the root path
     redirect_to main_app.root_path unless current_user&.admin?
  end

  config.excluded_models << 'UserNotification'
  
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
