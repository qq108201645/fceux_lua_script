
--fc忍者神龟3 可视化修改

--回车键暂停,用键盘方向键处理
--状态
game_status = 0
--停止
 pause = 1
--取消停止
unpause =0

--说明
--金手指1:名称(两边需要英文引号)、内存地址、要改的数值
--金手指2:名称(两边需要英文引号)、内存地址、要判断的值,然后是要改的数值
--gg码:名称(英文引号)、GameGenie(英文引号)
--这是忍者神龟3的金手指
cheat ={
	{"1P_LIFE",  0x6a,  0x63},				--参照此格式
	{"1P_HP",  0x04f1,   0x7f},	--开启后，将0x7f值写入0x4f1内存
	{"1P_TURN_1",  0x04E7,  0xc,  0x02},		--开启后，0x4e7内存的值是0xc的情况就写入02,否则不处理
	{"NoSUB_HP",  "AAESYXAA"},	--GG码格式
	{"2P_LIFE",0x6b,0x63},
	{"2P_HP",0x04f2,0x7f},
	{"6",0x6a,0x63},	---NULL
	{"7",0x6a,0x63},	---NULL
	{"8",0x6a,0x63}	,---NULL
	{"9",0x6a,0x63},	---NULL
	{"10",0x6a,0x63},	---NULL
	{"11",0x6a,0x63},	---NULL
	{"12",0x6a,0x63},---NULL
	{"13",0x6a,0x63},	---NULL
	{"14",0x6a,0x63},	---NULL
	{"15",0x6a,0x63},	---NULL
	{"16",0x6a,0x63},	---NULL
	{"17",0x6a,0x63},	---NULL
	{"18",0x6a,0x63},	---NULL
	{"19",0x6a,0x63},	---NULL
}
title = "本程序由by悠然小赐 qq108201645制作"

initPosition = 20
MaxHeight = 200

vertical_spacing = 10
horizontal_space = 10

key_status =0
press_key ={
	{"up",8},
	{"down",4},
	{"left",2},
	{"right",1},
	{"start",0x10},
	{"enter",0x20},
	{"A",0x40},
	{"B",0x80}
}

getstatus = 0

position =0
item_Num =0
display_item_Num =0
width = 0
height = 0


cursor = {}
pos = 0;
offsetPos= 4
cur_key =0 tmp_key =0

function Modify()
	for i=1,item_Num do
	 
		if type(cheat[i][2]) == "string" then
			if cursor[i] == 1 then
				emu.addgamegenie(cheat[i][2])
			elseif cursor[i] == 0 then
				emu.delgamegenie(cheat[i][2])
			end
		elseif type(cheat[i][2]) == "number" then
			if cursor[i] == 1 then 
				if cheat[i][4] ==nil then
					memory.writebyte(cheat[i][2],cheat[i][3])
				else
					if memory.readbyte(cheat[i][2]) == cheat[i][3] then
						memory.writebyte(cheat[i][2],cheat[i][4])
						--emu.print(cheat[i][4])
					end
				end
				--emu.print(string.format("0x%x",memory.readbyte(cheat[i][2])))
			end
		end
		--emu.print(type(cheat[i][2])=="number")
	end
end

--显示部分
function MenuDisplay()

	if game_status == pause then
	
		local x1 = initPosition y1 = initPosition 
		x2 = x1 + 12 * horizontal_space  y2 = y1 + display_item_Num * vertical_spacing+vertical_spacing
		
	--显示部分
	
		gui.rect(x1,y1,x2-2,y2,0x7b7b7ba0,0x38383880);
	  gui.rect(x1,y1 + (pos-1-position) * vertical_spacing+vertical_spacing,
	  x2-2,y1 + (pos-1-position) * vertical_spacing+vertical_spacing+vertical_spacing,0xff64ff80,0x383838ff);
		gui.text(x1+2,y1 +2,"     game  cheat     ",0xffffff80,0x6464ffff)
		for i=1,table.getn(cheat) do
			if i > position and i <= position + display_item_Num then
			gui.text(x1+offsetPos,y1 +(i-1)*vertical_spacing+2 -position*vertical_spacing+vertical_spacing,string.format("%s",cheat[i][1]),0xffffffFF,0)
			gui.text(x1+horizontal_space *6+offsetPos,y1 +(i-1)*vertical_spacing+offsetPos/2-position*vertical_spacing+vertical_spacing,"OFF",0xFFFFFFFF,0)
			gui.text(x1+horizontal_space *10+offsetPos,y1 +(i-1)*vertical_spacing+offsetPos/2-position*vertical_spacing+vertical_spacing,"ON",0xFFFFFFFF,0)
			gui.text(x1+horizontal_space *((cursor[i]==1 and {10} or {6})[1]) -offsetPos-1 ,y1 +(i-1)*vertical_spacing +offsetPos/2-position*vertical_spacing+vertical_spacing,"->"..(cursor[i]==1 and {"ON"} or {"OFF"})[1],
			(cursor[i]==1 and  {0xFF64FF} or {0xFF0000FF} )[1],0)
			end
			--emu.print(cursor[i])
		end
	end
