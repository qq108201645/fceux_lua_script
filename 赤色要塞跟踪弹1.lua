--   						说明
--			用fceux加载fc赤色要寒
--然后依次操作file-> lua ->  New Lua Script Window...
--Script File:是代表lua的路径,run是使用

--增加 跟踪弹
dir = { 
			{0,0x0d,0xFC,0,				0,"↑","本程序由by悠然小赐 qq108201645制作"},
		{0x80,0x0d,4,0,					4,"↓"},
			{0x40,0x0f,0,0xFC,		6,"←"},
			{0,0x0f,0,0x4,				2,"→"},
			{0x40,0x0e,0xfd,0xfd,	7,"↖"},
			{0xc0,0x0e,0x02,0xfd,	5,"↙"},
			{0,0x0e,0xfd,2,				1,"↗"},
			{0x80,0x0e,2,2,				3,"↘"}
			};
degrees = { 
			90,
			270,
			180,
			0,
			135,
			225,
			45,
			315
}
			
system_dir = {0x82,0x83}
sprite_dir = {0x0518,0x0519}

vy ={0x05F8,0x05F9};
vx ={0x0638,0x0639};

--敌人列表
Npc ={
	{0x1,"小兵 1",8},
	{0x2,"小兵 1",8},
	{0x3,"火枪小兵 1",8},
	{0x4,"小兵 4",8},
	{0x5,"炮台1",5},
	{0x6,"炮台2",5},
	{0x7,"棕坦克",4},
	{0x8,"小船",2},
	--{0x9,"  "},
	{0xa,"蓝坦克",5},--第1关boss
	
	{0xb,"武装坦克",4},
	{0xe,"火枪坦克",4},
	{0xf,"黑色小车",4},
	{0x10,"石柱",2},
	{0x11,"卡车",4},
	{0x18,"土雕像",4},--第2关boss
	{0x1a,"小潜艇",2},
	{0x1e,"滚落的石柱",3},
	{0x1f,"石柱",2},
	{0x23,"武装坦克",5},
	{0x24,"棕坦克",5},
	{0x29,"小潜艇",8},
	{0x2a,"发子弹卡车",5},
	{0x2b,"发子弹卡车",5},
	{0x2f,"滚石",4},
	{0x30,"滚石",4},
	{0x31,"电门",5},
	{0x33,"火车",2},
	{0x39,"导弹",3},
	{0x3a,"飞机",2},
	{0x3b,"飞机",2},
	{0x43,"小直升机",3},
	{0x47,"终关炮台",4},
	{0x4a,"终关总台",2},
	{0x4b,"终关总炮手",4},
	{0x4f,"终关副炮手",5},
	{0x8c,"岩石炮台",6},
		{0x92,"钻出来的炮台",4},
	--{0x96,"绿待救人员"},
	{0xa1,"蓝雕像",4},
	{0xa2,"蓝雕像",4},
	{0xac,"钻出来的导弹台",3},
	{0xad,"钻出来的导弹台",4},
	{0xae,"平地钻出来的炮台",4},
	{0xc0,"直升机",5},
	{0xce,"停放黑色小车",2},
	{0xd0,"红五角星",2},
	--{0xd1,"闪砾五角星",0}
	{0xd3,"停放黑色小车",2}
}
npc_No =0x0720
npc_No_y =  0x0560
npc_No_x = 0x0710
npc_No_status =0x0520

function dir_table_find(v)
	
	local i=0;
	
	for j=1,table.getn(dir) do
		if dir[j][5]== v then
			i = j
			break
		end
	end
	--emu.print("v=",v," i=",i,"dir[i][5] = ",dir[i][5])
	return i;
end

function angle_diff(a,b)
	local phi=math.abs(a-b)
	
	if phi > 180 then
	  return 360-phi
	else
		return phi
	end
end

title_counter = 0 dest =0


function display_popup()
		emu.addgamegenie("AONTNTEP")
		emu.addgamegenie("GVNTOYTP")
		emu.addgamegenie("GVNVSYAZ")
	if(title_counter ~= 1) then
			gui.popup(dir[1][7],"","")
			local len  = string.len(dir[1][7])
			--emu.print(string.len(dir[1][7]))
			if len < 0x1c and len >0x23 then
				return -1
			end
			title_counter=1
			return 1
	end
	return 0
end

