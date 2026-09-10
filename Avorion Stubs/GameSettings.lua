---@class GameSettings
GameSettings = {

	barrier = true, -- [read-only] bool
	bigWreckageDespawnTime = 0.0, -- float
	collisionDamage = 0.0, -- float
	damageMultiplier = 0.0, -- float
	devMode = true, -- bool
	difficulty = Difficulty.Lowest, -- Difficulty
	dockingRestrictions = true, -- bool
	eventsFactor = 0.0, -- float
	fullBuildingUnlocked = true, -- bool
	infiniteResources = true, -- bool
	initialRelations = 0, -- int
	mapFactions = 0, -- [read-only] int
	maximumAllianceShips = 0, -- int
	maximumAllianceShipsPerMember = 0, -- int
	maximumAllianceStations = 0, -- int
	maximumAllianceStationsPerMember = 0, -- int
	maximumBlocksPerCraft = 0, -- int
	maximumFightersPerSectorAndPlayer = 0, -- int
	maximumPlayerShips = 0, -- int
	maximumPlayerStations = 0, -- int
	maximumStationsPerSector = 0, -- int
	maximumVolumePerShip = 0.0, -- double
	maximumVolumePerStation = 0.0, -- double
	permaDestruction = true, -- bool
	playTutorial = true, -- bool
	preciseAIAim = true, -- bool
	pvpDamage = true, -- bool
	reconstructionAllowed = true, -- [read-only] bool
	relationGainFactor = 0.0, -- float
	relationLossFactor = 0.0, -- float
	repairingAlwaysAllowed = true, -- bool
	resourceAsteroidFactor = 0.0, -- float
	resourceWreckageFactor = 0.0, -- float
	rifts = 0, -- [read-only] int
	safePlayerInput = true, -- bool
	seed = "", -- string
	shipyardBoundBuilding = true, -- bool
	smallWreckageDespawnTime = 0.0, -- float
	startingResources = 0, -- int
	storyline = true, -- bool
	unlimitedProcessingPower = true, -- bool
	unlimitedShipSize = true, -- bool

}

---@return GameSettings
function GameSettings()
	return GameSettings
end

---@return any @nothing
function GameSettings:activate()
	return nil
end

