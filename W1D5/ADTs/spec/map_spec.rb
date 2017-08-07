require_relative '../map'

RSpec.describe Map, '#map' do
	context "Starting empty" do
		it "accepts items" do
			map = Map.new
			map.assign("dogs", "suck")
			map.assign("cats", "are no exception")
			expect map.show.length == 2
		end
	end
	
	context "Starting with contents" do

		it "finds items" do
			map = Map.new
			map.assign("dogs", "suck")
			map.assign("cats", "are no exception")

			expect map.lookup("dogs") == "suck"
		end

		it "doesn't find items it doesn't contain" do
			map = Map.new
			map.assign("dogs", "suck")
			map.assign("cats", "are no exception")

			expect map.lookup("dogssss") == nil 
		end

		it "removes items" do
			map = Map.new
			map.assign("dogs", "suck")
			map.assign("cats", "are no exception")
			map.remove("dogs")

			expect map.show.length == 1 
		end
	end
end
