--   						说明
--			用fceux加载fc忍者神龟2显血hp
--然后依次操作file-> lua ->  New Lua Script Window...
--Script File:是代表lua的路径,run是使用
--0f-<40  0->18

--坐标x,y,跳,方向,hl
my_address ={0x478,0x0496,0x4b4,0x043c,0x04f1,"本程序由by悠然小赐 qq108201645制作"}

tmp_hp={0,0,0,0,0,0,0,0,0,0}
tmp={0,0,0,0,0,0,0,0,0,0}
counter ={0,0,0,0,0,0,0,0,0,0}
damage ={0,0,0,0,0,0,0,0,0,0}

enemy_Hp ={0,0,0,0,0,0,0,0,0,0}
enemy_Hp_address =0x621

npc_No ={
--对象（boss）编号与调整高度负号表示往上移点，无负号表示往下移点
{1,-10},
{2,-15},
{0x3,-8},--第三关神龟
{0x4,-15},
{0x5,-15},
{0x6,-15},
{0x7,-15},
{0x8,-20},
{0x9,-15},
{0xa,-15},
{0xb,-30},
{0xc,-15},
{0x40,-5},
{0x54,-5},
{0x70,25},
{0x71,15},--咬手 机器
{0x76,15},
{0x80,25},
{0x82,15},
{0x89,35},
{0xe2,25}
}

title_counter = 0;
function display_popup()
	if(title_counter ==0 ) then
			gui.popup(my_address[6],"","")
			local len  = string.len(my_address[6])
			--emu.print(string.len(my_address[6]))
			if len < 0x1d and len >0x22 then
				return -1
			end
			title_counter=1
			return 1
	end
	return 0
end

function my_hp()
	for i=10,1,-1 do 
		repeat
			local cy =0
			local cy =0
				if (i ==2 and memory.readbyte(0x28) ~=1) or memory.readbyte(0x40)~=0x0e then
					break
				end
			
				if (i<=2 and memory.readbyte(my_address[5]+i-1) == 0 )
				 or memory.readbyte(0x041e+i-1)==0  or memory.readbyte(0x041e+i-1)>0xe0 
				 then
				 	break
				end
		
				if i<=2 then
					tmp_hp[i]=memory.readbyte(my_address[5]+i-1) 
				elseif i>2 and i<=10 then
						tmp_hp[i]=memory.readbyte(enemy_Hp_address+i-3) 
				end
				

		
				if tmp[i] > tmp_hp[i] then
					counter[i] = -50
					damage[i] = tmp[i] - tmp_hp[i]
				elseif tmp[i] < tmp_hp[i] then
					counter[i] = 50
					damage[i] = tmp_hp[i]- tmp[i] 
				end
				
				--emu.print("i = ",i,cx,cy,damage[i],counter[i],string.format("%x",enemy_Hp_address+i-3))
				
				if counter[i] == 0 and (i>=2 and i<=10) and (  --memory.readbyte(enemy_Hp_address+i-3) > 0xc0 or 
				damage[i]>0x7f)
				 then
				 	--emu.print(i,cx,cy,damage[i],counter[i])
				 damage[i]=0
					--emu.print(counter[i])
				 	break
				end

			--	if(i >=3 and i<= 10) then
					--	emu.print(i,cx,cy,damage[i],counter[i])
			--	end
		
				local x=memory.readbyte(my_address[1]+i-1)
				 
				
				local y=memory.readbyte(my_address[2]+i-1)
				local jump=memory.readbyte(my_address[3]+i-1)-memory.readbyte(0x078d)
				local dir=memory.readbyte(my_address[4]+i-1)
			--	emu.print(memory.readbyte(my_address[3]+i-1))
				
				cy = AND(y-jump+0xcc,0XFF)
				
				if(i >= 2 and i<= 10) then
					x = x + memory.readbyte(0x0667+i-1)
					
						for j=1,table.getn(npc_No) do
	
							if memory.readbyte(0x0529+i-3)==npc_No[j][1] then
							 cy = cy + npc_No[j][2]
						
							end
						end
				end
				
				
				cx =AND(x+0xf0,0XFF)

				
				
				if counter[i] ~= 0 then
				 if (cy <= 190) and( cx >0 and cx < 255) and 
				  damage[i]~=nil then
				
					if counter[i] < 0 then
						gui.text(cx,cy-10,string.format("-%d",damage[i]),0xff0000ff,0x383838ff)
						counter[i]= counter[i] + 1
					elseif counter[i] > 0 then
						gui.text(cx,cy-10,string.format("+%d",damage[i]),0x00ff7fff,0x383838ff) 
						counter[i]= counter[i] - 1
					end
				
				 end
				 --counter[i]= counter[i] - 1
				
				end

			--	if AND(memory.readbyte(0x05D0),0x13) == 0x13 then
							--emu.pause()
				--			end
			
				if (cy <= 190) and( cx >0 and cx < 255) then
						if ((memory.readbyte(0x0529+i-3)==9 and
						 AND(memory.readbyte(0x05D0),1)==1 and 
						 AND(memory.readbyte(0x05D0),0x11)~=0x11)) or 
						((memory.readbyte(0x0529+i-3)==0xc and 
						AND(memory.readbyte(0x05D0),1)==1 and 
						AND(memory.readbyte(0x05D0),0x11)~=0x11)) then
							
						--	emu.print(AND(memory.readbyte(0x05D0),0x13))
							 gui.text(cx,cy,"HP:???",0x00ff00ff,0x38383880)
						else
				
							 gui.text(cx,cy,string.format("HP:%d",tmp_hp[i]),0x00ff0064,0x38383800)
				 		end
				 
			 	end
		 	
		until true
		tmp[i]=tmp_hp[i]
	end
end

while(true)do 
	display_popup()
	if title_counter == 1 then
			my_hp()
	end
	FCEU.frameadvance();
	
end