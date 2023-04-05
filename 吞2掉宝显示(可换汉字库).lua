--吞食天地2 640k显示掉宝脚本量---需要汉字库12 --- 文本编码ASCII
--显示部分.数字要用全半角字符(直接复制可用)

---０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ﹪～

--掉宝个数
prt_npc_counter = 6    --可以修改此处
prt_hzk_size = 12      --要加载的字库多少乘多少比如 16*16就写16,可以修改此处
prt_fileName ="HZK12"  --要加载的字库,可以修改此处

prt_value ={0,0,0,0,0,0,0}

prt_npc ={
	{0x01,"刘备"},
	{0x02,"关羽"},
	{0x03,"张飞"},
	{0x04,"关兴"},
	{0x05,"关索"},
	{0x06,"张苞"},
	{0x07,"陈登"},
	{0x08,"诸葛亮"},
	{0x09,"关平"},
	{0x0A,"刘封"},
	{0x0B,"赵云"},
	{0x0C,"周仓"},
	{0x0D,"伊籍"},
	{0x0E,"谜之大将"},
	{0x0F,"庞统"},
	{0x10,"马良"},
	{0x11,"马谡"},
	{0x12,"姜维"},
	{0x13,"袁术"},
	{0x14,"雷薄"},
	{0x15,"李丰"},
	{0x16,"陈兰"},
	{0x17,"袁胤"},
	{0x18,"张勋"},
	{0x19,"纪灵"},
	{0x1A,"梁刚"},
	{0x1B,"梁纪"},
	{0x1C,"乐就"},
	{0x1D,"大蛇"},
	{0x1E,"沮授"},
	{0x1F,"郭图"},
	{0x20,"颜良"},
	{0x21,"文丑"},
	{0x22,"田丰"},
	{0x23,"蛇"},
	{0x24,"韩遂"},
	{0x25,"吕公"},
	{0x26,"黄祖"},
	{0x27,"蒯越"},
	{0x28,"蔡瑁"},
	{0x29,"王粲"},
	{0x2A,"张允"},
	{0x2B,"甘宁"},
	{0x2C,"魏延"},
	{0x2D,"刘琦"},
	{0x2E,"文聘"},
	{0x2F,"蔡和"},
	{0x30,"蔡仲"},
	{0x31,"蔡锺"},
	{0x32,"焦触"},
	{0x33,"张南"},
	{0x34,"赵范"},
	{0x35,"鲍龙"},
	{0x36,"陈沁"},
	{0x37,"金旋"},
	{0x38,"龚志"},
	{0x39,"李摧"},
	{0x3A,"郭汜"},
	{0x3B,"张济"},
	{0x3C,"贾诩"},
	{0x3D,"李肃"},
	{0x3E,"刘度"},
	{0x3F,"刘延"},
	{0x40,"刑道荣"},
	{0x41,"吕虔"},
	{0x42,"魏继"},
	{0x43,"吕布"},
	{0x44,"韩玄"},
	{0x45,"魏延"},
	{0x46,"黄忠"},
	{0x47,"杨龄"},
	{0x48,"韩浩"},
	{0x49,"刘焉"},
	{0x4A,"张松"},
	{0x4B,"孟达"},
	{0x4C,"黄权"},
	{0x4D,"王累"},
	{0x4E,"刘璋"},
	{0x4F,"吴懿"},
	{0x50,"邓贤"},
	{0x51,"张任"},
	{0x52,"吴兰"},
	{0x53,"雷同"},
	{0x54,"杨怀"},
	{0x55,"高沛"},
	{0x56,"严颜"},
	{0x57,"法正"},
	{0x58,"刘贵"},
	{0x59,"刘巴"},
	{0x5A,"刘循"},
	{0x5B,"吕凯"},
	{0x5C,"王伉"},
	{0x5D,"张肃"},
	{0x5E,"冷苞"},
	{0x5F,"彭义"},
	{0x60,"李严"},
	{0x61,"费观"},
	{0x62,"李恢"},
	{0x63,"霍峻"},
	{0x64,"董和"},
	{0x65,"费诗"},
	{0x66,"蒋琬"},
	{0x67,"曹仁"},
	{0x68,"曹仁"},
	{0x69,"纪灵"},
	{0x6A,"黄忠"},
	{0x6B,"曹仁"},
	{0x6C,"夏侯敦"},
	{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
		{0,"张鲁"},
	{0x78,"阎圃"},
	{0x79,"张卫"},
	{0x7A,"杨松"},
	{0x7B,"马超"},
	{0x7C,"马岱"},
	{0x7D,"杨昂"},
	{0x7E,"杨任"},
	{0x7F,"庞德"},
	{0x80,"杨平"},
	{0x81,"杨柏"},
	{0x82,"程银"},
	{0x83,"侯选"},
	{0x84,"张横"},
	{0x85,"李湛"},
	{0x86,"成宜"},
	{0x87,"曹操"},
	{0x88,"夏侯惇"},
	{0x89,"夏候渊"},
	{0x8A,"曹仁"},
	{0x8B,"曹洪"},
	{0x8C,"荀彧"},
	{0x8D,"曹纯"},
	{0x8E,"程昱"},
	{0x8F,"刘晔"},
	{0x90,"郭嘉"},
	{0x91,"于禁"},
	{0x92,"荀攸"},
	{0x93,"乐进"},
	{0x94,"王粲"},
	{0x95,"陈矫"},
	{0x96,"曹昂"},
	{0x97,"典韦"},
	{0x98,"梁兴"},
	{0x99,"韩遂"},
	{0x9A,"杨秋"},
	{0x9B,"马玩"},
	{0x9C,"孔秀"},
	{0x9D,"韩福"},
	{0x9E,"卞喜"},
	{0x9F,"王植"},
	{0xA0,"秦琪"},
	{0xA1,"钟繇"},
	{0xA2,"丁斐"},
	{0xA3,"王必"},
	{0xA4,"金纬"},
	{0xA5,"韦晃"},
	{0xA6,"耿纪"},
	{0xA7,"李典"},
	{0xA8,"吕虔"},
	{0xA9,"魏继"},
	{0xAA,"侯成"},
	{0xAB,"张辽"},
	{0xAC,"徐晃"},
	{0xAD,"曹休"},
	{0xAE,"贾诩"},
	{0xAF,"许褚"},
	{0xB0,"成宜"},
	{0xB1,"司马懿"},
	{0xB2,"毛玠"},
	{0xB3,"曹真"},
	{0xB4,"牛金"},
	{0xB5,"刘繇"},
	{0xB6,"吕翔"},
	{0xB7,"吕旷"},
	{0xB8,"马延"},
	{0xB9,"张凯"},
	{0xBA,"王朗"},
	{0xBB,"曹丕"},
	{0xBC,"高览"},
	{0xBD,"许攸"},
	{0xBE,"文聘"},
	{0xBF,"张郃"},
	{0xC0,"杨修"},
	{0xC1,"陈群"},
	{0xC2,"曹植"},
	{0xC3,"庞德"},
	{0xC4,"李湛"},
	{0xC5,"吕常"},
	{0xC6,"恒楷"},
	{0xC7,"韩浩"},
	{0xC8,"王匡"},
	{0xC9,"朱灵"},
	{0xCA,"辛毕"},
	{0xCB,"华歆"},
	{0xCC,"张南"},
	{0xCD,"傅干"},
	{0xCE,"杜袭"},
	{0xCF,"李通"},
	{0xD0,"吕健"},
	{0xD1,"蒋义渠"},
	{0xD2,"伏完"},
	{0xD3,"穆顺"},
	{0xD4,"夏侯尚"},
	{0xD5,"夏侯德"},
	{0xD6,"朱光"},
	{0xD7,"曹彰"},
	{0xD8,"张允"},
	{0xD9,"郝昭"},
	{0xDA,"陈嬉"},
	{0xDB,"典满"},
	{0xDC,"董衡"},
	{0xDD,"孔融"},
	{0xDE,"焦触"},
	{0xDF,"夏侯威"},
	{0xE0,"夏侯懋"},
	{0xE1,"郭奕"},
	{0xE2,"夏侯霸"},
	{0xE3,"宋宪"},
	{0xE4,"黄盖"},
	{0xE5,"周泰"},
	{0xE6,"廖化"},
	{0},
	{0xE8,"诸葛瑾"},
	{0xE9,"甘宁"},
	{0xEA,"吕干"},
	{0xEB,"太史慈"},
	{0xEC,"张昭"},
	{0xED,"张紘"},
	{0xEE,"鲁肃"},
	{0xEF,"周瑜"},
	{0xF0,"露昭"},
	{0xF1,"车胄"},
	{0xF2,"黄邵"},
	{0xF3,"何仪"},
	{0xF4,"龚都"},
	{0xF5,"刘辟"},
	{0xF6,"司马师"},
	{0xF7,"司马昭"},
	{0xF8,"蔡阳"},
	{0},
	{0},
	{0xFB,"黄巾贼"},
	{0xFC,"兵士"},
	{0xFD,"盗贼"},
	{0xFE,"山贼"},
	{0xFF,"海贼"}
}
prt_props={
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x08,"短剑"},
	{0x09,"铜剑"},
	{0x0A,"铁剑"},
	{0x0B,"闪电剑"},
	{0x0C,"赤龙剑"},
	{0x0D,"石斧"},
	{0x0E,"铜斧"},
	{0x0F,"铁斧"},
	{0x10,"钢斧"},
	{0x11,"火焰斧"},
	{0x12,"木枪"},
	{0x13,"铜枪"},
	{0x14,"铁枪"},
	{0x15,"钢枪"},
	{0x16,"冰枪"},
	{0x17,"石弓"},
	{0x18,"铜弓"},
	{0x19,"铁弓"},
	{0x1A,"钢弓"},
	{0x1B,"火焰弓"},
	{0x1C,"石刀"},
	{0x1D,"铜刀"},
	{0x1E,"铁刀"},
	{0x1F,"钢刀"},
	{0x20,"青龙刀"},
	{0x21,"青铜剑"},
	{0x22,"古锭刀"},
	{0x23,"紫鲨刀"},
	{0x24,"布服"},
	{0x25,"皮甲"},
	{0x26,"铜甲"},
	{0x27,"铁甲"},
	{0x28,"钢甲"},
	{0x29,"火焰甲"},
	{0x2A,"青龙甲"},
	{0x2B,"藤甲"},
	{0x2C,"头带"},
	{0x2D,"皮帽"},
	{0x2E,"铜盔"},
	{0x2F,"铁盔"},
	{0x30,"钢盔"},
	{0x31,"木盾"},
	{0x32,"皮盾"},
	{0x33,"鳞盾"},
	{0x34,"铜盾"},
	{0x35,"铁盾"},
	{0x36,"钢盾"},
	{0x37,"火焰盾"},
	{0x38,"怒龙剑"},
	{0x39,"倚天剑"},
	{0x3A,"白虎斧"},
	{0x3B,"连打剑"},
	{0x3C,"胜宗刀"},
	{0x3D,"诸刃斧"},
	{0x3E,"落雷斧"},
	{0x3F,"连弩"},
	{0x40,"黑龙枪"},
	{0x41,"真空枪"},
	{0x42,"会心枪"},
	{0x43,"蛇戟"},
	{0x44,"偃月刀"},
	{0x45,"冰刀"},
	{0x46,"养由弓"},
	{0x47,"李广弓"},
	{0x48,"风盔"},
	{0x49,"天空盔"},
	{0x4A,"伏龙盾"},
	{0x4B,"雷神盾"},
	{0x4C,"半月弓"},
	{0x4D,"薄月斧"},
	{0x4E,"孟德新书"},
	{0x4f,"怒狮"},
	{0x50,"赤兔马"},
	{0x51,"白马"},
	{0x52,"速攻鞋"},
	{0x53,"项羽护手"},
	{0x54,"赤心丹"},
	{0x55,"铜仙丹"},
	{0x56,"银仙丹"},
	{0x57,"金仙丹"},
	{0x58,"会心丹"},
	{0x59,"银仙石"},
	{0x5A,"金仙石"},
	{0x5B,"会心石"},
	{0x5C,"进攻令牌"},
	{0x5D,"野营帐"},
	{0x5E,"护身烟"},
	{0x5F,"智复丹"},
	{0x60,"智复丹"},
	{0x61,"智复丹"},
	{0x62,"招魂丹"},
	{0x63,"信"},
	{0x64,"信"},
	{0x65,"九转丹"},
	{0x66,"火神书"},
	{0x67,"水龙书"},
	{0x68,"激石书"},
	{0x69,"兵法书"},
	{0x6A,"六甲天书"},
	{0x6B,"茶"},
	{0x6C,"水壶"},
	{0x6D,"茶具"},
	{0x6E,"地图"},
	{0x6F,"西蜀地图"},
	{0x70,"胡班家书"},
	{0x71,"秘法书"},
	{0x72,"硝石"},
	{0x73,"老树枝"},
	{0x74,"火药"},
	{0x75,"百万枝箭"},
	{0x76,"兵符"},
	{0x77,"锦囊"},
	{0x78,"养由弓"},
	{0x79,"酒"},
	{0x7A,"信"},
	{0x7B,"血书"},
	{0x7C,"青铜钥匙"},
	{0x7D,"火药壶"},
	{0x7E,"介绍信"},
	{0x7F,"渡航书"},
}



