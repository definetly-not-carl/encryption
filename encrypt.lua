#!/usr/bin/lua

function Encrypt()
	local stringa = Input_read --just for safety
	local value = {}
	--local temp = tostring(stringa.byte(Input_read,1))

	for i=1, #Input_read do --it reads the value and then calls the other function to change the every single character into an hex value
		local temp = tostring(stringa.byte(Input_read,i))
		local int_val = temp.byte(Input_read,i)
		--print(int_val)
		local hex= Tohex(tonumber(int_val))
		value[i]=hex
		--print(value[i])
	end
	local encrypted = value[1] .. " "
	local j=2
	while value[j]~=nil do --it jut concatenates the string
		encrypted = encrypted .. value[j] .. " "
		j=j+1
	end
	return encrypted
end

function Tohex(number) --NOTE: this function works with every character that you input, but the decrypting one could have some problems to do so
	local remainders = {}
	local i=0
	local Dictionary = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
	if number > 16 then --making the selection
		while number > 16 do --trnasforming the input value into an hex
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
		local string = Dictionary[remainders[i]+1] -- connecting int value to hex value
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

function Decrypt(encrypted_string)
	--there should be a function that takes the input strig and makes a parsing until it encounters a " " (white space)
	local unhexed_number = {}
	local unhexed_string = ""
	local string = ""
	local counter=1
	for i in string.gmatch(encrypted_string, "[^%s]+") do
		local hex_number=i
		unhexed_number[counter]=Unhex(hex_number)
		unhexed_string = unhexed_string .. string.char(unhexed_number[counter])
		counter=counter+1
	end
	return unhexed_string
end

function Unhex(number_to_decrypt)
	local Dictionary = {["0"]=0,["1"]=1,["2"]=2,["3"]=3,["4"]=4,["5"]=5,["6"]=6,["7"]=7,["8"]=8,["9"]=9,["A"]=10,["B"]=11,["C"]=12,["D"]=13,["E"]=14,["F"]=15}
	--A1
	--12
	--10
	local decrypted_number=0
	for i=1, #number_to_decrypt do
		decrypted_number = decrypted_number + Dictionary[string.sub(number_to_decrypt,i,i)]*16^(#number_to_decrypt-i)
		--print(string.sub(number_to_decrypt,i,i),Dictionary[string.sub(number_to_decrypt,i,i)])
		--print(decrypted_number)
	end
	--there should be a function that multiplies each character in hex to the corresponding power of 16
	--print("idk, it's doing nothing rn")
	return decrypted_number
end

print("Hi, this is a program that encrypts strings. Please enter your input: ")
Input_read = io.read()

local hexed = Encrypt()
print("encrypted string: ",hexed)

local unhexed = Decrypt(hexed)
print("unencrypted string: ",unhexed)
