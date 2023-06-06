#!/usr/bin/lua

function Multiple_encryption(number, input)
	for i=1, number, 1 do
		input=Encrypt(input)
	end
	return input
end

function Multiple_decryption(number, input)
	for i=1,number, 1 do
		input=Decrypt(input)
	end
	return input
end

function Encrypt(input)
	local encrypted = ""
	for i=1, #input do --it reads the value and then calls the other function to change the every single character into an hex value
		encrypted = encrypted .. Tohex(tonumber(string.byte(input,i))) .. " " --this variable continues to add to itself bits that the Tohex() function gives after entering the corresponding number to a character
	end
	return encrypted
end

function Tohex(number) --NOTE: this function works with every character that you input
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
end -- it's horrendous, but it works, therefore do not complain

function Decrypt(encrypted_string)
	local unhexed_string = ""
	for i in string.gmatch(encrypted_string, "[^%s]+") do --it searches the white space and assings it to the variable i
		unhexed_string = unhexed_string .. string.char(Unhex(i)) --this string gets continously updated by adding new bits of string every time (it converts a number obtained by the function Unhex into a character)
	end
	return unhexed_string
end

function Unhex(number_to_decrypt)
	local Dictionary = {["0"]=0,["1"]=1,["2"]=2,["3"]=3,["4"]=4,["5"]=5,["6"]=6,["7"]=7,["8"]=8,["9"]=9,["A"]=10,["B"]=11,["C"]=12,["D"]=13,["E"]=14,["F"]=15}
	local decrypted_number=0
	for i=1, #number_to_decrypt do
		decrypted_number = decrypted_number + Dictionary[string.sub(number_to_decrypt,i,i)]*16^(#number_to_decrypt-i)
		--print(string.sub(number_to_decrypt,i,i),Dictionary[string.sub(number_to_decrypt,i,i)])
		--print(decrypted_number)
	end
	return decrypted_number
end

function Se()
	print("Please enter your input string: ")
	local Input_read = io.read()

	print("Please insert the number of times that you want it encrypted: ")
	local number_encryption = tonumber(io.read())

	local multiple_hex = Multiple_encryption(number_encryption, Input_read)
	print("multiple times encrypted string: "..multiple_hex)
end

function Fe()
	print("Please enter your file name (and path): ")
	local File_name = io.read()

	local file = io.open(File_name, "r")
	if not file then return nil end
	local content = file:read("*a")

	print("Please insert the number of times that you want it encrypted: ")
	local number_encryption = tonumber(io.read())

	local multiple_hex = Multiple_encryption(number_encryption, content)
	print("multiple times encrypted file: ".."\n"..multiple_hex)

	local encr_file = io.open(File_name..".hex", "w")
	if not encr_file then return nil end
	encr_file:write(multiple_hex)

	file:close()
	encr_file:close()
end

function Sd()
	print("Please enter your input string: ")
	local Input_read = io.read()

	print("Please insert the number of times that you want it decrypted: ")
	local number_encryption = tonumber(io.read())

	local multiple_decrypt = Multiple_decryption(number_encryption, Input_read)
	print("multiple times decrypted string: "..multiple_decrypt)
end

function Fd()
	print("Please enter your file name (and path): ")
	local File_name = io.read()

	local file = io.open(File_name, "r")
	if not file then return nil end
	local content = file:read("*a")

	print("Please insert the number of times that you want it dencrypted: ")
	local number_encryption = tonumber(io.read())
	
	local multiple_decrypt = Multiple_decryption(number_encryption, content)
	print("multiple times decrypted string: ".."\n"..multiple_decrypt)

	local decr_file = io.open("decr_"..File_name, "w")
	if not decr_file then return nil end
	decr_file:write(multiple_decrypt)

	file:close()
	decr_file:close()
end

function Help()
	print("To use this program, you need to write 'lua encrypt.lua *mode*'.\nThen you need to follow the written instructions")
end

function Main()
	if arg[1]==nil then
		print("invalid argument, try 'se', 'fe', 'sd', 'fd' or 'help'")
		Help()
		return
	elseif arg[1]=="se" then Se()
	elseif arg[1]=="sd" then Sd()
	elseif arg[1]=="fe" then Fe()
	elseif arg[1]=="fd" then Fd()
	elseif arg[1]=="help" then Help()
	else
		print(arg[1].." isn't a valid input, try 'se', 'fe', 'sd', 'fd' or 'help'")
	end
	--print(arg[0].." "..arg[1])
end

Main()
