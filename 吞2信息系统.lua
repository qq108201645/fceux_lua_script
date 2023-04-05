--吞食天地2 640k显示掉宝脚本量---需要汉字库12 --- 文本编码ASCII
--显示部分.数字要用全半角字符(直接复制可用)

---０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ﹪～

--掉宝个数
prt_npc_counter = 6    --可以修改此处

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
	{0x6d,"张鲁"},
		{0x6e,"张鲁"},
		{0x6f,"张鲁"},
		{0x70,"张鲁"},
		{0x71,"张鲁"},
		{0x72,"张鲁"},
		{0x73,"张鲁"},
		{0x74,"张鲁"},
		{0x75,"张鲁"},
		{0x76,"张鲁"},
		{0x77,"张鲁"},
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
map_id ={
	{0x00,"大地图"},
	{0x01,"デモプロローグ？"},
	{0x02,"徐州城"},
	{0x03,"地图山洞"},
	{0x04,"徐州山洞"},
	{0x05,"博望坡"},
	{0x06,"周倉山寨"},
	{0x07,"宿/役/道/訓"},
	{0x08,"武/編"},
	{0x09,"黄石公屋外"},
	{0x0A,"郑玄屋外/冀州村/赤松子屋外"},
	{0x0B,"胡華屋外/汜水関/柴桑湖边屋外/斜谷関"},
	{0x0C,"赤壁水寨"},
	{0x0D,"徐州/青州宮殿"},
	{0x0E,"帐篷？"},
	{0x0F,"陳家荘/卧龙岗"},
	{0x10,"冀州城"},
	{0x11,"荊州密道一层"},
	{0x12,"荊州密道二层"},
	{0x13,"関定家/諸葛庐"},
	{0x14,"民居1/馬良居/水闸小屋/吉平居"},
	{0x15,"馬良居外/南郑関"},
	{0x16,"冀州宮殿"},
	{0x17,"宛城"},
	{0x18,"青州城"},
	{0x19,"宛城屋敷"},
	{0x1A,"鎮国寺"},
	{0x1B,"荥阳関"},
	{0x1C,"荊州城"},
	{0x1D,"新野城(初期)"},
	{0x1E,"民家2/郑玄居/胡華家/姜維居"},
	{0x1F,"荥阳関屋敷/襄陽龐統居"},
	{0x20,"民居(徐州/新野)"},
	{0x21,"荊州宮殿"},
	{0x22,"新野宮殿(初期)/陳倉军需仓库"},
	{0x23,"荊州東村1"},
	{0x24,"荊州東村2"},
	{0x25,"荊州東村3"},
	{0x26,"柴桑東村"},
	{0x27,"柴桑南湖"},
	{0x28,"邪馬台"},
	{0x29,"邪馬台民居"},
	{0x2A,"硝石山洞"},
	{0x2B,"民居"},
	{0x2C,"强盗山寨/粮草寨"},
	{0x2D,"龐義居/蒋家荘/山里小屋"},
	{0x2E,"陽平関"},
	{0x2F,"桂陽村/長沙村/李恢居"},
	{0x30,"巴関/綿竹関"},
	{0x31,"巴関(関外)"},
	{0x32,"？？？？？"},
	{0x33,"水镜居/黄忠居"},
	{0x34,"襄陽宮殿"},
	{0x35,"襄陽宮殿阁楼"},
	{0x36,"倭山"},
	{0x37,"柴桑城"},
	{0x38,"江夏城"},
	{0x39,"襄陽城"},
	{0x3A,"柴桑宮殿"},
	{0x3B,"新野城(建设中)"},
	{0x3C,"新野城"},
	{0x3D,"武陵西海角/襄陽西北森林"},
	{0x3E,"养由基弓山洞"},
	{0x3F,"新野宮殿(建设中)"},
	{0x40,"火葯壺山洞"},
	{0x41,"彞陵城"},
	{0x42,"南郡城"},
	{0x43,"零陵城"},
	{0x44,"樊城"},
	{0x45,"長沙城"},
	{0x46,"桂陽城"},
	{0x47,"武陵城"},
	{0x48,"巴城"},
	{0x49,"越雋城"},
	{0x4A,"雒城"},
	{0x4B,"涪水城"},
	{0x4C,"漢中城"},
	{0x4D,"建宁城"},
	{0x4E,"成都城"},
	{0x4F,"荥陽関/綿竹関(火焼)"},
	{0x50,"江夏宮殿"},
	{0x51,"樊城東山洞"},
	{0x52,"襄陽西北山洞"},
	{0x53,"蒋家荘西山洞"},
	{0x54,"孝景皇帝陵一层"},
	{0x55,"孝景皇帝陵二层"},
	{0x56,"孝景皇帝陵三层"},
	{0x57,"涪水堤坝"},
	{0x58,"？？？？？"},
	{0x59,"？？？？？"},
	{0x5A,"？？？？？"},
	{0x5B,"夷陵/南郡/樊城/零陵/武陵/長沙宮殿"},
	{0x5C,"建宁/越雋/雒城宮殿"},
	{0x5D,"粮草寨前山洞"},
	{0x5E,"？？？？？"},
	{0x5F,"？？？？？"},
	{0x60,"？？？？？"},
	{0x61,"六甲天書山洞"},
	{0x62,"？？？？？"},
	{0x63,"？？？？？"},
	{0x64,"？？？？？"},
	{0x65,"斜谷栈道"},
	{0x66,"鉄門峡"},
	{0x67,"石兵八陣"},
	{0x68,"西蜀桟道"},
	{0x69,"？？？？？"},
	{0x6A,"民家3/茶具老人家"},
	{0x6B,"蔣琬家"},
	{0x6C,"鹵城軍需庫1"},
	{0x6D,"鹵城軍需庫2"},
	{0x6E,"赤松子居"},
	{0x6F,"黃石公居"},
	{0x70,"？？？？？"},
	{0x71,"？？？？？"},
	{0x72,"？？？？？"},
	{0x73,"？？？？？"},
	{0x74,"？？？？？"},
	{0x75,"？？？？？"},
	{0x76,"？？？？？"},
	{0x77,"？？？？？"},
	{0x78,"？？？？？"},
	{0x79,"？？？？？"},
	{0x7A,"？？？？？"},
	{0x7B,"？？？？？"},
	{0x7C,"？？？？？"},
	{0x7D,"？？？？？"},
	{0x7E,"？？？？？"},
	{0x7F,"？？？？？"},
	{0x80,"長安城"},
	{0x81,"？？？？？"},
	{0x82,"街亭"},
	{0x83,"高老荘"},
	{0x84,"祁山関"},
	{0x85,"五丈原関隘"},
	{0x86,"成都宮殿"},
	{0x87,"？？？？？"},
	{0x88,"？？？？？"},
	{0x89,"？？？？？"},
	{0x8A,"？？？？？"},
	{0x8B,"？？？？？"},
	{0x8C,"洛陽城"},
	{0x8D,"安定城"},
	{0x8E,"天水城"},
	{0x8F,"陳倉城"},
	{0x90,"鹵城"},
	{0x91,"南安城"},
	{0x92,"新野城宮殿"},
	{0x93,"涪水宮殿"},
	{0x94,"漢中宮殿"},
	{0x95,"巴城宮殿"},
	{0x96,"南安/陳倉/長安宮殿"},
	{0x97,"安定宮殿"},
	{0x98,"天水宮殿"},
	{0x99,"鹵城宮殿"},
	{0x9A,"洛陽宮殿"},
	{0x9B,"武陵村"},
	{0x9C,"葭萌関"},
	{0x9D,"渭水関"},
	{0x9E,"桂陽宮殿"},
	{0x9F,"李恢居/龐義居/王平居"}
}
prt_props={
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x0},
	{0x08,"短剑 "},
	{0x09,"铜剑 "},
	{0x0A,"铁剑 "},
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



