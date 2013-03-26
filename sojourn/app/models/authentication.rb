class Authentication < ActiveRecord::Base
  belongs_to :author
  attr_accessible :provider, :uid, :user_id

end
