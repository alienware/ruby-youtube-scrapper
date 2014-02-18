class Recommendation < ActiveRecord::Base
	belongs_to :from, :class_name => 'Video'
	belongs_to :to, :class_name =>  'Video'
end
