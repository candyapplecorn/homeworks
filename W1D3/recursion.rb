# Exercise 5
def reverse(str)
	return "" if str == ""

	return str[-1] + reverse(str[0, str.length - 1])
end

#p reverse("house") == "esuoh"
#p reverse("dog") == "god"
#p reverse("atom") == "mota"
#p reverse("q") == "q"
#p reverse("id") == "di"
#p reverse("") == ""

# Exercise 4
def ice_cream_shop(flavors, favorite)
	return false if flavors.empty?

	return true if flavors.first == favorite

	_, *remaining = flavors

	return ice_cream_shop(remaining, favorite)
end

#p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  
#p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  
#p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  
#p ice_cream_shop(['moose tracks'], 'moose tracks')  
#p ice_cream_shop([], 'honey lavender')  

# Exercise 3
def gamma_fnc(n)
	return nil if n == 0

	return 1 if n == 1

	return (n - 1) * gamma_fnc(n - 1)
end

#p gamma_fnc(0) == nil
#p gamma_fnc(1) == 1
#p gamma_fnc(4) == 6
#p gamma_fnc(8) == 5040

# Exercise 2
def add_numbers(nums_array)
	return nil if nums_array.length == 0

	return nums_array.first if nums_array.length == 1

	return nums_array.shift + add_numbers(nums_array)
end

#p add_numbers([1, 2, 3, 4]) == 10
#p add_numbers([3]) == 3
#p add_numbers([-80, 34, 7]) == -39
#p add_numbers([]) == nil

# Exercise 1
def sum_to(to)
	return nil if to < 0

	return 1 if to == 1

	return to + sum_to(to - 1)
end

#p sum_to(5) == 15
#p sum_to(1) == 1
#p sum_to(9) == 45
#p sum_to(-8) == nil
