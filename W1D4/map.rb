class Map
	def initialize
		@map = []
	end

	def assign(k, v)
		fnd_idx = lookup(k)
		fnd_idx ? @map[fnd_idx] = [k, v] : @map.push([k, v])
	end

	def lookup(k)
		idx = @map.index do |tuple|
			tuple.first == k
		end	

		idx.nil? ? nil : @map[idx].last
	end

	def remove(k)
		@map.reject! {|tuple| tuple.first == k}
	end

	def show
		@map.map{|tuple| tuple.dup}
	end
end
