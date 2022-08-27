#macro SAVENAME "save.ddd"

// Save files are compressed using zlib and stored in a binary format

function save_game()
{
	var _buf = buffer_create(4096, buffer_grow, 1);
	
	buffer_write(_buf, buffer_string, global.name);
	
	if (obj_global.destRoom < 0)
	{
		obj_global.destRoom = rm_mainmenu
	}
	buffer_write(_buf, buffer_u32, obj_global.destRoom);
	
	var _stats = ds_map_values_to_array(global.gameStats);
	for (var i = 0; i < array_length(_stats); i++)
	{
		buffer_write(_buf, buffer_u32, _stats[i].wins);
		buffer_write(_buf, buffer_u32, _stats[i].losses);
		buffer_write(_buf, buffer_u32, _stats[i].shortestTime);
		
		for (var j = 0; j <= DIFFICULTY.LUNATIC; j++)
		{
			buffer_write(_buf, buffer_u8, _stats[i].difficultyWin[j]);
		}
	}
	
	if (debug_mode)
	{
		buffer_save(_buf, "decomp.ddd");
	}
	var _cBuf = buffer_compress(_buf, 0, buffer_tell(_buf));
	var _checksum = buffer_crc32(_cBuf, 0, buffer_get_size(_cBuf));
	var _sBuf = buffer_create(4, buffer_grow, 1);
	buffer_write(_sBuf, buffer_u32, _checksum)
	
	buffer_copy(_cBuf, 0, buffer_get_size(_cBuf), _sBuf, buffer_get_size(_sBuf));
	
	buffer_save(_sBuf, SAVENAME);
	buffer_delete(_buf);
	buffer_delete(_cBuf);
	buffer_delete(_sBuf);
}

function load_game()
{
	if (file_exists(SAVENAME))
	{
		var _sBuf = buffer_load(SAVENAME);
		var _checksum = buffer_read(_sBuf, buffer_u32);
	
		
		var _cBuf = buffer_create(1, buffer_grow, 1);
		buffer_copy(_sBuf, 4, buffer_get_size(_sBuf) - 4, _cBuf, 0);
		
		if (_checksum == buffer_crc32(_cBuf, 0, buffer_get_size(_cBuf)))
		{
			show_debug_message("Checksum Passed!")
			var _buf = buffer_decompress(_cBuf);
		
			global.name = buffer_read(_buf, buffer_string);
			obj_global.destRoom = buffer_read(_buf, buffer_u32);
		
			var _stats = ds_map_keys_to_array(global.gameStats);
			for (var i = 0; i < array_length(_stats); i++)
			{
				try
				{
					global.gameStats[? _stats[i]].wins = buffer_read(_buf, buffer_u32);
					global.gameStats[? _stats[i]].losses = buffer_read(_buf, buffer_u32);
					global.gameStats[? _stats[i]].shortestTime = buffer_read(_buf, buffer_u32);
					for (var j = 0; j <= DIFFICULTY.LUNATIC; j++)
					{
						global.gameStats[? _stats[i]].difficultyWin[j] = buffer_read(_buf, buffer_u8);
					}
				}
				catch(e)
				{
					break;
				}
			}
			buffer_delete(_buf);
		}
		else
		{
			show_debug_message("Checksum Failed!")
		}
		
		buffer_delete(_cBuf);
		buffer_delete(_sBuf);
	}
	else
	{
		show_debug_message("No file found!")
	}
}