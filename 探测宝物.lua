--吞食天地2宝物探测 by悠然小赐

--读取坐标
--
--全局变量
find_prt_posX= 0 find_prt_posY = 0
--探测范围为10格x 10 y 10
find_prt_range_pos=6
--开启格子
find_prt_open_display =0
find_prt_open_xy_display =0
find_prt_title = "本程序由by悠然小赐 qq108201645制作"
find_prt_star_data = {
{
	{0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x7C, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00}, 
	{0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x38, 0x00, 0xFE, 0x00, 0x38, 0x00, 0x10, 0x00, 0x10, 0x00}, 
	{0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00}

},
{
	{0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x28, 0x00, 0x10, 0x00, 0x28, 0x00, 0x44, 0x00, 0x00, 0x00}, 
	{0x00, 0x00, 0x82, 0x00, 0x44, 0x00, 0x38, 0x00, 0x38, 0x00, 0x38, 0x00, 0x44, 0x00, 0x82, 0x00}, 
	{0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82, 0x00}

}
}
find_prt_four_star ={}
find_prt_mykey = {
		0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01
}
find_prt_elem={}

find_prt_tilesize=8
find_prt_getstatus = 0
find_prt_byte_size =find_prt_tilesize+1  --宽度8

find_prt_cur_pos = 1
find_prt_pos_point ={}

function find_prt_GetCirclePoint1(r, x, y)
	for w = 0, r*2  do
	
			for  h = 0, r * 2 do
		
				local dx = r - w
				local dy = r - h; 
				if ((dx*dx + dy * dy) <= (r * r)) then
					table.insert(find_prt_pos_point,{dx+x , dy+y })
				end
			end

		end


end
function find_prt_read_pos() --函数
	find_prt_posY=memory.readbyte(0x60) + memory.readbyte(0x61) *256
	find_prt_posX=memory.readbyte(0x62) + memory.readbyte(0x63) *256
	find_prt_pos_point ={}
	
	find_prt_cur_pos=find_prt_cur_pos+1
	--for i=1,find_prt_range_pos-1 do
		find_prt_GetCirclePoint1(find_prt_range_pos,find_prt_posX,find_prt_posY)
--	end
	
end --函数结束

function find_prt_inputOut(name,x,y)
	
	--emu.print(x,y,name)
	
	local dx=x dy=y
		
		arr=name
		
		for len1 = 1,find_prt_tilesize do
			for set = 1,2 do
					for k = 1,table.getn(find_prt_mykey) do
							if arr[(len1-1) * 2 + set]~=nil and AND(arr[(len1-1) * 2 + set],find_prt_mykey[k])~=0 then
								 gui.pixel(dx,dy,"white")
							end
								dx =dx+1
					end
			end
			dy=dy+1 dx=x
		end
		
end
function find_prt_starHandle(nameP,x,y)
	--	emu.print(x,y,name)
	if table.getn(find_prt_four_star) < 5 then
		local random_numX=math.random(1,15)
		local random_numY=math.random(1,15)
		local random_Cnt=math.random(1,3)
		local random_No=math.random(1,2)
		
		table.insert(find_prt_four_star,{random_No,random_Cnt,x+random_numX,y +random_numY,0})
	end
	for i=1,table.getn(find_prt_four_star) do
		local a1=find_prt_four_star[i][1] a2 =find_prt_four_star[i][2]
		find_prt_inputOut(nameP[a1][a2],find_prt_four_star[i][3],find_prt_four_star[i][4])
		
		if i ==2 then
			--emu.print(i,"1:",four_star[i])
		end
		
		
	
		
		find_prt_four_star[i][5] = find_prt_four_star[i][5]+1
		if find_prt_four_star[i][5] > 100 then
			
			find_prt_four_star[i][5] = 0
	

					find_prt_four_star[i][2] = find_prt_four_star[i][2] + 1
					if find_prt_four_star[i][2] > 3 then
							find_prt_four_star[i][2]=1
						find_prt_four_star[i][3]=x+math.random(1,15)
							find_prt_four_star[i][3]=y+math.random(1,15)
					end
		end
	end
--	emu.print(find_prt_four_star)
		
end


function display_popup()
	
			gui.popup(find_prt_title,"","")
			local len  = string.len(find_prt_title)
			--emu.print(string.len(find_prt_title))
			if len < 0x1d and len >0x22 then
				return -1
			end
			return 1

