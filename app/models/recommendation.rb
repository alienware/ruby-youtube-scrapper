class Recommendation < ActiveRecord::Base
	belongs_to :from, :class_name => 'Video', :dependent => :destroy
	belongs_to :to, :class_name =>  'Video', :dependent => :destroy
end
