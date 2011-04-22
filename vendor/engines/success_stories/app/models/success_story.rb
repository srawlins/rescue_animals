class SuccessStory < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :story]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
