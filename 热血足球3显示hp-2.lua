
title="本程序由by悠然小赐 qq108201645制作"
message="游戏暂停中,可以使用键盘方向键与数字键,回退键来修改体力"
ttf_pixel={{
	0x08, 0x28, 0x7E, 0xCC, 0x5A, 0x69, 0x5C, 0x48
},
	{ 0x00, 0x20, 0xFC, 0x24, 0x24, 0x44, 0x44, 0x98}
}
pixel_size=8

npc_info = {}

npc_x_addr= 15+bit.lshift(10,4)+bit.lshift(3,8)
npc_y_addr= 2+bit.lshift(12,4)+bit.lshift(3,8)
npc_a_addr= 5+bit.lshift(13,4)+bit.lshift(3,8)

hp_addr=4+bit.lshift(14,4)+bit.lshift(4,8)

function get_npc_info()
	if memory.getregister("a")~=0x40 then
		return 
	end
	npc_info = {}
	local i=0
	local a= (bit.lshift(10,4)+1)
	while(i<16) do
		if memory.readbyte(a+i) < 18 or memory.readbyte(a+i) > 18 then
			table.insert(npc_info,memory.readbyte(a+i))
		else
			break
		end
		i=i+1
	end
	table.sort(npc_info,function(a,b) return a>b end)
	--print(npc_info,#npc_info)
end

function get_offset(v)
	local npc_x=memory.readbyte(npc_x_addr +v)
	local npc_y=memory.readbyte(npc_y_addr +v)
	local npc_a=memory.readbyte(npc_a_addr +v)
	local y_h = 0
	if npc_a - npc_y >=0 then
		y_h=255
	else
		y_h=bit.band(npc_a - npc_y,255)-9
	end
		--	print(npc_y,y_h)
	local ex = npc_x-10 ey=0xd6 flag =0
	if ey < y_h then
		ey = bit.band(ey + npc_y,255)
		if ey < memory.readbyte(0x56) and ey > 0 then
		flag =1+flag
					
		end
	end
			
	if ex > 0 then 
		flag =1+flag
	end
	return ex,ey
end
cur_hp ={} 
function get_hp()
	cur_hp ={}
	for _,v in pairs(npc_info) do
		if v < 12  then
			local ex,ey =get_offset(v)
			--print(ex,ey)
			if flag == 2 then
					table.insert(cur_hp,{number=v, x=ex,y=ey,hp = memory.readbyte(v+hp_addr)})
			end
		end
	end
end
damage={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
hp_cnt={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
find_prt_mykey = {
		0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01
}
function ttf_inputOut(name,x,y)
	--emu.print(x,y,name)
	
	local dx=x dy=y
		
		arr=name
		
		for len1 = 1,pixel_size do
			--for set = 1,2 do
					for k = 1,table.getn(find_prt_mykey) do
							if arr[len1 ]~=nil and AND(arr[len1 ],find_prt_mykey[k])~=0 then
								 gui.pixel(dx,dy,0x00ff00ff,0x383838ff)
							end
								dx =dx+1
					end
		--	end
			dy=dy+1 dx=x
		end
end
function display_hp()
	if cur_hp~=nil then
	for _,v in pairs(cur_hp) do
--		if v.number==0 then
		
		
	 	if memory.readbyte(v.number+hp_addr) <  v.hp then
	 		hp_cnt[v.number+1]=-100
	 		damage[v.number+1]=v.hp  - memory.readbyte(v.number+hp_addr)
	 	elseif memory.readbyte(v.number+hp_addr) >  v.hp then
	 		hp_cnt[v.number+1]=100
	 		damage[v.number+1]=  memory.readbyte(v.number+hp_addr) -v.hp 
	 	end
	 --	print(string.format("%x-%x",hp_cnt[v.number+1],damage[v.number+1]))
	 	if hp_cnt[v.number+1]< 0 then
	 		gui.text(v.x+1,v.y-9,string.format("-%d",damage[v.number+1]),0xff0000ff,0x383838ff)
	 		hp_cnt[v.number+1]=hp_cnt[v.number+1]+1
	 	elseif hp_cnt[v.number+1]> 0 then
	 		gui.text(v.x+1,v.y-9,string.format("+%d",damage[v.number+1]),0x00ff7fff,0x383838ff)
			hp_cnt[v.number+1]=hp_cnt[v.number+1]-1
	 	end
	 	--print(hp_cnt[v.number+1])
	 	gui.rect(v.x,v.y-1,v.x+14,v.y+7,0x383838ff)
	 	ttf_inputOut(ttf_pixel[1],v.x,v.y-1) ttf_inputOut(ttf_pixel[2],v.x+8,v.y-1)
		gui.text(v.x+16,v.y,string.format(":%d",v.hp),0x00ff00ff,0x383838ff)
	end --end
	end
	
end

press_key ={
	{"0",1},
	{"1",2},
	{"2",3},
	{"3",4},
	{"4",5},
	{"5",6},
	{"6",7},
	{"7",8},
	{"8",9},
	{"9",10},
	{"numpad0",1},
	{"numpad1",2},
	{"numpad2",3},
	{"numpad3",4},
	{"numpad4",5},
	{"numpad5",6},
	{"numpad6",7},
	{"numpad7",8},
	{"numpad8",9},
	{"numpad9",10},
	{"backspace",11},
	{"left",12},
	{"right",13},
	{"up",14},
	{"down",15}
	}
tmp_key = 0 cur_key=0 selItem=1
function get_joypad()
	if bit.rshift(memory.readbyte(0x5c),7)==0 or cur_hp==nil or #cur_hp==0 then
		return 
	end
	
	--print(cur_hp,#cur_hp)
	local t=input.read(1) pre_key=0

	for i=1,#press_key do
	 if t[press_key[i][1]] then
	 	pre_key = press_key[i][2]
	 	break
	 end
	end
	tmp_key=bit.band(bit.bxor(tmp_key,255),pre_key)
	cur_key= tmp_key
	tmp_key = pre_key
	
	function hp_modify() 
		local str=nil value = 0
		if cur_key >=1 and cur_key<=10 then
			value = memory.readbyte(cur_hp[selItem].number+hp_addr)
			value=(cur_key-1)+value*10
			if value>255 then
				value = 255
			end
			memory.writebyte(cur_hp[selItem].number+hp_addr,value)
		elseif cur_key== 11 then
			str=string.format("%s",memory.readbyte(cur_hp[selItem].number+hp_addr))
			if str:len()~=0 then
				str=str:sub(1,str:len()-1)
			end
			if str==nil or str:len()==0 then
				str="0"
			end

			memory.writebyte(cur_hp[selItem].number+hp_addr,tonumber(str))
		elseif cur_key== 12 then
			selItem=selItem-1
		elseif cur_key== 13 then
			selItem=selItem+1
		elseif cur_key== 14 then
		 value = memory.readbyte(cur_hp[selItem].number+hp_addr)
			value = value -1
			if value <0 then
				value = 0
			end 
			memory.writebyte(cur_hp[selItem].number+hp_addr,value)
		elseif cur_key== 15 then
		 value = memory.readbyte(cur_hp[selItem].number+hp_addr)
			value = value +1
			if value >255 then
				value = 255
			end 
			memory.writebyte(cur_hp[selItem].number+hp_addr,value)
		end
		if str==nil then
			str="0" 
		end
		--print(cur_hp[selItem],cur_hp,#cur_hp)
		if selItem > #cur_hp then
				selItem = 1
			end
			if selItem < 1 then
				selItem = #cur_hp
			end
		gui.text(cur_hp[selItem].x-18,cur_hp[selItem].y,string.format("%d",cur_hp[selItem].number+1),0x00ff00ff,0x383838ff)
		gui.rect(cur_hp[selItem].x-3,cur_hp[selItem].y-2,cur_hp[selItem].x+5*8,cur_hp[selItem].y+9)
	end
	hp_modify()
end

Nekketsu_Soccer_League= 0
memory.registerexecute(0x8038,1,get_npc_info)
function popup()
	if(Nekketsu_Soccer_League ==0 ) then
			gui.popup(title,"","")
			gui.popup(message,"","")
			local len  = string.len(title)
			--emu.print(string.len(title))
			if len < 0x1d and len >0x22 then
				return -1
			end
			Nekketsu_Soccer_League=1
			return 1
	end
	return 0
end

function set_p1()
	emu.addgamegenie("KVUEPXKN")
end
function del_p1()
	emu.delgamegenie("KVUEPXKN")
end

while (true) do
	popup()
	if Nekketsu_Soccer_League == 1 and (memory.readbyte(0x59)>=1 and memory.readbyte(0x59)<=3) and
	(memory.readbyte(0x5a)>=1 and memory.readbyte(0x5a)<=3) 
	and memory.readbyte(0x58)<=0 then
			display_hp()
			memory.registerexecute(0x82b5,1,set_p1)
			memory.registerexecute(0x82ba,1,del_p1)
			get_hp()
			get_joypad()
	end
	
	FCEU.frameadvance()
end

