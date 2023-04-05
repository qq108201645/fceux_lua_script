--调试sprite专用  --by悠然小赐
title = "本程序由by悠然小赐 qq108201645制作"


getstatus =0
numSpriteHeight = 8
spriteMODE=0
strFillColor = "#ffffff3f"
strOutlineColor = "#ff0000bf"
strHighlightColor = "#ffffffbf"

function readSpriteAttributes(a,s,v)
	local numAddress = v * 256
	tabSpriteAttributes = {}
	for numIndex = 0, 255 do
		table.insert(tabSpriteAttributes, memory.readbyte(numAddress + numIndex))
	end
end

	
	--gui.line(numSpriteX0,numSpriteY0,numSpriteX0+8,numSpriteY0)  --上横线
	--gui.line(numSpriteX0,numSpriteY0+numSpriteHeight,numSpriteX0+8,numSpriteY0+numSpriteHeight)--下横线	
	--gui.line(numSpriteX0,numSpriteY0,numSpriteX0,numSpriteY0+numSpriteHeight)--左直线
	--gui.line(numSpriteX0+8,numSpriteY0,numSpriteX0+8,numSpriteY0+numSpriteHeight) --右直线

line_exp={
{0,0,8,0},
{0,numSpriteHeight,8,numSpriteHeight},
{0,0,0,numSpriteHeight},
{8,0,8,numSpriteHeight},
}

--方向
line_dir={
{0,-numSpriteHeight},
{0,numSpriteHeight},
{-8,0},
{8,0}
}

function setSpriteHeight(a,s,v)
	if AND(a, 7) == 0 then
		numSpriteHeight = AND((v / 4), 8) + 8
		--emu.print(numSpriteHeight)
	end
	
	line_exp={
{0,0,8,0},
{0,numSpriteHeight,8,numSpriteHeight},
{0,0,0,numSpriteHeight},
{8,0,8,numSpriteHeight},
}
	--方向
line_dir={
{0,-numSpriteHeight},
{0,numSpriteHeight},
{-8,0},
{8,0}
}
end


line_table={
{{},{}},
{{},{}}
}

function draw(numSprite)

	local numSpriteX0 = numSprite[1] numSpriteY0=numSprite[2]

	
	for i,v in pairs(line_exp) do
		if 0 == numSprite[i+2] then
			gui.line(numSpriteX0+v[1],numSpriteY0+v[2],numSpriteX0+v[3],numSpriteY0+v[4])
				--emu.print(v[1],v[2],v[3],v[4])
		end
		
	end
--	emu.print(line_exp)
end

save_i = 0 save_j = 0

function find(tmp)
	if tmp==nil then
	return -2
	end
	
	for i=1,table.getn(line_table) do
	--首次检测有没重合

			if tmp[1]==line_table[i][1] and  tmp[2] == line_table[i][2] then
				return -1
			end
	end
	
	
		--再次检测邻居

	for i=1,table.getn(line_table) do
		for j=1,table.getn(line_dir) do
			if tmp[1]-line_table[i][1] ==line_dir[j][1] and
				tmp[2]-line_table[i][2] ==line_dir[j][2]
				then 
			--主方向的左边就是临时节点的右边
				line_table[i][j+2]=1
				tmp[XOR((j-1),1)+3]=1
			end
		end
	end
	return 0 
end

function calcL(numSpriteX0, numSpriteY0)
	local tmp = {0,0} map_t={}
	tmp = {numSpriteX0,numSpriteY0,0,0,0,0}
	local n =find(tmp)
	
	if n == 0 then
		table.insert(line_table,tmp)
	end
	
end

function drawBoxes()
	line_table={}
	local tabInput, numSpriteX, numSpriteY, numDetailsBase, numTextY = input.read()
	if tabSpriteAttributes ~= nill then
		for numBase = 252, 0, -4 do
			numSpriteX0 = tabSpriteAttributes[numBase + 4]
			numSpriteY0 = tabSpriteAttributes[numBase + 1] + 1
			numSpriteX1 = numSpriteX0 + 8
			numSpriteY1 = numSpriteY0 + numSpriteHeight - 1
			if (tabInput.xmouse >= numSpriteX0) and (tabInput.xmouse <= numSpriteX1) and (tabInput.ymouse >= numSpriteY0) and (tabInput.ymouse <= numSpriteY1) then
				gui.box(numSpriteX0, numSpriteY0, numSpriteX1, numSpriteY1, strHighlightColor, strOutlineColor)
				numDetailsBase = numBase
			else
				if spriteMODE==0 then
					calcL(numSpriteX0, numSpriteY0)
				else
					gui.box(numSpriteX0, numSpriteY0, numSpriteX1, numSpriteY1, strFillColor, strOutlineColor)
				end
				--gui.box(numSpriteX0, numSpriteY0, numSpriteX1, numSpriteY1, strFillColor, strOutlineColor)
			end
		end
	end
	
	if spriteMODE==0  then
		for i=1,table.getn(line_table) do
 			draw(line_table[i])
		end
	end
	if numDetailsBase ~= nil then
		numTextY = (1 - math.floor(tabInput.ymouse / 120)) * 127 + 16
		gui.text(16, numTextY, string.format("OAM Slot: %d", numDetailsBase / 4)); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("OAM Offset: $%02X", numDetailsBase)); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Sprite X: $%02X", tabSpriteAttributes[numDetailsBase + 4])); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Sprite Y: $%02X", tabSpriteAttributes[numDetailsBase + 1])); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Tile ID: $%02X", tabSpriteAttributes[numDetailsBase + 2])); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Palette: %d", AND(tabSpriteAttributes[numDetailsBase + 3], 0x03))); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Behind Background: %d", AND(tabSpriteAttributes[numDetailsBase + 3], 0x20) / 0x20)); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Flip X: %d", AND(tabSpriteAttributes[numDetailsBase + 3], 0x40) / 0x40)); numTextY = numTextY + 9
		gui.text(16, numTextY, string.format("Flip Y: %d", AND(tabSpriteAttributes[numDetailsBase + 3], 0x80) / 0x80)); numTextY = numTextY + 9
	end
	gui.box(tabInput.xmouse - 2, tabInput.ymouse - 2, tabInput.xmouse + 2, tabInput.ymouse + 2, strHighlightColor, strOutlineColor)
end


function popup()
	
			gui.popup(title,"","")
			local len  = string.len(title)
			if len < 0x1d and len >0x22 then
				return -1
			end
			return 1

end
cur_key=0
function input_handle()
	local t=input.get(1)  tmp_key=0
	
	if t.enter ==true then
		tmp_key=0x20 --emu.print(spriteMODE)
	end
	cur_key=bit.band(bit.bxor(cur_key,255),tmp_key)
	
	if cur_key==0x20 then
		spriteMODE=spriteMODE+1
		
		if spriteMODE > 1 then
			spriteMODE=0
		end
	end
	--emu.print(spriteMODE)
	cur_key = tmp_key
end

while (true) do
	if getstatus == 0 and popup() == 1 then getstatus = 1 end 
	
	if  getstatus then
		input_handle()
		memory.registerwrite(0x4014, 0x0001, readSpriteAttributes)
		memory.registerwrite(0x2000, 0x2000, setSpriteHeight)
		gui.register(drawBoxes)
	end
	emu.frameadvance()
end

 