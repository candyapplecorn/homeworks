require_relative '../stack'

RSpec.describe Stack, '#stack' do
	context "Starting empty" do
		it "accepts items" do
			stack = Stack.new
			5.times {|i| stack.add(i * 2)}			
			expect stack.show.length == 5
		end

		it "removes items" do
			stack = Stack.new
			5.times {|i| stack.add(i * 2)}			
			stack.remove until stack.show.empty?
			expect stack.show.length == 0
		end
	end
end

