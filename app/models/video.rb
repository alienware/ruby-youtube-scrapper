class Video < ActiveRecord::Base
	has_many :recommendees, :class_name => 'Recommendation', :foreign_key => :to_id
	has_one :recommendation, :foreign_key => :from_id

	def recommendees
		videos = []
		super.each { |recommendee|
			videos << recommendee.from
		}
		videos
	end

	def recommendation= recommendeer
		Recommendation.create(:from_id => self.id, :to_id => recommendeer.id) unless recommendeer.nil?
	end
end
