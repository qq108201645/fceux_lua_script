--fc snail_mazeÑ°Â·ÏµÍ³
dir = {
{x = 0,y = -1,name = '¡ü'},
{x =0,y = 1,name ='¡ý'},
{x =-1,y = 0,name ='¡û'},
{x =1,y = 0,name ='¡ú'},
}
my_joyPad={
{up =true},
{down=true},
{left=true},
{right=true}
}
counter = 0
function setKey()
	if  counter ~=0 then
		--emu.print(i)
		local t=joypad.get(1)
		--emu.print(my_joyPad[pathfinding[counter]])
		joypad.set(1,my_joyPad[pathfinding[counter]])
	
	end
end

pathfinding={}
my_run = 0

local function calc_cost(curNode,gobl)
	curNode.g=curNode.g+1
	local a=math.abs(curNode.x-gobl.x) b=math.abs(curNode.y-gobl.y)
	curNode.h= a+b
	--emu.print("position:",curNode.x,curNode.y,gobl.x,gobl.y,math.abs(curNode.x-gobl.x)+math.abs(curNode.y-gobl.y))

	return curNode.g+curNode.h 
end

function getMinNode(openlst)
	local min_f = openlst[1].f  result =1
	for i=1,table.getn(openlst) do
		--print(min_f,openlst[i].f)
		if (min_f > openlst[i].f) then
			min_f=openlst[i].f
			result=i
		end

	end
	return result;
end

function find_closelst(closelst,x,y)
	for i=1,table.getn(closelst) do
		if x==closelst[i].x and y==closelst[i].y then
			return true
		end

	end
	return false
end
function find_openlst(openlst,x,y)
	for i=1,table.getn(openlst) do
		if openlst[i].x==x and openlst[i].y ==y then
			return i
		end

	end
	return 0
end
otherOffset={
1,2,4,8
}

local function find_wall(cx,cy,i,cur_dir)

	local offset_x = cx
	local offset_y = cy
	local level=memory.readbyte(5)
	local l  = rom.readbyte(0x243a+offset_y) + bit.lshift(rom.readbyte(0x244c+offset_y),8) -0x7FF0
	local h  = rom.readbyte(0x245e+offset_y) + bit.lshift(rom.readbyte(0x2470+offset_y),8) -0x7FF0
	local wall_offset_A= rom.readbyte(l + level)+bit.lshift(rom.readbyte(h + level),8)-0x7FF0
	
	wall_offset_A=rom.readbyte(wall_offset_A+offset_x)
	
	
	offset_y=offset_y+cur_dir.y
	offset_x=offset_x+cur_dir.x
	
	l  = rom.readbyte(0x243a+offset_y) + bit.lshift(rom.readbyte(0x244c+offset_y),8) -0x7FF0
	h  = rom.readbyte(0x245e+offset_y) + bit.lshift(rom.readbyte(0x2470+offset_y),8) -0x7FF0
	local wall_offset_B = rom.readbyte(l + level)+bit.lshift(rom.readbyte(h + level),8)-0x7FF0
		
	wall_offset_B= rom.readbyte(wall_offset_B+offset_x)
--[[
	emu.print("(",i,")",dir[i].name," cx=",cx," cy=",cy," offset_x=",offset_x," offset_y=",offset_y,
	((AND(rom.readbyte(wall_offset_A+ 0x27ce),otherOffset[i] )==0 and AND(rom.readbyte(wall_offset_B+ 0x27d4),otherOffset[i] )==0) and {"ok"} or {"no"})
	,string.format("%x-%x",wall_offset_A+ 0x27ce+0X7FF0,wall_offset_B+0X27D4+0X7FF0),rom.readbyte(wall_offset_A+ 0x27ce),rom.readbyte(wall_offset_B+ 0x27d4))
]]--
	if  AND(rom.readbyte(wall_offset_A+ 0x27ce),otherOffset[i])==0 then
		if AND(rom.readbyte(wall_offset_B+ 0x27d4),otherOffset[i])==0 then
			return false
		end
	end
	
	return true
end

width=30 height=16

ccnt=0