prt_title = "本程序由by悠然小赐 qq108201645制作"

prt_getstatus = 0
prt_byte_size =prt_hzk_size+1  --汉字宽度12

prt_mykey = {
		0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01
}
prt_elem={}

function prt_inputOut(name,x,y)
	
	--emu.print(name)

	local dx=x dy=y
	local i =1
	while(i < string.len(name)) do
		
		local b1= AND(tonumber(string.byte(name,i,i),10) - 0xa1,255)
		local b2= AND(tonumber(string.byte(name,i+1,i+1),10) - 0xa1,255)
		local	offset = (94 *b1+ b2) * prt_hzk_size*2
		--emu.print(i,string.len(name),b1,string.format("%x-%x",tonumber(string.byte(name,i,i+1),10),tonumber(string.byte(name,i+1,i+1),10)),b2,offset)
		local arr={}

		for j=1, prt_hzk_size*2 do
			table.insert(arr,prt_elem[j+offset])
		end
			--emu.print(offset,prt_elem[offset],":",arr)

		for len1 = 1,prt_hzk_size do
			for set = 1,2 do
					for k = 1,table.getn(prt_mykey) do
							--emu.print(len1 * 2 + set,prt_mykey[k])
							if arr[(len1-1) * 2 + set]~=nil and AND(arr[(len1-1) * 2 + set],prt_mykey[k])~=0 then
								 gui.pixel(dx,dy,0xffffffff)
							end
								dx =dx+1
					end
			end
			dy=dy+1 dx=x+((i-1)*prt_hzk_size/2)
		end
		i=i+2
		 dy =y dx = x+((i-1)*prt_hzk_size/2)
	end