end
--显示之前的数据处理
function Handle_Screen()
		if item_Num > 10 then
			display_item_Num = 10
		else
			display_item_Num = item_Num
		end
		
end
--处理按键功能
function Handle_Key()

	key_status = AND(XOR(key_status,0XFF), cur_key)
	
	if key_status~=0 then
	--上

		if cur_key == 0x8 and game_status == pause then   
			pos = pos - 1
			if pos < 1 and position <= 0 then
				pos = item_Num position  = item_Num - display_item_Num
			elseif pos <= position -- or (position~= 0 and pos - position <  position +5 )
			then
				position = position -1
			--	 emu.print("1:",position)
			end
			
		--下
		elseif cur_key == 0x4 and game_status == pause then  
			pos = pos + 1
			if pos > display_item_Num and pos > item_Num then
				pos = 1 position =0
			elseif pos > position +display_item_Num then
			 position = position + 1
		--	 emu.print("2:",position)
			end
			
	--左右
		elseif (cur_key == 0x2 or cur_key == 0x1) and game_status == pause then 
		
			if cursor[pos] ~=nil then
			if cursor[pos] == 0 then
				 cursor[pos] =1
			elseif cursor[pos] == 1 then
				 cursor[pos]=0
			end end
			
		elseif cur_key == 0x80 and game_status == pause then --
		elseif cur_key == 0x40 and game_status == pause then --
		--选择键暂停
		elseif cur_key == 0x20 then
			if game_status == unpause then
				game_status = pause 
				emu.pause()
				--memory.writebyte(game_status_address,pause)
			elseif game_status == pause then
				game_status = unpause
				emu.unpause()
				--memory.writebyte(game_status_address,0)
			end
			--emu.print(string.format("0x%x 暂停键:%s",cur_key,(game_status==pause and {"yes"} or {"no"})[1]))
		elseif cur_key == 0x10 and game_status == pause then  --
		end
		if key_status == 0 then
			cur_key = 0
		end
	end
	
	key_status = cur_key

end

function display_popup()
	
			gui.popup(title,"","")
			local len  = string.len(title)
			--emu.print(string.len(title))
			if len < 0x1d and len >0x22 then
				return -1
			end
			return 1

end

--获取键值
function Handle_Joypad()
	--if 	emu.paused() then
	--		game_status = unpause

	--		emu.print(1)
	--end

	if getstatus == 0 then if display_popup() == 1 then
		item_Num = table.getn(cheat)
		
		pos = 1 position =0
		getstatus = 1
		for i=1,item_Num do
			cursor[i]=0
		end end
	end

	local t= input.get(1)
	
	cur_key= AND(XOR(cur_key,0xff),tmp_key)
		--emu.print(t)
	for i=1,table.getn(press_key) do
		if t[press_key[i][1]] ==true then
			if cur_key == 0 then
				cur_key = press_key[i][2] 
			end
		end
	end
	if input.get(1).enter  then
				cur_key =0x20 
			end
	--emu.print(cur_key)
	
end



--main

function HACK_Menu()
	Handle_Joypad()
	Handle_Key()
	Handle_Screen()
	MenuDisplay()
	Modify()
end

--while (1) do
--  HACK_Menu()
--	FCEU.frameadvance()
--end

gui.register(	HACK_Menu)