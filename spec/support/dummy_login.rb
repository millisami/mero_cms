RSpec.configure do |c|
  c.before(:each) do
    
    ::ApplicationController.class_eval <<-STRING
      def current_user
        nil
      end
      helper_method :current_user
    STRING
    
  end
end

def sign_out!
  ApplicationController.class_eval <<-STRING
    def current_user
      nil
    end
    helper_method :current_user
  STRING
end

def sign_in!(options={})
  ApplicationController.class_eval <<-STRING
    def current_user
      user = User.find_or_create_by_login("mero_cms_user")
      user.stubs(:can_manage_mero_cms).returns(false)
      user
    end
    helper_method :current_user
  STRING
end

def sign_in_as_authorized!(options={})
  ApplicationController.class_eval <<-STRING
    def current_user
      user = User.find_or_create_by_login("mero_cms_user")
      user.stubs(:can_manage_mero_cms).returns(true)
      user
    end
    helper_method :current_user
  STRING
end