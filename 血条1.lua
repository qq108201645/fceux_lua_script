--nes吞食天地1血条系统,by悠然小赐
--可额外附加一个lua脚本

fileName="" --在引号中间填入文件名即可(  如"吞2掉宝显示(可换汉字库)" 不需要后缀  )
--示例 :   fileName="吞2掉宝显示(可换汉字库)"

--设置每串颜色的分配的血条值
hp_value_per = 1000
--如果上面设置了就表示以下颜色的
hp_color ={
0xd42310ff,
0xEFE012ff,--hp_value_per 乘1以内
0xF0B060ff,--hp_value_per 乘2以内
0xa900ff,--hp_value_per 乘3以内
0xff79f0ff,--hp_value_per 乘4以内
0x10eeeeff,--hp_value_per 乘5以内
0xffffffff --比hp_value_per 乘6更大的值
}
hp_range ={
{0,hp_value_per},
{hp_value_per+1,hp_value_per*2},
{hp_value_per*2+1,hp_value_per*3},
{hp_value_per*3+1,hp_value_per*4},
{hp_value_per*4+1,hp_value_per*5},
{hp_value_per*5+1,hp_value_per*6},
}

red=0xd42310ff
white="white"
npc_offset = 0x6097
npc_hp_offset1 = 0x60d0
--npc_hp_offset2 = 0x6651
init_x = 68
npc_init_x = 68
init_y = 33
hp_height_offset = 24
hp_length=50
hp_max_length=48
hp_height=6
rom_Hp_Display_address=0x9e450

rom_remove_hp={0xea,0xea,0xea,0xea,0xea}
rom_resume_hp={0x20,0x5F,0xDE,0x18,0x03}

function drawhp(x,y,flag,i,j,hpr)
	--	emu.print(hpr)
		if flag == 1 then
		 		local tmp = (hpr-(j-1)*hp_value_per)/hp_value_per * hp_max_length
		 		--emu.print(j,"hpr:",hpr,(hpr-((j-1)*1000)),tmp)
		 		if i <=4 then
			  	gui.rect(x,y,x+tmp,y+hp_height-2,hp_color[j+1],hp_color[j+1])
			  	if tmp < hp_max_length then
			  		gui.rect(x+tmp,y,x+tmp +(hp_max_length-tmp),y+hp_height-2,hp_color[j],hp_color[j])
			  	end
			  else
			  	gui.rect( x+(hp_max_length -tmp),y,x+hp_max_length,y+hp_height-2,hp_color[j+1],hp_color[j+1])
			  	if tmp < hp_max_length then
			  		gui.rect( x ,y,x+(hp_max_length-tmp),y+hp_height-2,hp_color[j],hp_color[j])
			  	end
			  end
		 else
		 		gui.rect(x,y,x+hp_max_length,y+hp_height-2,white)
		 	--	emu.print("2",hp_max_length)
		end
		 --	emu.print(hpr)
		
		
end
function 	HP()
	local x1=init_x y1= init_y
	local x2=init_x+npc_init_x  y2=init_y 
		--emu.print(bit.lshift(1,1))
	for i=0,9 do
		if i <= 4 then
			local offset_i = i
			if memory.readbyte(npc_offset+offset_i)~=0xa3 then
				if bit.band(memory.readbyte(memory.readbyte(npc_offset+offset_i)+0x609c),0x80)==0x80 then
					local hpr = bit.lshift(memory.readbyte(npc_offset+offset_i),2)+npc_hp_offset1
					--	emu.print(string.format("%x",hpr))
					hpr  = memory.readbyte(hpr)+ bit.lshift(memory.readbyte(hpr+1),8) +
					bit.lshift(memory.readbyte(hpr+2),16)
					--emu.print(string.format("%x,",hpr))
				 	gui.box(x1,y1,x1+hp_length,y1+hp_height,0,0xddddddff) 
				 	local hp_x= x1+1 hp_y=y1+1
				 	local j=1 flag =  0
					 while(j<=table.getn(hp_range)) do
				 		--emu.print(hpr)
					 		if hpr>=hp_range[j][1] and hpr<=hp_range[j][2] then
					 			flag =1
								break
				 			end
				 			
				 			j=j+1
				 		end
				 		drawhp(hp_x,hp_y,flag,i,j,hpr)
				 		
				 end
				end
				y1 = y1+hp_height_offset
			else
				local offset_i =i+2
				
				local checkv1=bit.band(memory.readbyte(offset_i+0x609c),0x80)
				if checkv1 ==0x80  then 
					
					local hpr = bit.lshift(offset_i,2)+npc_hp_offset1
					
					hpr  = memory.readbyte(hpr)+ bit.lshift(memory.readbyte(hpr+1),8) 
					bit.lshift(memory.readbyte(hpr+2),16)
					
				 	gui.box(x2,y2,x2+hp_length,y2+hp_height,0,0xddddddff) 
				 	local hp_x= x2+1 hp_y=y2+1
				 	local j=1 flag =  0
					 while(j<=table.getn(hp_range)) do
				 	
					 		if hpr>=hp_range[j][1] and hpr<=hp_range[j][2] then
					 			flag =1
								break
				 			end
				 			
				 			j=j+1
				 		end
				 		drawhp(hp_x ,hp_y,flag,i,j,hpr)
				 		
				 end
				y2 = y2+hp_height_offset
			end
		
	end
	
end

function execPoint1()
	changeRom(rom_remove_hp)
end
function execPoint2()
	changeRom(rom_resume_hp)
end
function changeRom(data)
	for i,v in pairs(data) do
		rom.writebyte(rom_Hp_Display_address+i-1,v)
	end
	counter =0
end

function test()

local hpr = memory.readbyte(memory.readbyte(npc_offset)+0xff41)+npc_hp_offset
		local val  = memory.readbyte(hpr)+ bit.lshift(memory.readbyte(hpr+1),8) +
			bit.lshift(memory.readbyte(hpr+2),16)
	 val = val +10
	 if val >7000 then
	 	val =0
	 end
	 memory.writebyte(hpr+2, bit.rshift(val,16))
	 memory.writebyte(hpr+1, bit.rshift(val,8))
	 memory.writebyte(hpr, val)
	 
	 
	  hpr = memory.readbyte(memory.readbyte(npc_offset+1)+0xff41)+npc_hp_offset
		local val  = memory.readbyte(hpr)+ bit.lshift(memory.readbyte(hpr+1),8) +
			bit.lshift(memory.readbyte(hpr+2),16)
	 val = val -10
	 if val <0 then
	 	val =7000
	 end
	 memory.writebyte(hpr+2, bit.rshift(val,16))
	 memory.writebyte(hpr+1, bit.rshift(val,8))
	 memory.writebyte(hpr, val)
end


test_counter = 0

function loadLua()
	if test_counter ==0  and string.len(fileName)~= 0 then
		require(fileName)
		
		test_counter = 1
	end
end

while (true) do
	--memory.registerexecute(AND(65535,rom_Hp_Display_address)-19,1,execPoint1)
	--memory.registerexecute(AND(65535,rom_Hp_Display_address)-11,1,execPoint2)
	if (memory.readbyte(0xe)==0x3 or memory.readbyte(0xe)==0xa) and

	 (memory.readbyte(0xf)==0xf0) then
		
		HP()
		
	end
	--test()
	--emu.print(memory.getregister("pc"))
	--emu.pause()
	loadLua()
	FCEU.frameadvance()
end