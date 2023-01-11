#!/usr/bin/lua

function Encrypt()
	-- it should do something, but it doesn't do anything right now
	local value = {}
	local temp = ""

	for i=0, #Input_read do
		local int_val = temp.byte(Input_read,i)
		--print(temp)
		local hex= Tohex(int_val)
		value[i]=hex
		--print(value[i])
	end
	local encypted = value[0]
	local j=1
	while value[j]~=nil do
		encypted = encypted .. value[j]
		j=j+1
	end
end

function Tohex(number)
	local remainders = {}
	local i=0
	local Dictionary = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
	if number > 16 then
		while number > 16 do
			remainders[i]=number%16
			number = math.floor(number /16)
			--print(remainders[i])
			i = i +1
			if number < 16 then
				--print(number)
				remainders[i]=number
				--print(remainders[i])	
			elseif number == 16 then
				remainders[i]=0
				remainders[i+1]=1
			end
		end
		--print("\n")
		local string = Dictionary[remainders[i]+1]
		for j=i-1, 0, -1 do
			string = string .. Dictionary[remainders[j]+1]
		end
		return string
	elseif number==16 then
		local number2 = 10
		return number2
	elseif number < 16 then
		if number == 0 then
			local value=0
			return value
		else
			local number1 = Dictionary[number+1]
			return number1
		end
	end
end

print("Hi, this is a program that encrypts strings. Please enter your input: ")
Input_read = io.read()

Encrypt()