end


find_prt_prt_addr=0x6b010

function find_prt_check_if_prt(find_prt_star_data,v1,v2,x, y)
	for i = 0,0x3f,1 do
			--emu.print(i)
		if  rom.readbyte(find_prt_prt_addr+i)~= bit.rshift(v1,8) then
		local dy = rom.readbyte(find_prt_prt_addr+i)+rom.readbyte(find_prt_prt_addr+0x40+i)*256 
		local dx = rom.readbyte(find_prt_prt_addr+0x40*2+i)+rom.readbyte(find_prt_prt_addr+0x40*3+i)*256 
		
		--emu.print(string.format("%x-%x-%x-%x-%x-%x",v1,v2,dx,dy,x,y))
		
		if (dx == v1 and dy ==v2) and memory.readbyte(0x65c0+i)==0 then
			--emu.print(i,string.format("abc:%x-%x-%x-%x-%x-%x",dx,v1,dy,v2,0x65c0+i,memory.readbyte(0x65c0+i)))
			--emu.pause()
			--emu.print(string.format("%x",0x65c0+i-4))
			--inputOut(find_prt_star_data[1][1],x,y)
			find_prt_starHandle(find_prt_star_data,x,y)
		--	emu.print(string.format("%x-%x-%x-%x-%x-%x",v1,v2,dx,dy,x,y))
		end
		end
	end
end

function find_prt_display()
	if table.getn(find_prt_pos_point)~=0 and find_prt_pos_point~= nil then
		for i,v in pairs(find_prt_pos_point) do
			find_prt_four_star ={}
			local deltaX=0  deltaY=0 local x = memory.readbyte(0x550) y=memory.readbyte(0x540)
			local curPosX=0 curPosY=0
			if v[1]+ find_prt_range_pos+1 < find_prt_posX+find_prt_range_pos+1 then
				deltaX = (find_prt_posX+find_prt_range_pos+1)- (v[1]+find_prt_range_pos+1)
				find_prt_curPosX= x - deltaX*16
				--emu.print("x1:",find_prt_curPosX)
			else
				deltaX = (v[1]+find_prt_range_pos+1) - (find_prt_posX+find_prt_range_pos+1)
				find_prt_curPosX= x + deltaX*16
				--emu.print("x2:",find_prt_curPosX)
			end	
			if v[2]+find_prt_range_pos+1 < find_prt_posY+find_prt_range_pos+1 then
					deltaY = (find_prt_posY+find_prt_range_pos+1)- (v[2]+find_prt_range_pos+1)
					find_prt_curPosY =y-deltaY *16
					--emu.print("y1:",curPosY)
			else
					deltaY = (v[2]+find_prt_range_pos+1) - (find_prt_posY+find_prt_range_pos+1)
					find_prt_curPosY =y+deltaY *16
				--	emu.print("y2:",curPosY)
			end
			if (not (find_prt_curPosX < 0 or find_prt_curPosX >240 or find_prt_curPosY< -16 or find_prt_curPosY>256)) then
				if open_display ==1 then
					gui.rect(find_prt_curPosX,find_prt_curPosY,find_prt_curPosX+16,find_prt_curPosY+16)
				end
				if open_xy_display == 1 then
					gui.text(find_prt_curPosX+1,find_prt_curPosY+1,string.format("%0.2X",find_prt_curPosY),0x22ff2260)
					gui.text(find_prt_curPosX+1,find_prt_curPosY+9,string.format("%0.2X",find_prt_curPosX),0x00ffff60)
				end
				find_prt_check_if_prt(find_prt_star_data,v[1],v[2],find_prt_curPosX,find_prt_curPosY)
				--emu.print(string.format("%x-%x-%x-%x",v[1],v[2],curPosX,curPosY))
			end
		end
	end
	
end

find_prt_getstatus = 0
find_prt_ncounter = 0
while (true) do   --如果为1则循环(默认无限循环)
	if find_prt_getstatus == 0 and  display_popup() == 1 then
		find_prt_getstatus =1
	else
		if find_prt_ncounter < 3 then
			find_prt_read_pos()	--调用函数
			find_prt_display()
			
		else
			--emu.print(ncounter)
			if find_prt_ncounter >10 then
				find_prt_ncounter = 0
			end
		end
		find_prt_ncounter =find_prt_ncounter+1
	end
	FCEU.frameadvance()		--推进一帧
end