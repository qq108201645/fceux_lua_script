--不保证兼容所有游戏，仅测试吞食天地2 by桔皮沙拉

ctrl_value = 0
max_counter = 500
function ppu_ctrl(addr,v,a)
	ctrl_value =a
end
system_status=0
cnt=0
x =0 y= 0
addr = 0
mod_x = 0
function ppu_scroll(addr,v,a)
	mod_x = 0 
	--	if system_status==0 then
	if cnt == 0 then x= a 
	elseif cnt==1 then y = a end
	--emu.print(string.format("%x-x:%x-y:%x",cnt,x,y))
	cnt=cnt+1
	if cnt >1 then cnt =0 end
	---end
end
cx = 0  cy =0

function display(a)
		
		gui.rect(cx,cy,cx+8,cy+8,0x7b7b7b80,0xff3838a0)
		
		local nx =0 ny = 0
		if cx > 256/2 then
			nx = cx-8*15
		else
			nx = cx +1
		end
		if cy > 240/2 then
			ny = cy-32
		else
			ny = cy+1
		end
		
		gui.text(nx+8,ny+8,string.format("pTabA 0x%0.4X",
		(AND(ctrl_value,16)~= 0 and {0x1000+ppu.readbyte(a)*16} or {ppu.readbyte(a)*16})[1]),
		0xfffffff0,0x383838c0)
		
		gui.text(nx+8,ny+16,string.format("PPU addr 0x%X-ID:%0.2x",a,ppu.readbyte(a)),0xfffffff0,0x383838c0)
		
		local  attribute_address =XOR( 0x23C0, AND(a , 0x0C00), AND(math.floor(a /16), 0x38) , AND(math.floor(a /4) , 0x07))
		gui.text(nx+8,ny+24,string.format("Attr addr 0x%0.4X-ID:%0.2x",attribute_address,ppu.readbyte(attribute_address)),0xfffffff0,0x383838c0)
		
end

status = 0
mouse_x = 0 mouse_y = 0
counter = 0

function calcAddr(x,y,N)
	local a = OR(math.floor(y/64) , (AND(y,3) *16) ,AND(N,1)*4)
	local b =  OR(math.floor(x/8) , (AND(y, 0x38))*4)
	mod_x =x%8
	return a * 256 + b+8192
end


function getAddrX(a,vx)
--emu.print(vx)
	for dx =1,vx do
		a = a + 1
		if AND(a-1,0x1f) == 31 then
		a = XOR(a-0x20,0x400)
		end
		--emu.print(dx,string.format("%x",a))
	end
	return a
end
function getAddrY(a,vy)
	for dy =1,vy do
			a = a + 0x20
			if(dy-1 +math.floor(y/8)==29) or dy-1+math.floor(y/8) == 31+29 then
				a = XOR(a-0x3c0,0x800)
			end
			--emu.print(dy,string.format("%x",a))
	end
	return a
end


addr = 0
function test()
	keyboard_input()
	if status==1 then

		
		counter =max_counter
	end
	
	if counter ~= 0  then
			--emu.print(x,y,string.format("ppu address: %x",addr))
	
		addr = calcAddr(x,y,ctrl_value)
		--emu.print(x,y,string.format("ppu address: %x",addr))
	
		addr = getAddrX(addr,math.floor(mouse_x/8))
		--emu.print(x,y,string.format("ppu address: %x",addr))
		addr = getAddrY(addr,math.floor(mouse_y/8))
		--emu.print(string.format("2 ppu address: %d %d %x",mouse_x,mouse_y,addr))
		cx= math.floor(mouse_x/8)*8+mod_x cy = math.floor(mouse_y/8)*8
	--	if addr <=0x3000 then
		display(addr)
	--	end
		counter = counter- 1
	else
		status=0
	end 
end


function keyboard_input()
	status = 0
	local t=input.get(1)
	mouse_x = t.xmouse mouse_y = t.ymouse
	if mouse_x >=0 and mouse_x<255 and mouse_y>=0 and mouse_y<239 then
		if t.leftclick then 
			status = 1
	
			mouse_x = t.xmouse mouse_y = t.ymouse
		end
	end
end

function start(a) 
--emu.print(string.format("%x",a))
	if a==0xe000 then system_status =0
	elseif a==0xe001 then system_status=1 end
end
function script()
	memory.registerwrite(0x2000,1,ppu_ctrl)
	memory.registerwrite(0x2005,1,ppu_scroll)
	test()
	--memory.registerwrite(0xe000,1,start)
  --memory.registerwrite(0xe001,1,start)
	--emu.frameadvance()
end

gui.register(script)