start={x=0,y=0} testStart={0,0}
local function Path_Finding_Serach()
	
	if memory.readbyte(0x44)==0 and memory.readbyte(0x45)==0 then
		return
	end
	pathfinding={}
		
	local mapt={}
	local openlst ={}
	local closelst={}
	

	for ni=1,height do
		local tMap={}
		for nj = 1,width do
			table.insert(tMap,{x = nj,y = ni,dir = -1,g = 0,h = 0,f = 0})
		end
		table.insert(mapt,tMap)
	end 
	
	--	for i=1,30 do
   -- for j=1,16 do
   -- print(mapt[i][j].x,mapt[i][j].y)
   -- end
		--end

	
	 start={y = memory.readbyte(0x44),x = memory.readbyte(0x45)}
	 testStart ={y = memory.readbyte(0x44),x = memory.readbyte(0x45)}
	local gobl={y = memory.readbyte(0x46),x = memory.readbyte(0x47)}
	local pos= 0 cx=0 cy=0 c=0 nx=0 ny =0 
	local curNode={} tmp ={}
	
	table.insert(openlst,mapt[start.y][start.x])
		
	while (table.getn(openlst)~=0) do
		pos=getMinNode(openlst)
		curNode=openlst[pos]
		--table.insert(curNode,openlst[pos])
		
		cx = curNode.x  cy=curNode.y
		ccnt=ccnt+1
		
		table.insert(closelst,curNode)
		table.remove(openlst,pos)
		
	  
		if cx==gobl.x and cy==gobl.y then
		
			local f=io.open("1.txt","wb")
			--[[
			for i=1,height do
				for j=1,width do
					if mapt[i][j].dir ==nil or mapt[i][j].dir ==-1  then
						f:write("# ")
					elseif mapt[i][j].x==start.x and mapt[i][j].y==start.y then
						f:write("a ")
					elseif mapt[i][j].x==gobl.x and mapt[i][j].y==gobl.y then
						f:write("b ")
					else
						local t=bit.bxor(mapt[i][j].dir,1)+1
				 		f:write(dir[t].name.." ")
				 	end
				end
					f:write("\n")
			end
			f:close()
			--]]
			--emu.pause()

			while((cx==start.x and cy==start.y)==false) do

				pos= mapt[cy][cx].dir
				c=bit.bxor(pos,1)+1
				table.insert(pathfinding,1,c)
				cx = cx+dir[pos+1].x cy = cy+dir[pos+1].y
			end
			--for i,v in pairs(pathfinding) do
				--print(dir[v].name) 
			--end
			counter=1
			return 
		end
		
		for i=1,table.getn(dir) do
	
			nx = cx+dir[i].x ny=cy+dir[i].y
			
			if (nx < 1 or nx > width or ny < 1 or ny > height   or find_wall(cx,cy,i,dir[i]) 
			or find_closelst(closelst,nx,ny) 
			)==false then
		
			 	 tmp={x= nx,y=ny,dir = curNode.dir,g = curNode.g,h = 0,f = 0}
			 	
			 	tmp.f = calc_cost(tmp,gobl)
			 	--emu.print("tmp:",tmp)
			 	 pos=find_openlst(openlst,tmp.x,tmp.y)
	
			 	if pos==0 then
			 		table.insert(openlst,tmp)
			
			 		mapt[ny][nx].dir=bit.bxor((i-1),1)
			 		if i==1 or i==3 then
					--emu.print(i,ny,nx,mapt[ny][nx].y,mapt[ny][nx].x,dir[mapt[ny][nx].dir+1].name,tmp.f)
					end
			 	elseif pos~=0 and openlst[pos].f > tmp.f then
			 		
			 		table.remove(openlst,pos)
			 		table.insert(openlst,tmp)
			 		---openlst[pos]=tmp	 
			 		mapt[ny][nx].dir=bit.bxor((i-1),1)
			 		if i==1 or i==3 then
			 		--emu.print(i,ny,nx,mapt[ny][nx].y,mapt[ny][nx].x,dir[mapt[ny][nx].dir+1].name,tmp.f)
			 		end
			 	end
			
			end
			
		end
	end
end

dx =0 dy =0
cnt =0
DIRBmp={
{{0,0,1,0,0},
{0,1,0,0,0},
{1,1,1,1,1},
{0,1,0,0,0,0},
{0,0,1,0,0}}
,
{{0,0,1,0,0},
{0,0,0,1,0},
{1,1,1,1,1},
{0,0,0,1,0},
{0,0,1,0,0}}
,
{{0,0,1,0,0},
{0,1,1,1,0},
{1,0,1,0,1},
{0,0,1,0,0},
{0,0,1,0,0}}
,
{{0,0,1,0,0},
{0,0,1,0,0},
{1,0,1,0,1},
{0,1,1,1,0},
{0,0,1,0,0}}
};
function displayDir(cur,x,y)
	for i=1, #DIRBmp[cur] do
		for j=1, #DIRBmp[cur][i] do
			if DIRBmp[cur][i][j]==1 then
				gui.pixel(x+i,y+j,0x80,0x0)
			end
		end
	end
end

inty=0x5f intx=8 

function displayPath()
	--local start={y = memory.readbyte(0x44),x = memory.readbyte(0x45)}
	local cx=start.x cy=start.y
	
	for i=1,#pathfinding do
		local cur_dir=pathfinding[i]
		displayDir(cur_dir,cx*8+intx-8,cy*8+inty-7)  --,cx*8+intx-2,cy*8+inty-2)
		cx=dir[cur_dir].x+cx cy=dir[cur_dir].y+cy
	end
end

function mainTest()
	if my_run==0 and memory.readbyte(0xf1)==0xb3 and memory.readbyte(0xf2)==0x30 then
		my_run= 1
		Path_Finding_Serach()
		
	end
	--emu.print(pathfinding)
	
	if counter <=table.getn(pathfinding) and counter~= 0 then
			displayPath()
			
			if memory.readbyte(0x45)==testStart.x and memory.readbyte(0x44)==testStart.y then
				setKey()
				testStart.x=testStart.x+dir[pathfinding[counter]].x
				testStart.y=testStart.y+dir[pathfinding[counter]].y
				
				counter=counter+1
				if counter >table.getn(pathfinding) then
					counter=0  cnt =0
				end 
			end
	end
	
end
function system_test()
	
		my_run=0

end
while (true) do
	mainTest()
	memory.registerexec(0xab59,3,system_test)
	FCEU.frameadvance()
end