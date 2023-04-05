--组合按键只检测一次教程 by悠然小赐
local cur_key =0

press_key ={
	{"right",1},
	{"left",2},
	{"down",4},
	{"up",8},
	{"start",0x10},
	{"select",0x20},
	{"A",0x40},
	{"B",0x80},
}

local counter  = 0

function particle()


end

function handle_joypad()
	
	local tmp_key=0
	
	for i,v in pairs(press_key) do
		local t=joypad.get(1)
		if t[v[1]]  then
			tmp_key = v[2] +tmp_key
		--	emu.print(tmp_key)
		end
	end 
	
	cur_key= AND(XOR(cur_key,255),tmp_key)		
		if  cur_key~=0  then
	--	if (tmp_key == 0xc0 or tmp_key==0x88) and cur_key~=0 then
			counter  = 60
			emu.print(string.format("%X",tmp_key))
		elseif counter ~=0 then
			counter = counter -1
		-- emu.print(counter)
		end

	
		cur_key = tmp_key

	
end

function hack_particle()
	handle_joypad()
end
gui.register(hack_particle)