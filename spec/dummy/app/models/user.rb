class User < ActiveRecord::Base
  
  def can_manage_mero_cms
    true
  end
end
