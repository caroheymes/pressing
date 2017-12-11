class Et < ApplicationRecord
     validates_presence_of :email, :password
     belongs_to :user
     
     
    
    def before_validation
      self.chemise = chemise_before_type_cast.gsub(',','.')
    end
end
