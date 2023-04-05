--英文O键倒档--by 悠然小赐
--最大存档数 --
SAVE_MAX = 2000;

save_array = {}
save_offset = 1;
highest_save = 0; --highest save that has actually been created yet
rewinds = 0;
frame_count = 0;


SAVE_FREQ = 4;

while true do

	local joy = input.read(1);
	frame_count = frame_count + 1;


	if (joy["O"]) then
		rewinds = rewinds + 1;
		if rewinds < SAVE_MAX then
			save_offset = save_offset - 1;
		
			if save_offset < 1 then
				if highest_save == SAVE_MAX then 
					save_offset = SAVE_MAX
			 else 
			 		save_offset = 1
			  end
			end

			savestate.load(save_array[save_offset]);
		else
		
			save_array = {};
			save_offset = 1;
			highest_save = 0;
		end
	else
	
		if frame_count >= SAVE_FREQ then
			save = savestate.create();
			savestate.save(save);
			save_array[save_offset] = save;
			save_offset = save_offset + 1;
			frame_count = 0;
		end

		rewinds = 0;
	end


	if save_offset > SAVE_MAX then 
		table.remove(save_array,1)
		save_offset =save_offset-1
		highest_save=highest_save-1
	end
	if save_offset > highest_save then highest_save = save_offset end
	gui.text(0, 10, save_offset,0xff7b7bf0,0x38383880 );
	emu.frameadvance();
end



