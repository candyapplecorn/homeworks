module Toyable
	extend ActiveSupport::Concern

	included do
		has_many :toys, as: :toyable
	end

	def	receive_toy(name)
		self.toys.create(name: name)
	end
end
