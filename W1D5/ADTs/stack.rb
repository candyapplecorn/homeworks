 class Stack
    def initialize
      # create ivar to store stack here!
	@list = []
    end

    def add(el)
      # adds an element to the stack
	@list.push(el)
    end

    def remove
      # removes one element from the stack
	@list.pop
    end

    def show
      # return a copy of the stack
	@list.dup
    end
  end
