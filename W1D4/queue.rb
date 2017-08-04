class Queue
	def initialize
		@list = []
	end

	def enqueue(el)
		@list.push(el)
	end

	def dequeue
		@list.shift
	end

	def show
		@list.dup
	end
end
