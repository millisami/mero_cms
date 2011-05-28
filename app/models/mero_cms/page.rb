module MeroCms
  class Page < ActiveRecord::Base
    
    validates :title, 
              :presence => true,
              :format => { :with => /^[a-zA-Z0-9\-,' ]+$/ }
    validates :content, :presence => true
  end
end