end

--显示部分
function prt_Display(x,y)
return 
	---
end

function prt_DataProcess()
	if (memory.readbyte(0)==0x43 or memory.readbyte(0)==0xf0)and memory.readbyte(0x48)==0xc and
	memory.readbyte(0x5b)==1 and memory.readbyte(2)<=4 then
		local cur = memory.readbyte(0x6628+memory.readbyte(2))
		local offset =rom.readbyte((rom.readbyte(0x6de10+cur)+rom.readbyte(0x6df10+cur)*256)+0x64010+0xd)
		--emu.print(string.format("-%x",offset))
	
		for i=1,prt_npc_counter do
			prt_value[i] =rom.readbyte(0x534d0+rom.readbyte(0x9ff70+offset)+i-1)
			--打印数据
			--emu.print(i,string.format("%x-%x", value[i],0x534d0+rom.readbyte(0x9ff70+offset)+i-1))
		end
		local x = 256-prt_byte_size*6 y=240-prt_byte_size*8
		gui.rect(x,y,256-1,prt_byte_size+y+1,0x7b7b7bf0,0x38383880);
	--	emu.print(cur)
		if cur ~=0 and prt_npc[cur][2]~=nil then
			prt_inputOut("掉宝",x+2,y+2)
			prt_inputOut(prt_npc[cur][2],x+4+prt_byte_size*2,y+2)
		--	local j=1
			for i=1,prt_npc_counter do
				local t=prt_value[i]
			--	emu.print(t)
				if prt_value[i]~=nil and t<=0x7f then
					gui.rect(x,y+i*prt_byte_size+1,256-1,i*prt_byte_size+y+prt_byte_size,0x7b7b7bf0,0x38383880);
					if t~=0 then
						prt_inputOut(prt_props[t][2],x+20,y+i*prt_byte_size+1)
					end
				--	j=j+1
				end
			end
		end
	end
end

function prt_popup()
	
			gui.popup(prt_title,"","")
			local len  = string.len(prt_title)
		
			if len < 0x1d and len >0x22 then
				return -1
			end
			return 1

end



--处理字库
function prt_read_HZK12()

	if prt_getstatus == 0 and prt_popup() == 1 then
	
		local file=io.open(prt_fileName,"rb")
		
		io.input(file)
		
		 if file then
	
			local str=file:read("*all")

			file:close() 
			for i=1,string.len(str) do 
				table.insert(prt_elem,tonumber(string.byte(string.sub(str,i,i))))
			end 
		end
		prt_getstatus = 1
	end 
end



--main

function prt_my_self()
	prt_read_HZK12()
	prt_DataProcess()
	--inputOut("你字好",20,20);
end


gui.register(prt_my_self)