class Author < ActiveRecord::Base

  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  # :confirmable,
  
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  validates_confirmation_of :password,
  message: "should match confirmation",
  if: :password
end
