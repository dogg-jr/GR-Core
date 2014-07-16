MellichaeScreenPlay = ScreenPlay:new {
	numberOfActs = 1;
}

registerScreenPlay("MellichaeScreenPlay", true)

function MellichaeScreenPlay:start()
	self:spawnMobiles()
end

function MellichaeScreenPlay:spawnMobiles()
	-- Sith Shadow Group 1
	spawnMobile("dathomir", "sith_shadow_taskmaster", 2200, 5273.35, 78.5, -4075.36, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5277.69, 78.5, -4075.18, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5277.5, 78.5, -4070.34, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5276.94, 78.5, -4078.36, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5280.41, 78.5, -4077.03, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5280.72, 78.5, -4072.5, -116, 0)

	-- Sith Shadow Group 2
	spawnMobile("dathomir", "sith_shadow_taskmaster", 2200, 5260.28, 78.5, -4097.18, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5259.63, 78.5, -4100.21, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5263.25, 78.5, -4101.85, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5256.24, 78.5, -4099.84, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5256.9, 78.5, -4103.52, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5260.61, 78.5, -4104.8, -116, 0)

	-- Sith Shadow Group 3
	spawnMobile("dathomir", "sith_shadow_taskmaster", 2200, 5235.04, 78.5, -4084.77, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5230.46, 78.5, -4086.15, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5231.84, 78.5, -4090.17, -116, 0)
	spawnMobile("dathomir", "sith_shadow_mercenary", 2200, 5228.82, 78.5, -4081.21, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5226.58, 78.5, -4084.79, -116, 0)
	spawnMobile("dathomir", "sith_shadow_outlaw", 2200, 5228.53, 78.5, -4090.16, -116, 0)

	-- Sith Shadow Group 4
	spawnMobile("dathomir", "sith_shadow_commander", 2200, 5239.04, 78.5, -4056.92, -116, 0)
	spawnMobile("dathomir", "sith_shadow_commander", 2200, 5252.9, 78.5, -4052.76, -116, 0)
	spawnMobile("dathomir", "sith_shadow_commander", 2200, 5248.63, 78.5, -4054.03, -116, 0)
	spawnMobile("dathomir", "sith_shadow_commander", 2200, 5243.57, 78.5, -4055.39, -116, 0)
	spawnMobile("dathomir", "sith_shadow_thug", 2200, 5254.04, 78.5, -4056.68, -116, 0)
	spawnMobile("dathomir", "sith_shadow_pirate", 2200, 5240.09, 78.5, -4060.32, -116, 0)
	spawnMobile("dathomir", "sith_shadow_thug", 2200, 5244.73, 78.5, -4059.6, -116, 0)
	spawnMobile("dathomir", "sith_shadow_pirate", 2200, 5249.59, 78.5, -4058.38, -116, 0)

	-- Mellichae and Daktar
	spawnMobile("dathomir", "daktar_bloodmoon", 2200, 5254.78, 78.5, -4080.29, -116, 0)
	spawnMobile("dathomir", "mellichae", 2200, 5248.16, 78.5, -4071.61, -116, 0)
end
