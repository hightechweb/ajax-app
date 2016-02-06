RailsAdmin.config do |config|
  # DT custom start - using rails_admin gem | https://github.com/sferik/rails_admin/wiki/Authorization
  
  # Take advantage of that extra field 'admin' we added in our User model migration file
  # in order to restrict access to the admin panel to certain users.
  config.authorize_with do
    # redirect_to main_app.root_path unless current_user.is_admin?
    # Instead of checking "is_admin?" method , check if the admin field is true or not for specific user
    redirect_to main_app.root_path unless warden.user.admin == true
  end
  # END custom DT

  
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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
