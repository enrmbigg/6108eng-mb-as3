class Article < ActiveRecord::Base
  attr_accessible :body, :title, :tag_list, :image
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}

searchable do
  text :title, :boost => 5
  text :body
  text :tags
  text :comments do
    comments.map(&:body)
  end
time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end

	def tag_list
		self.tags.collect do |tag|
		tag.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		self.taggings.destroy_all
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		
		tag_names.each do |tag_name|
			tag = Tag.find_or_create_by_name(tag_name)
			tagging = self.taggings.new
			tagging.tag_id = tag.id
		end
	end

	def to_s
		name
	end

end
