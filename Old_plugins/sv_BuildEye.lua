


local Dir = "eye"
local Done = "hac_eye.txt"

local function BuildEye(ply,cmd,args)
	if not ply:IsSuperAdmin() then return end
	if not file.Exists(Dir, "DATA") then
		print("[HAC] Eye folder gone!")
		return
	end
	
	local Temp = {}
	
	for k,v in pairs( file.Find(Dir.."/*.txt", "DATA") ) do
		local Kfile = file.Read(Dir.."/"..v, "DATA")
		local KTab = string.Explode("\n", Kfile)
		
		for x,y in pairs(KTab) do
			if ValidString(y) then --Ignore first few lines
				y = y:gsub("\t", ""):Trim()
				
				if not table.HasValue(Temp, y) then
					table.insert(Temp, y)
				end
			end
		end
	end
	
	if not file.Exists(Done, "DATA") then
		HAC.file.Write(Done, "\n\n\n", "DATA")
	end
	
	for k,v in ipairs(Temp) do
		HAC.file.Append(Done, Format('\t%s\n', v), "DATA")
	end
	
	print("[HAC] Saved: ["..#Temp.."] entries!")
end
concommand.Add("hac_buildeye", BuildEye)














