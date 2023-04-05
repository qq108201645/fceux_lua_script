-- This script shows a simple button and click event

-- Include our help script to load iup and take care of exit
require("auxlib");
function SetKey()
	local t=joypad.get(1)
	for i=1,#key do
		if key[i][1]==1 then
			joypad.set(1,key[i][2])
		end
	end
end
key={
{0,{up=true}},
{0,{down=true}},
{0,{left=true}},
{0,{right=true}},
{0,{select=true}},
{0,{start=true}},
{0,{A=true}},
{0,{B=true}},
}
function testiup()
	-- Our callback function
	
--	function someActionUP(self, a) gui.text(10,10,"UP"); local t = getKey();joypad.set(1,key[1]) ;end;
--	function someActionDOWN(self, a) gui.text(10,10,"DOWN"); local t = getKey();joypad.set(1,key[2]); end;
--	function someActionLEFT(self, a) gui.text(10,10,"LEFT"); local t = getKey();joypad.set(1,key[3]);end;
--	function someActionRITGHT(self, a) gui.text(10,10,"RITGHT"); local t = getKey();joypad.set(1,key[4]);end;
--	function someActionSELECT(self, a) gui.text(10,10,"SELECT"); local t = getKey();joypad.set(1,key[5]) ;end;
--	function someActionSTART(self, a) gui.text(10,10,"START"); local t = getKey();joypad.set(1,key[6]); end;
--	function someActionA(self, a) gui.text(10,10,"A"); local t = getKey();joypad.set(1,key[7]);end;
--	function someActionB(self, a) gui.text(10,10,"B"); local t = getKey();joypad.set(1,key[8]);end;
	-- Create a button
	myButtonUP = iup.button{title="上", marginleft=0,rastersize="50x50",size=0};
	myButtonDOWN = iup.button{title = "下", rastersize="50x50"}
	myButtonLEFT=iup.button{title = "左", rastersize="50x50"}
	myButtonRIGHT=iup.button{title = "右", rastersize="50x50"}
	myButtonSELECT = iup.button{title="选择", marginleft=0,rastersize="50x40",size=0};
	myButtonSTART = iup.button{title = "开始", rastersize="50x40"}
	myButtonA=iup.button{title = "A", rastersize="70x70"}
	myButtonB=iup.button{title = "B", rastersize="70x70"}
	
	
	function myButtonUP:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[1][1]=e
	end
	function myButtonDOWN:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[2][1]=e
	end
	function myButtonLEFT:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[3][1]=e
	end
	function myButtonRIGHT:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[4][1]=e
	end
	function myButtonSELECT:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[5][1]=e
	end
	function myButtonSTART:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[6][1]=e
	end
	function myButtonA:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[7][1]=e
	end
	function myButtonB:button_cb(b, e, x, y, r)
  	--print ("Button: " .. "Button="..tostring(b).." Pressed="..tostring(e).." X="..tostring(x).." Y="..tostring(y) )
			key[8][1]=e
	end
	-- Set the callback
--	myButtonUP.action = someActionUP;
--	myButtonDOWN.action = someActionDOWN;
--	myButtonLEFT.action = someActionLEFT;
--	myButtonRIGHT.action = someActionRITGHT;
--	myButtonSELECT.action = someActionSELECT;
--	myButtonSTART.action = someActionSTART;
--	myButtonA.action = someActionA;
--	myButtonB.action = someActionB;
	-- Create the dialog
	dialogs = dialogs + 1;
	--print(myButtonUP.action)
	--local t = isbutton1(myButtonUP.action.status)
	
	handles[dialogs] = iup.dialog{ iup.vbox{
	iup.fill{size="2"},
	iup.hbox{
				iup.fill{size="35"},
			myButtonUP},
			iup.fill{size="5"},
			iup.hbox{myButtonLEFT,iup.fill{size ="38"},myButtonRIGHT,iup.fill{size ="160"},myButtonB,
			iup.fill{size ="10"},myButtonA}, 
			--iup.fill{size="1"},
	iup.hbox{
				iup.fill{size="35"},
	myButtonDOWN,iup.fill{size ="60"},myButtonSTART,iup.fill{size ="20"},myButtonSELECT},gap="5"},
	title="fceux虚拟按键", size = "380x140" };
	
	handles[dialogs]:showxy(iup.CENTER, iup.CENTER);
		
end

testiup();

while (true) do -- prevent script from exiting
	SetKey()
	FCEU.frameadvance();
end;