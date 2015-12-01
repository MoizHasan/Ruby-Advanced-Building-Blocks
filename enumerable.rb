module Enumerable

	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end
	
	def my_each_with_index
		return self unless block_given?
		index = 0
		for i in self
			yield(i, index)
			index += 1
		end
	end
	
	def my_select
		return self unless block_given?
		array = []
		self.my_each do |i|
		is_selected = yield(i)
		array << i if is_selected
		end
		return array
	end
		
	def my_all?
		return self unless block_given?
		all = true
		self.my_each do |i|
			return false if yield(i) == false
		end
		return true
	end
	
	def my_any?
		return self unless block_given?
		is_any = false
		self.my_each do |i|
			if yield(i) == true
				is_any = true
			end
			return is_any
		end
	end
		
	def my_none?
		return self unless block_given?
		is_none = true
		self.my_each do |i|
			if yield(i) == true
				is_none = false
			end
			return is_none
		end
	end
	
	def my_count
		return self unless block_given?
		count = 0
		self.my_each do |i|
			if yield(i) == true
				count = count + 1
			end
			return count
		end
	end
	
	
	def my_map(proc = nil)
		map = []
		unless proc 
			self.my_each do |i|
				map << yield(i)
			end
			return map
		end
		self.my_each do |i|
			i = yield(i) if block_given?
			map << proc.call(i)
		end
		return map
	end
	

	def my_inject(total = 0)
		self.my_each do |i|
			total = (yield total, i)
		end
		return total
	end
	
	def multiply_els
		self.my_inject(1) { |result, num| result * num }
	end
	

	
	@a = ["a","bit city life","c","hold on tight","e","zzzz","hit me up"]
	@b = {a: "bit city life",c: "hold on tight",p: "piratess"}
	test_proc = Proc.new {|i| i*2}

#@a.my_each_with_index {|a,b| puts "#{a} #{b}"}
#@a.each_with_index {|a,b| puts "#{a} #{b}"}
#puts [1,2,3,4,5,6].my_select {|number| number % 2 == 0}
#puts [4,2,5].all? {|number| number % 2 == 0}
#puts [4,2,5].my_all? {|number| number % 2 == 0}
puts [1,3,5].my_map(test_proc) {|i| i*2}
#puts [2,4,5].my_inject(1)  { |result, num| result * num }
#puts [2,4,5].multiply_els


end