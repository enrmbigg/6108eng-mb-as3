class Event < ActiveRecord::Base
  attr_accessible :body, :title,:description

# def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     find(:all)
#   end
# end
  
end