----"本程序由by悠然小赐 qq108201645制作"

require 'winapi'
require("auxlib");
label={iup.label{title = "                                                            "},
iup.label{title = "                                                            "},
iup.label{title = "                                                            "},
iup.label{title = "                                                            "},
iup.label{title = "                                                            "},
iup.label{title = "                                                            "},
}

npcLabel=iup.label{title = "                                                            "}
counter =1

cur_label_m=iup.label{title = "                                                            "}
counter =1

function formatOut(...)
	s=""
	local arg={...}
	for _,v in pairs(arg) do
		s=s..(type(v)=="string" and v or string.format("%x",v))
	end
	print(s)
	return s
end
function clear_label(b,e)
  local beg_ = b~=nil and b or 1
  local end_ = e~=nil and e or #label
	for i=beg_,end_ do
		label[i].title = "                                                            "
	end
end
function DataProcess()
--金钱与经验	
	function get_exp()
		local exp_sum=0
		for i=0,4  do
			if memory.readbyte(0x6628+i)~=0 then
			--	formatOut(memory.readbyte(0x6628+i))
			--读取武力与智力
				local sum = memory.readbyte(0x667c+i)+memory.readbyte(0x6688+i)
			--读取章节
			--print(curId)
				local chapter = memory.readbyte(0x6010) 
				local offset = bit.lshift(rom.readbyte(0x51fba+chapter),8)
				
				local exp_result=bit.rshift(sum * offset,8)
			--	formatOut(offset,",",sum,",",exp_result)
				
				--读取下一个对兵力的计算的id
				local selId=memory.readbyte(0xff41+i)
				
				local j=-1
				while(true) do
					j=j+1
					local subV = rom.readbyte(0x51f83+j)+bit.lshift(rom.readbyte(0x51f90+j),8)
					
					local subCnt=0
					local tmp_result=bit.lshift(memory.readbyte(0x6666+selId+2),16)+
					bit.lshift(memory.readbyte(0x6666+selId+1),8)+memory.readbyte(0x6666+selId)
					--formatOut(0x6666+selId+1," ",selId)
					--formatOut(0x6666+selId," ",subV)
					tmp_result=tmp_result-subV
					if tmp_result < 0 then
						break
					end
				end
					--	formatOut(j," ",exp_result," ",rom.readbyte(0x51f9d+j)+bit.lshift(rom.readbyte(0x51faa+j),8))
				exp_result= bit.rshift(exp_result *(rom.readbyte(0x51f9d+j)+bit.lshift(rom.readbyte(0x51faa+j),8)),8)
			--	formatOut(exp_result)
				
		
				exp_sum=exp_sum+exp_result
			
			end
		end
		--如果是剧情战
				if memory.readbyte(0x75) < 0x80 then
					local offset75 = bit.rshift(rom.readbyte(0x6ad10+memory.readbyte(0x75)),6)
				--	formatOut(rom.readbyte(0x6ad10+memory.readbyte(0x75))," ",bit.rshift(rom.readbyte(0x6ad10+memory.readbyte(0x75)),6))
					exp_sum=bit.lshift(rom.readbyte(0x51fb7+offset75),8)*exp_sum
					exp_sum=bit.rshift(exp_sum,8)
				end
				
				exp_sum=exp_sum/0x32
		
		if  memory.readbyte(0x48)==0xc then
		return string.format("[将获得的经验点:%d]",math.floor(exp_sum))
		else
		return string.format("[将获得的经验点:%d]",0)
		end
	end
	
	
	function get_mon()
		local mon_sum=0
			for i=0,4  do
				if memory.readbyte(0x6628+i)~=0 then
					local selId=memory.readbyte(0xff41+i)
					local tmp_result=bit.lshift(memory.readbyte(0x6666+selId+2),16)+
						bit.lshift(memory.readbyte(0x6666+selId+1),8)+memory.readbyte(0x6666+selId)
					local mul = 0
					
					if memory.readbyte(0x6688+i) >= memory.readbyte(0x667c+i) then
						mul=bit.lshift(memory.readbyte(0x6688+i),8)
					else
						mul=bit.lshift(memory.readbyte(0x667c+i),8)
					end
				--	print(i,selId,string.format("%x-%x-%x",tmp_result,0x667c+selId,mul))
					tmp_result= bit.rshift(tmp_result * mul,8)
				--	print(i,string.format("%x",tmp_result))
					local chapter = memory.readbyte(0x6010) 
					local offset = bit.lshift(rom.readbyte(0x520bb+chapter),8)+rom.readbyte(0x520b5+chapter)
				
					local mon_result=math.floor(bit.rshift(offset*tmp_result,8)/0x5dc)
			--	print(i,string.format("%x",mon_result))
				
				
				--print(i,string.format("%x",mon_result))
					
					mon_sum = mon_sum + mon_result
				--	print(i,string.format(":%x-%x",mon_result,mon_sum))
				end
			
			end
		
	--	formatOut(mon_sum)

		if memory.readbyte(0x75) < 0x80 then
			local offset75 = bit.rshift(rom.readbyte(0x6ad10+memory.readbyte(0x75)),6)
			--formatOut(rom.readbyte(0x6ad10+memory.readbyte(0x75))," ",bit.rshift(rom.readbyte(0x6ad10+memory.readbyte(0x75)),6))
			mon_sum=bit.lshift(rom.readbyte(0x520c2+offset75),8)*mon_sum
			
			mon_sum=bit.rshift(mon_sum,8)
			--formatOut(mon_sum)
		
		elseif memory.readbyte(0x6628) < 0xfb then
			mon_sum = bit.rshift(0x180*mon_sum,8)
		end
		--formatOut(mon_sum)
		if  memory.readbyte(0x48)==0xc then
		return  string.format("[将获得金的数量:%d]",mon_sum)
		else
		return  string.format("[将获得金的数量:%d]",0)
		end
	end
