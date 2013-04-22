class Event < ActiveRecord::Base
  attr_accessible :body, :title,:description, :assets_attributes
has_many :assets, :dependent => :destroy
accepts_nested_attributes_for :assets, :allow_destroy => true
searchable do
  text :title, :boost => 5
  text :body
  text :description
time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end
  
end
