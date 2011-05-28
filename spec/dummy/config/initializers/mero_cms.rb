MeroCms::Engine.login_url = :login_url
MeroCms::Engine.logout_url = :logout_url
MeroCms::Engine.unauthorized_url = :unauthorized_url

MeroCms::Engine.current_user = :current_user

# :can_manage_mero_cms is a method that will be called on MeroCms::Engine.current_user for authorization
# should return Boolean true/false
MeroCms::Engine.can_manage_mero_cms = :can_manage_mero_cms