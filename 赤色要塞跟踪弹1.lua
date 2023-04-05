--   						˵��
--			��fceux����fc��ɫҪ��
--Ȼ�����β���file-> lua ->  New Lua Script Window...
--Script File:�Ǵ���lua��·��,run��ʹ��

--���� ���ٵ�
dir = { 
			{0,0x0d,0xFC,0,				0,"��","��������by��ȻС�� qq108201645����"},
		{0x80,0x0d,4,0,					4,"��"},
			{0x40,0x0f,0,0xFC,		6,"��"},
			{0,0x0f,0,0x4,				2,"��"},
			{0x40,0x0e,0xfd,0xfd,	7,"�I"},
			{0xc0,0x0e,0x02,0xfd,	5,"�L"},
			{0,0x0e,0xfd,2,				1,"�J"},
			{0x80,0x0e,2,2,				3,"�K"}
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

--�����б�
Npc ={
	{0x1,"С�� 1",8},
	{0x2,"С�� 1",8},
	{0x3,"��ǹС�� 1",8},
	{0x4,"С�� 4",8},
	{0x5,"��̨1",5},
	{0x6,"��̨2",5},
	{0x7,"��̹��",4},
	{0x8,"С��",2},
	--{0x9,"  "},
	{0xa,"��̹��",5},--��1��boss
	
	{0xb,"��װ̹��",4},
	{0xe,"��ǹ̹��",4},
	{0xf,"��ɫС��",4},
	{0x10,"ʯ��",2},
	{0x11,"����",4},
	{0x18,"������",4},--��2��boss
	{0x1a,"СǱͧ",2},
	{0x1e,"�����ʯ��",3},
	{0x1f,"ʯ��",2},
	{0x23,"��װ̹��",5},
	{0x24,"��̹��",5},
	{0x29,"СǱͧ",8},
	{0x2a,"���ӵ�����",5},
	{0x2b,"���ӵ�����",5},
	{0x2f,"��ʯ",4},
	{0x30,"��ʯ",4},
	{0x31,"����",5},
	{0x33,"��",2},
	{0x39,"����",3},
	{0x3a,"�ɻ�",2},
	{0x3b,"�ɻ�",2},
	{0x43,"Сֱ����",3},
	{0x47,"�չ���̨",4},
	{0x4a,"�չ���̨",2},
	{0x4b,"�չ�������",4},
	{0x4f,"�չظ�����",5},
	{0x8c,"��ʯ��̨",6},
		{0x92,"���������̨",4},
	--{0x96,"�̴�����Ա"},
	{0xa1,"������",4},
	{0xa2,"������",4},
	{0xac,"������ĵ���̨",3},
	{0xad,"������ĵ���̨",4},
	{0xae,"ƽ�����������̨",4},
	{0xc0,"ֱ����",5},
	{0xce,"ͣ�ź�ɫС��",2},
	{0xd0,"�������",2},
	--{0xd1,"���������",0}
	{0xd3,"ͣ�ź�ɫС��",2}
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

	 --�����ʺϵĵ���
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
		--������С����ĵ���
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
		--���нǶȼ���
			local result =nil start=nil
				--��ȡ�ϴη���
				
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
		--�������
		  
		  if start ~=nil and result ~= nil then
		  local dr=angle_diff(degrees[start] ,degrees[result])

					if  dr> 45 then
						--emu.print(dir[result][6])
					
						--������ת���ȴ���(�ȵ�Ŀ��ת������)
						
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
									--emu.print("����")
									--emu.pause()
								elseif counter == 2 then
									result = dir_table_find(AND(dir[start][5]+1,7))
									--emu.print("����")
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