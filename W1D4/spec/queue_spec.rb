require_relative '../queue'

RSpec.describe Queue, '#queue' do
	context "Starting empty" do
		it "accepts items" do
			queue = Queue.new
			5.times {|i| queue.enqueue(i * 2)}			
			expect queue.show.length == 5
		end

		it "removes items" do
			queue = Queue.new
			5.times {|i| queue.enqueue(i * 2)}			
			queue.dequeue until queue.show.empty?
			expect queue.show.length == 0
		end
	end
end

