class Asset < ActiveRecord::Base
  attr_accessible :event_id,  :image
  belongs_to :event
has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "300x300>",
      :large => "600x600>"
        }
end