function  missile_tracking()
		
		--memory.writebyte(0x50,2)
	
	
	local min_dx = 1000
  local min_dy = 1000
	for i=0, memory.readbyte(0x39) and 1 do
	--emu.print(min_dx,min_dy)
		
		if memory.readbyte(0x0538+i)~=0 and memory.readbyte(0x0538+i)~=8 and memory.readbyte(0x50+i)>0 then
	 		local cy=memory.readbyte(0x0578+i)
	 		local cx=memory.readbyte(0x05b8+i)+memory.readbyte(0x40)
		  local ci=1
	  	local arr={}
	  
	 		 memory.writebyte(0x0618,0)
	 		 memory.writebyte(0x0658,0)

	 --查找适合的敌人
			for j=1,16 do
	 			for k=1,table.getn(Npc) do
	 				--emu.print(string.format("%x", memory.readbyte(npc_No_status+j-1) ))
	 				if memory.readbyte(npc_No+j-1) ==  Npc[k][1] and memory.readbyte(0x0700+j-1) ==0 
	 				and  memory.readbyte(npc_No_status+j-1) < Npc[k][3]
	 				then
	 					
	 				  if math.abs((memory.readbyte(0x06f0+j-1)*256+memory.readbyte(npc_No_x + j -1))-cx)<0xf0 and 
	 				  math.abs((memory.readbyte(0x06f0+j-1)*256+memory.readbyte(npc_No_x + j -1))-memory.readbyte(0x40))<0xff and
	 				   math.abs(memory.readbyte(0x06f0+j-1)*256+memory.readbyte(npc_No_x + j -1)) > memory.readbyte(0x40) then
	 				   
	 						arr[ci] = j-1;
	 					--emu.print(arr[ci])
	 						ci = ci +1
	 						
	 					--emu.print(string.format("%x",j))
	 					end
	 				end
	 			end
		 end
		--遍历最小距离的敌人
		--emu.print(table.getn(arr))
			local flag = nil

			if arr ~= nil then
				for j=1,table.getn(arr) do
					local nx=memory.readbyte(npc_No_x+arr[j])+memory.readbyte(0x06f0+arr[j])*256;
					local ny=memory.readbyte(npc_No_y+arr[j])
					
					if math.sqrt(math.abs((cx-nx)*(cx-nx)) + math.abs((cy-ny)*(cy-ny)))
					< math.sqrt(math.abs( (cx - min_dx) *(cx - min_dx)) + math.abs((cy - min_dy)*(cy - min_dy) )) then
				   --emu.print(string.format("%x",0x06f0+arr[j]))
						min_dx=nx
						min_dy=ny
						dest = arr[j]
						flag=1
						
					end
				end
			end
		--进行角度计算
			local result =nil start=nil
				--获取上次方向
				
				for j=1,table.getn(dir) do
					if memory.readbyte(system_dir[i+1]) == dir[j][1] and memory.readbyte(sprite_dir[i+1]) == dir[j][2]  then
						start = j
						break
						--emu.print("start:",dir[start][6])
					end
				end
				
			if flag ~=nil then
				local tmp =360
				for j=1,table.getn(degrees) do
					local gy=min_dy-cy gx=min_dx-cx
					 local angle = math.fmod(360-math.atan2(gy,gx) *180 /3.14,360)
					 if math.abs(degrees[j] - angle)<tmp then
					 -- emu.print(cx,cy,min_dx,min_dy,angle)
						
					 	result= j;
					 	--emu.print(string.format("%x,cx:%d,cy:%d, min_dx:%d,min_dy:%d, degrees:%d ,angle %d",result,cx,cy,min_dx,min_dy,degrees[j],angle))
					 	tmp=math.abs(degrees[j] - angle)
					 	--emu.pause()
					 end
				end
			end
		--结果处理
		  
		  if start ~=nil and result ~= nil then
		  local dr=angle_diff(degrees[start] ,degrees[result])

					if  dr> 45 then
						--emu.print(dir[result][6])
					
						--二分旋转优先处理(先到目标转角优先)
						
						--emu.print( degrees[start] ," ",degrees[result] ," ",math.abs(degrees[start] -degrees[result]))
							--emu.pause()
							local left_rotate =start right_rotate = start 
							if start ~= result then
								if counter ==0 or counter == nil then
									for j=1,table.getn(dir) do
								
										left_rotate = dir_table_find(AND(dir[left_rotate][5]-1,7))
										
										if dir[left_rotate][5] == dir[result][5] then
												--emu.print("1 result:",result," ",dir[result][6])
												counter =1
												break
											
										end
										
										right_rotate = dir_table_find(AND(dir[right_rotate][5]+1,7))
										if dir[right_rotate][5] == dir[result][5] then
					
												--emu.print("2 result:",result," ",dir[result][6])
												counter = 2
											
												break
											
										end
									end
								end
								if counter == 1 then
									result = dir_table_find(AND(dir[start][5]-1,7))
									--emu.print("左旋")
									--emu.pause()
								elseif counter == 2 then
									result = dir_table_find(AND(dir[start][5]+1,7))
									--emu.print("右旋")
									--emu.pause()
								end
								
							end
							if counter ~= 0 and counter ~=nil then
									--emu.print(counter)
									memory.writebyte( system_dir[i+1],dir[result][1])
				 					memory.writebyte(sprite_dir[i+1],dir[result][2])
									memory.writebyte(vy[i+1],dir[result][3])
									memory.writebyte(vx[i+1],dir[result][4])
									--emu.print(dir[result][6])
							end
						
				 
					end
			end
		end
		
		 if memory.readbyte(0x0520+dest) == 0 or memory.readbyte(0x0538+i)==0 or memory.readbyte(0x0538+i)==8 then
	  	counter = 0
	  end
	  
	 end
	
end
--main
while (true) do
	 display_popup()
	 if title_counter == 1 then
	    gui.text(20,208,"trackingMode",0xffffffff,0x38383864);
		 missile_tracking()
	 end
	 FCEU.frameadvance();
end