--所需经验
	function level_up_needsExp()
	
		if memory.readbyte(0x602b)< 100 then
			local Exp_offset=memory.readbyte(0x602b)-1
			Exp_offset =bit.band(Exp_offset+bit.lshift(Exp_offset,1),255)
			--print(Exp_offset)
			local Exp_=bit.lshift(memory.readbyte(0x602a),16)+
						bit.lshift(memory.readbyte(0x6029),8)+memory.readbyte(0x6028)
			local nextNeedsExp=bit.lshift(rom.readbyte(0x6b4b0+Exp_offset+2),16)+
						bit.lshift(rom.readbyte(0x6b4b0+Exp_offset+1),8)+rom.readbyte(0x6b4b0+Exp_offset)
			--formatOut(rom.readbyte(0x6b4b0+Exp_offset+2))
			local result=nextNeedsExp-Exp_
			return string.format("<水平提高一档需要:%d点经验>",result)
		else
			return "<满级了 100级>"
		end
	end
	
--掉宝代码
	function prt(curNpcNo)
	
		local offset =rom.readbyte((rom.readbyte(0x6de10+curNpcNo)+rom.readbyte(0x6df10+curNpcNo)*256)+0x64010+0xd)
		--emu.print(string.format("-%x",offset))
		
		for i=1,prt_npc_counter do
			prt_value[i] =rom.readbyte(0x534d0+rom.readbyte(0x9ff70+offset)+i-1)
		--	print(string.format("%x",0x534d0+rom.readbyte(0x9ff70+offset)+i-1))
			--打印数据
			--emu.print(i,string.format("%x-%x", value[i],0x534d0+rom.readbyte(0x9ff70+offset)+i-1))
		end

		

		if curNpcNo ~=0 and prt_npc[curNpcNo][2]~=nil then
			npcLabel.title="<掉宝武将:"..prt_npc[curNpcNo][2].."> "
			cur_label_m.title= "<编号"..string.format("0x%X",prt_npc[curNpcNo][1])..">"
			for i=1,prt_npc_counter do
				local t=prt_value[i]
		
				if prt_value[i]~=nil and t<=0x7f then
			
					if t~=0 then
						label[i].title =prt_props[t][2].."<ROM地址:"..string.format("0x%X:%X",0x534d0+rom.readbyte(0x9ff70+offset)+i-1,prt_value[i])..">"
					else
						label[i].title="空位"
					end
				--	j=j+1
				end
			end
		end
	end
	
	local curId = memory.readbyte(2)
	local curNpcNo = memory.readbyte(0x6628+curId)
	
	if not(memory.readbyte(0x5b)==1 and memory.readbyte(2)<=4) then 
	--	clear_label(5)
		cur_label_m.title="【场景:"..map_id[memory.readbyte(0x47)+1][2].."】"
		npcLabel.title="本轮预计获得经验与金(误差值±1)"
		label[1].title = get_exp()
		label[2].title = get_mon()
		label[3].title=string.format("<第%d章> <当前等级:%d>",memory.readbyte(0x6010),memory.readbyte(0x602b))
		label[4].title=level_up_needsExp()
		label[5].title="<当前队伍的经验值:"..tostring(bit.lshift(memory.readbyte(0x602a),16)+bit.lshift(memory.readbyte(0x6029),8)+memory.readbyte(0x6028))..">"
		
		label[6].title="<当前金的数量:"..tostring(bit.lshift(memory.readbyte(0x602e),16)+bit.lshift(memory.readbyte(0x602d),8)+memory.readbyte(0x602c))..">"
	else
	if  memory.readbyte(0x48)==0xc then
		prt(curNpcNo)
	end
	end
end

	

--main

step = iup.button{}

dialogs =dialogs+ 1
exec_counter=-1

step.action = function()

		if exec_counter==0 then
		--	if  memory.readbyte(0x48)==0xc then
				DataProcess()
		--	else
		--		clear_label()
		--		npcLabel.title = "                                                            "
			
		--	end 
		end
			exec_counter =exec_counter+1
		if exec_counter > 5 then
			exec_counter = 0
		end
end

desktopWidth, desktopHeight = winapi.get_desktop_window():get_bounds();
fceuxWindow = winapi.find_window("FCEUXWindowClass", nil);
fceuxWindowX, fceuxWindowY = fceuxWindow:get_position();
fceuxWindowW,fceuxWindowH=fceuxWindow:get_bounds()

handles[dialogs] = iup.dialog{ iup.vbox{cur_label_m,npcLabel,label[1],label[2],label[3],label[4],label[5],label[6]},title = "信息系统",size = "150x140"}

handles[dialogs]:showxy(fceuxWindowX+fceuxWindowW,fceuxWindowY);


function my_main()

		step:action()
		
end


gui.register(my_main)