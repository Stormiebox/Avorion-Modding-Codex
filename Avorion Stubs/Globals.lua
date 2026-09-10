--- @class AIState @Enum
AIState = {
	None = 0,
	Idle = 1,
	Escort = 2,
	Aggressive = 3,
	Passive = 4,
	Guard = 5,
	Jump = 6,
	Fly = 7,
	LinearFly = 8,
	Attack = 9,
	Follow = 10,
	Harvest = 11,
	Boarding = 12,
	PassiveTurning = 13,
	RepairTarget = 14,
	Repair = 15
}

--- @class AlliancePrivilege @Enum
AlliancePrivilege = {
	Invite = 0,
	Kick = 1,
	Promote = 2,
	Demote = 3,
	EditRanks = 4,
	EditMap = 5,
	AddItems = 6,
	SpendItems = 7,
	TakeItems = 8,
	AddResources = 9,
	SpendResources = 10,
	TakeResources = 11,
	FoundShips = 12,
	FoundStations = 13,
	ManageStations = 14,
	ManageShips = 15,
	FlyCrafts = 16,
	ModifyCrafts = 17,
	ModifyEmblem = 18,
	ModifyMessageOfTheDay = 19,
	NegotiateRelations = 20
}

--- @class BeamShape @Enum
BeamShape = {
	None = 0,
	Straight = 1,
	Lightning = 2,
	Swirly = 3
}

--- @class BlockShading @Enum
BlockShading = {
	WindowedHull = 0,
	Hull = 1,
	Engine = 2,
	Stone = 3,
	Housing = 4,
	Cargo = 5,
	Thruster = 6,
	Armor = 7,
	ShieldGen = 8,
	Generator = 9,
	EnergyContainer = 10,
	IntegrityGenerator = 11,
	ComputerCore = 12,
	SolarPanel = 13,
	Hangar = 14,
	Emissive = 15,
	Glass = 16,
	Reflector = 17,
	Framework = 18,
	Dock = 19,
	Hologram = 20,
	WormHole = 21,
	RichStone = 22,
	TurretLocker = 23,
	Gyro = 24,
	InertiaDampener = 25,
	BlackBox = 26,
	Translucent = 27,
	Assembly = 28,
	TorpedoLauncher = 29,
	TorpedoStorage = 30,
	TurretBase = 31,
	SuperRichStone = 32
}

--- @class BlockType @Enum
BlockType = {
	Hull = 0,
	BlankHull = 1,
	EdgeHull = 2,
	CornerHull = 3,
	OuterCornerHull = 4,
	InnerCornerHull = 5,
	TwistedCorner1 = 6,
	TwistedCorner2 = 7,
	FlatCornerHull = 8,
	Engine = 9,
	Thruster = 10,
	CargoBay = 11,
	Quarters = 12,
	Dock = 13,
	Stone = 14,
	StoneEdge = 15,
	StoneCorner = 16,
	StoneOuterCorner = 17,
	StoneInnerCorner = 18,
	StoneTwistedCorner1 = 19,
	StoneTwistedCorner2 = 20,
	StoneFlatCorner = 21,
	Glass = 22,
	GlassEdge = 23,
	GlassCorner = 24,
	GlassOuterCorner = 25,
	GlassInnerCorner = 26,
	GlassTwistedCorner1 = 27,
	GlassTwistedCorner2 = 28,
	GlassFlatCorner = 29,
	Reflector = 30,
	ReflectorEdge = 31,
	ReflectorCorner = 32,
	ReflectorOuterCorner = 33,
	ReflectorInnerCorner = 34,
	ReflectorTwistedCorner1 = 35,
	ReflectorTwistedCorner2 = 36,
	ReflectorFlatCorner = 37,
	Framework = 38,
	ShieldGenerator = 39,
	Generator = 40,
	Armor = 41,
	EdgeArmor = 42,
	CornerArmor = 43,
	OuterCornerArmor = 44,
	InnerCornerArmor = 45,
	TwistedCorner1Armor = 46,
	TwistedCorner2Armor = 47,
	FlatCornerArmor = 48,
	ComputerCore = 49,
	SolarPanel = 50,
	Light = 51,
	EnergyContainer = 52,
	Hangar = 53,
	Glow = 54,
	GlowEdge = 55,
	GlowCorner = 56,
	GlowInnerCorner = 57,
	GlowOuterCorner = 58,
	GlowTwistedCorner1 = 59,
	GlowTwistedCorner2 = 60,
	GlowFlatCorner = 61,
	Holo = 62,
	HoloEdge = 63,
	HoloCorner = 64,
	HoloInnerCorner = 65,
	HoloOuterCorner = 66,
	HoloTwistedCorner1 = 67,
	HoloTwistedCorner2 = 68,
	HoloFlatCorner = 69,
	RichStone = 70,
	RichStoneEdge = 71,
	RichStoneCorner = 72,
	RichStoneInnerCorner = 73,
	RichStoneOuterCorner = 74,
	RichStoneTwistedCorner1 = 75,
	RichStoneTwistedCorner2 = 76,
	RichStoneFlatCorner = 77,
	SuperRichStone = 78,
	SuperRichStoneEdge = 79,
	SuperRichStoneCorner = 80,
	SuperRichStoneInnerCorner = 81,
	SuperRichStoneOuterCorner = 82,
	SuperRichStoneTwistedCorner1 = 83,
	SuperRichStoneTwistedCorner2 = 84,
	SuperRichStoneFlatCorner = 85,
	Wreckage = 86,
	WreckageEdge = 87,
	WreckageCorner = 88,
	WreckageInnerCorner = 89,
	WreckageOuterCorner = 90,
	WreckageTwistedCorner1 = 91,
	WreckageTwistedCorner2 = 92,
	WreckageFlatCorner = 93,
	Portal = 94,
	TurretImmobilizer = 95,
	TurretImmobilizerEdge = 96,
	Assembly = 97,
	TorpedoLauncher = 98,
	FrontTorpedoLauncher = 99,
	TorpedoStorage = 100,
	TurretBase = 101,
	EdgeTurretBase = 102,
	BlackBox = 103,
	DirectionalThruster = 104,
	InertiaDampener = 105,
	IntegrityGenerator = 106,
	HyperspaceCore = 107,
	Gyro = 108,
	Transporter = 109,
	Academy = 110,
	CloningPod = 111,
	ShipName = 112,
	ShipNameEdge = 113,
	Emblem = 114,
	EmblemEdge = 115
}

--- @class BoxType @Enum
BoxType = {
	Default = 0,
	OrientedBox = 1,
	Edge = 2,
	Corner = 3,
	InnerCorner = 4,
	TwistedCorner1 = 5,
	TwistedCorner2 = 6
}

--- @class BuildError @Enum
BuildError = {
	BuildingOk = 0,
	EnemiesNearby = 1,
	UnderAttack = 2,
	RecentlyDamaged = 3
}

--- @class CaptainGenderId @Enum
CaptainGenderId = {
	Male = 0,
	Female = 1
}

--- @class ChatChannel @Enum
ChatChannel = {
	All = 0,
	Sector = 1,
	Group = 2,
	Alliance = 3,
	Economy = 4
}

--- @class ChatMessageType @Enum
ChatMessageType = {
	Normal = 0,
	Information = 1,
	Error = 2,
	Warning = 3,
	Whisp = 4,
	ServerInfo = 5,
	Chatter = 6,
	Economy = 7
}

--- @class ComponentType @Enum
ComponentType = {
	Position = 0,
	Plan = 1,
	Asleep = 2,
	BoundingSphere = 3,
	BoundingBox = 4,
	Velocity = 5,
	Physics = 6,
	Owner = 7,
	Scripts = 8,
	ScriptCallback = 9,
	EntityType = 10,
	Children = 11,
	Intersection = 12,
	BspTree = 13,
	StructuralIntegrity = 14,
	SimpleScriptValues = 15,
	TurretBases = 16,
	Transporter = 17,
	CargoBay = 18,
	Name = 19,
	Crew = 20,
	Durability = 21,
	PlanMaxDurability = 22,
	Title = 23,
	Turrets = 24,
	ControlUnit = 25,
	ShipSystem = 26,
	DockingPositions = 27,
	DirectFlightPhysics = 28,
	Mothership = 29,
	ShipAI = 30,
	Hangar = 31,
	FighterAI = 32,
	TorpedoAI = 33,
	Torpedo = 34,
	FighterController = 35,
	StatsBonuses = 36,
	InteractionText = 37,
	TurretAI = 38,
	TurretController = 39,
	Rotator = 40,
	DamageMultiplier = 41,
	FighterDodge = 42,
	ShotIntersection = 43,
	TorpedoLauncher = 44,
	EnergySystem = 45,
	Shield = 46,
	LifeSupport = 47,
	Engine = 48,
	Thrusters = 49,
	HyperspaceEngine = 50,
	Radar = 51,
	Scanners = 52,
	Gyros = 53,
	FlightAssist = 54,
	MineableMaterial = 55,
	LootPhysics = 56,
	CargoLoot = 57,
	MoneyLoot = 58,
	ResourceLoot = 59,
	TurretLoot = 60,
	SystemUpgradeLoot = 61,
	CrewLoot = 62,
	InventoryItemLoot = 63,
	Turret = 64,
	LocalPositioner = 65,
	Weapons = 66,
	ParentEntity = 67,
	RecoilApplyer = 68,
	WormHole = 69,
	DeletionTimer = 70,
	LootAttractor = 71,
	HitFeedbackSender = 72,
	Boarding = 73,
	PlanMesh = 74,
	TurretMesh = 75,
	ShieldMesh = 76,
	WeaponMesh = 77,
	BlockExplosions = 78,
	TurretExplosions = 79,
	LootCollectionSound = 80,
	Rotation = 81,
	LootParticles = 82,
	PlanSparks = 83,
	WeaponSound = 84,
	EngineSound = 85,
	ScriptUI = 86,
	Tooltip = 87,
	Icon = 88,
	FlickerLights = 89,
	ClientNotifier = 90,
	HangarDoorMesh = 91,
	WeaponFireGlow = 92,
	ShieldAmbientSound = 93,
	PlacementSounds = 94,
	ScannerData = 95,
	ShadowMap = 96,
	EffectNotifier = 97,
	InstancingNotifier = 98,
	AmbientLightCache = 99,
	RemovedBlocksMesh = 100,
	InertiaDampenerBrightness = 101,
	TorpedoMeshBuilder = 102,
	CustomMesh = 103,
	CraftDecay = 104,
	ShipInfoUpdater = 105,
	FactionNotifier = 106,
	WreckageCreator = 107,
	MoneyDropper = 108,
	ResourceDropper = 109,
	TurretDropper = 110,
	CargoDropper = 111,
	DroneDeleter = 112,
	LootCollector = 113,
	EntityTransferrer = 114,
	DamageContributors = 115,
	UnhappyCrewNotifier = 116,
	DestroyedItemReturner = 117,
	SystemUpgradeDropper = 118,
	CrewPayday = 119,
	Loot = 120,
	CrewBehaviour = 121,
	DeathLocationMarker = 122,
	CrewEjector = 123,
	TorpedoImpact = 124,
	PlayerNotifier = 125,
	DockingParent = 126,
	DummyComponent0 = 127,
	DummyComponent1 = 128,
	DummyComponent2 = 129,
	DummyComponent3 = 130,
	DummyComponent4 = 131,
	DummyComponent5 = 132
}

--- @class ControlAction @Enum
ControlAction = {
	None = 0,
	TurnUp = 1,
	TurnDown = 2,
	TurnRight = 3,
	TurnLeft = 4,
	StrafeUp = 5,
	StrafeDown = 6,
	StrafeLeft = 7,
	StrafeRight = 8,
	RollRight = 9,
	RollLeft = 10,
	Accelerate = 11,
	Brake = 12,
	ToggleVelocity = 13,
	Fire1 = 14,
	Fire2 = 15,
	FireTorpedoes = 16,
	SelectAllWeapons = 17,
	SelectWeapons1 = 18,
	SelectWeapons2 = 19,
	SelectWeapons3 = 20,
	SelectWeapons4 = 21,
	SelectWeapons5 = 22,
	SelectWeapons6 = 23,
	SelectWeapons7 = 24,
	SelectWeapons8 = 25,
	SelectWeapons9 = 26,
	NextTarget = 27,
	SelectTarget = 28,
	NearestEnemy = 29,
	NextAlly = 30,
	ReleaseMouse = 31,
	ShowServerInfo = 32,
	FreeLook = 33,
	MoveCamera = 34,
	ResetCamera = 35,
	CameraForward = 36,
	CameraBackward = 37,
	CameraLeft = 38,
	CameraRight = 39,
	ToggleFreeCamera = 40,
	DisplaceCamera = 41,
	JumpOrBoost = 42,
	BuildingMode = 43,
	TransferPlayer = 44,
	PauseMenu = 45,
	Interact = 46,
	ShowMap = 47,
	ShowPlayerMenu = 48,
	ShowShipMenu = 49,
	ShowChatWindow = 50,
	ShowMailWindow = 51,
	DebugScript = 52,
	ToggleStrategyMode = 53,
	PauseGame = 54,
	AcceptHail = 55,
	RejectHail = 56,
	DockObject = 57,
	UndockAll = 58,
	StopAutoPilot = 59,
	SwapControls = 60,
	ShowScriptConsole = 61,
	QuickAccess0 = 62,
	QuickAccess1 = 63,
	QuickAccess2 = 64,
	QuickAccess3 = 65,
	QuickAccess4 = 66,
	QuickAccess5 = 67,
	QuickAccess6 = 68,
	QuickAccess7 = 69,
	QuickAccess8 = 70,
	QuickAccess9 = 71,
	ScaleBlock = 72,
	ScaleBlockLinear = 73,
	ScaleBlockX = 74,
	ScaleBlockY = 75,
	ScaleBlockZ = 76,
	RotateBlocks = 77,
	DeleteBlock = 78,
	ColorMode = 79,
	ShowInventory = 80,
	FocusBlock = 81,
	MirrorX = 82,
	MirrorY = 83,
	MirrorZ = 84,
	BlockMode = 85,
	TurretMode = 86,
	SavedDesigns = 87,
	TurretDesignMode = 88,
	MirrorPlaneX = 89,
	MirrorPlaneY = 90,
	MirrorPlaneZ = 91,
	ToggleEngines = 92,
	ToggleFlightAssist = 93,
	ToggleGyros = 94,
	ToggleHyperspaceEngine = 95,
	ToggleLifeSupport = 96,
	ToggleShield = 97,
	ToggleStructuralIntegrity = 98,
	ToggleThrusters = 99,
	SelectSquad1 = 100,
	SelectSquad2 = 101,
	SelectSquad3 = 102,
	SelectSquad4 = 103,
	SelectSquad5 = 104,
	SelectSquad6 = 105,
	SelectSquad7 = 106,
	SelectSquad8 = 107,
	SelectSquad9 = 108,
	SelectSquad10 = 109,
	SquadAttack = 110,
	SquadDefend = 111,
	SquadReturn = 112,
	SquadCollect = 113,
	SquadHarvest = 114,
	AttackOrder = 115,
	GuardOrder = 116,
	PatrolOrder = 117,
	AggressiveOrder = 118,
	MineOrder = 119,
	SalvageOrder = 120,
	StopOrder = 121
}

--- @class ControlActionBit @Enum
ControlActionBit = {
	Up = 0,
	Down = 1,
	Left = 2,
	Right = 3,
	RollLeft = 4,
	RollRight = 5,
	Fire1 = 6,
	Fire2 = 7,
	Boost = 8,
	StrafeLeft = 9,
	StrafeRight = 10,
	StrafeUp = 11,
	StrafeDown = 12,
	Torpedoes = 13,
	Drift = 14
}

--- @class ControlStyle @Enum
ControlStyle = {
	MouseSteering = 0,
	KeyboardSteering = 1
}

--- @class CoolingType @Enum
CoolingType = {
	Standard = 0,
	EnergyPerShot = 1,
	EnergyContinuous = 2,
	BatteryCharge = 3
}

--- @class CraftStatsOverviewStat @Enum
CraftStatsOverviewStat = {
	Hull = 0,
	Shield = 1,
	Mass = 2,
	Volume = 3,
	Size = 4,
	SizeX = 5,
	SizeY = 6,
	SizeZ = 7,
	Blocks = 8,
	MainThrust = 9,
	BrakeThrust = 10,
	MaxVelocity = 11,
	YawSpeed = 12,
	PitchSpeed = 13,
	RollSpeed = 14,
	HyperspaceEnergy = 15,
	HyperspaceCooldown = 16,
	HyperspaceRange = 17,
	RadarReach = 18,
	SubsystemSockets = 19,
	ProcessingPower = 20,
	CargoHold = 21,
	CurrentCrew = 22,
	CrewCapacities = 23,
	RequiredEnergy = 24,
	ProducedEnergy = 25,
	StorableEnergy = 26,
	FirePower = 27,
	OccupiedHangarSpace = 28,
	HangarSpace = 29,
	SmallFighters = 30,
	MediumFighters = 31,
	LargeFighters = 32,
	ProductionCapacity = 33,
	Productions = 34,
	TorpedoSpace = 35,
	DockingPositions = 36,
	CloningCapacity = 37,
	AcademyCapacity = 38,
	Gunners = 39,
	Miners = 40,
	Engineers = 41,
	Repairers = 42,
	Pilots = 43,
	GunnersRequired = 44,
	MinersRequired = 45,
	EngineersRequired = 46,
	RepairersRequired = 47,
	PilotsRequired = 48,
	CrewCosts = 49,
	FreeArbitraryTurretSlots = 50,
	OccupiedArmedSlots = 51,
	OccupiedUnarmedSlots = 52,
	OccupiedPointDefenseSlots = 53,
	ArmedTurretSlots = 54,
	UnarmedTurretSlots = 55,
	PointDefenseTurretSlots = 56,
	ArbitraryTurretSlots = 57,
	ArmedTurretsInArbitrarySlots = 58,
	UnarmedTurretsInArbitrarySlots = 59,
	PointDefenseTurretsInArbitrarySlots = 60
}

--- @class CrewProfessionType @Enum
CrewProfessionType = {
	None = 0,
	Engine = 1,
	Gunner = 2,
	Miner = 3,
	Repair = 4,
	Pilot = 5,
	Security = 6,
	Attacker = 7,
	Number = 8
}

--- @class CrewRank @Enum
CrewRank = {
	None = 0,
	Sergeant = 1,
	Lieutenant = 2,
	Colonel = 3
}

--- @class DamageSource @Enum
DamageSource = {
	Energy = 0,
	Collision = 1,
	Decay = 2,
	Arbitrary = 3,
	Torpedo = 4,
	Invalid = 5
}

--- @class DamageType @Enum
DamageType = {
	Physical = 0,
	Energy = 1,
	AntiMatter = 2,
	Electric = 3,
	Plasma = 4,
	Fragments = 5,
	None = 6
}

--- @class DeletionType @Enum
DeletionType = {
	Default = 0,
	Jumped = 1,
	Destroyed = 2
}

--- @class Difficulty @Enum
Difficulty = {
	Lowest = 0,
	Beginner = 1,
	Easy = 2,
	Normal = 3,
	Veteran = 4,
	Expert = 5,
	Hardcore = 6,
	Insane = 7,
	Highest = 8
}

--- @class EntityArrivalType @Enum
EntityArrivalType = {
	Default = 0,
	GateOrWormhole = 1,
	Jump = 2
}

--- @class EntityType @Enum
EntityType = {
	None = 0,
	Ship = 1,
	Drone = 2,
	Station = 3,
	Turret = 4,
	Asteroid = 5,
	Wreckage = 6,
	Anomaly = 7,
	Loot = 8,
	WormHole = 9,
	Torpedo = 10,
	Fighter = 11,
	Container = 12,
	Unknown = 13,
	Other = 14
}

--- @class FighterOrders @Enum
FighterOrders = {
	Attack = 0,
	Defend = 1,
	Return = 2,
	Harvest = 3,
	FlyToLocation = 4,
	Board = 5
}

--- @class FighterStartError @Enum
FighterStartError = {
	NoError = 0,
	NoHangar = 1,
	SquadNotFound = 2,
	SquadEmpty = 3,
	NoStartPosition = 4,
	MaximumFightersStarted = 5,
	FighterNotFound = 6,
	NoPilots = 7,
	NoCrew = 8,
	NoFighterFound = 9,
	WrongFighterType = 10,
	InvalidTarget = 11,
	TargetDurabilityTooHigh = 12,
	SquadNotSupported = 13,
	Other = 14
}

--- @class FighterType @Enum
FighterType = {
	Invalid = 0,
	Fighter = 1,
	CrewShuttle = 2
}

--- @class FontType @Enum
FontType = {
	Normal = 0,
	SciFi = 1
}

--- @class ImpactParticles @Enum
ImpactParticles = {
	None = 0,
	Physical = 1,
	Energy = 2,
	Explosion = 3,
	DustExplosion = 4
}

--- @class InventoryItemType @Enum
InventoryItemType = {
	Turret = 0,
	TurretTemplate = 1,
	SystemUpgrade = 2,
	VanillaItem = 3,
	UsableItem = 4
}

--- @class JumpError @Enum
JumpError = {
	None = 0,
	HyperspaceCooldown = 1,
	OutOfReach = 2,
	WrongDirection = 3,
	Blocked = 4
}

--- @class KeyboardKey @Enum
KeyboardKey = {
	Unknown = 0,
	Return = 1,
	Escape = 2,
	Backspace = 3,
	Tab = 4,
	Space = 5,
	Exclaim = 6,
	QuoteDBL = 7,
	Hash = 8,
	Percent = 9,
	Dollar = 10,
	Apersand = 11,
	Quote = 12,
	LeftParen = 13,
	RightParent = 14,
	Asterisk = 15,
	Plus = 16,
	Comma = 17,
	Minus = 18,
	Period = 19,
	Slash = 20,
	_0 = 21,
	_1 = 22,
	_2 = 23,
	_3 = 24,
	_4 = 25,
	_5 = 26,
	_6 = 27,
	_7 = 28,
	_8 = 29,
	_9 = 30,
	Colon = 31,
	Semicolon = 32,
	Less = 33,
	Equals = 34,
	Greater = 35,
	Question = 36,
	At = 37,
	LeftBracket = 38,
	Backslash = 39,
	RightBrackent = 40,
	Caret = 41,
	Underscore = 42,
	BackQuote = 43,
	_A = 44,
	_B = 45,
	_C = 46,
	_D = 47,
	_E = 48,
	_F = 49,
	_G = 50,
	_H = 51,
	_I = 52,
	_J = 53,
	_K = 54,
	_L = 55,
	_M = 56,
	_N = 57,
	_O = 58,
	_P = 59,
	_Q = 60,
	_R = 61,
	_S = 62,
	_T = 63,
	_U = 64,
	_V = 65,
	_W = 66,
	_X = 67,
	_Y = 68,
	_Z = 69,
	CapsLock = 70,
	F1 = 71,
	F2 = 72,
	F3 = 73,
	F4 = 74,
	F5 = 75,
	F6 = 76,
	F7 = 77,
	F8 = 78,
	F9 = 79,
	F10 = 80,
	F11 = 81,
	F12 = 82,
	PrintScreen = 83,
	ScrollLock = 84,
	Pause = 85,
	Insert = 86,
	Home = 87,
	PageUp = 88,
	Delete = 89,
	End = 90,
	PageDown = 91,
	Right = 92,
	Left = 93,
	Down = 94,
	Up = 95,
	NumlockClear = 96,
	KP_Divide = 97,
	KP_Multiply = 98,
	KP_Minus = 99,
	KP_Plus = 100,
	KP_Enter = 101,
	KP_1 = 102,
	KP_2 = 103,
	KP_3 = 104,
	KP_4 = 105,
	KP_5 = 106,
	KP_6 = 107,
	KP_7 = 108,
	KP_8 = 109,
	KP_9 = 110,
	KP_0 = 111,
	KP_Period = 112,
	Application = 113,
	Power = 114,
	KP_Equals = 115,
	F13 = 116,
	F14 = 117,
	F15 = 118,
	F16 = 119,
	F17 = 120,
	F18 = 121,
	F19 = 122,
	F20 = 123,
	F21 = 124,
	F22 = 125,
	F23 = 126,
	F24 = 127,
	Execute = 128,
	Help = 129,
	Menu = 130,
	Select = 131,
	Stop = 132,
	Again = 133,
	Undo = 134,
	Cut = 135,
	Copy = 136,
	Paste = 137,
	Find = 138,
	Mute = 139,
	VolumeUp = 140,
	VolumeDown = 141,
	KP_Comma = 142,
	KP_EqualsAs400 = 143,
	AltErase = 144,
	SysReq = 145,
	Cancel = 146,
	Clear = 147,
	Prior = 148,
	Return2 = 149,
	Separator = 150,
	Out = 151,
	Oper = 152,
	ClearAgain = 153,
	Crsel = 154,
	Exsel = 155,
	ThousandsSeparator = 156,
	DecimalSeparator = 157,
	CurrencyUnit = 158,
	CurrencySubUnit = 159,
	KP_00 = 160,
	KP_000 = 161,
	KP_LeftParen = 162,
	KP_RightParen = 163,
	KP_LeftBrace = 164,
	KP_RightBrace = 165,
	KP_Tab = 166,
	KP_Backspace = 167,
	KP_A = 168,
	KP_B = 169,
	KP_C = 170,
	KP_D = 171,
	KP_E = 172,
	KP_F = 173,
	KP_Xor = 174,
	KP_Power = 175,
	KP_Percent = 176,
	KP_Less = 177,
	KP_Greater = 178,
	KP_Ampersand = 179,
	KP_DblAmpersand = 180,
	KP_VerticalBar = 181,
	KP_DlbVerticalBar = 182,
	KP_Colon = 183,
	KP_Hash = 184,
	KP_Space = 185,
	KP_At = 186,
	KP_Exclam = 187,
	KP_Memstore = 188,
	KP_Memrecall = 189,
	KP_Memclear = 190,
	KP_Memadd = 191,
	KP_Memsubtract = 192,
	KP_Memmultiply = 193,
	KP_Memdivide = 194,
	KP_PlusMinus = 195,
	KP_Clear = 196,
	KP_ClearEntry = 197,
	KP_Binary = 198,
	KP_Octal = 199,
	KP_Decimal = 200,
	KP_Hexadecimal = 201,
	LControl = 202,
	LShift = 203,
	LAlt = 204,
	LGui = 205,
	RControl = 206,
	RShift = 207,
	RAlt = 208,
	RGui = 209,
	Mode = 210,
	AudioNext = 211,
	AudioPrev = 212,
	AudioStop = 213,
	AudioPlay = 214,
	AudioMute = 215,
	MediaSelect = 216,
	Www = 217,
	Mail = 218,
	Calculator = 219,
	Computer = 220,
	AC_Search = 221,
	AC_Home = 222,
	AC_Back = 223,
	AC_Forward = 224,
	AC_Stop = 225,
	AC_Refresh = 226,
	AC_Bookmarks = 227,
	BrightnessDown = 228,
	BrightnessUp = 229,
	DisplaySwitch = 230,
	KbdIllumToggle = 231,
	KbdIllumDown = 232,
	KbdIllumUp = 233,
	Eject = 234,
	Sleep = 235
}

--- @class ListBoxEntryType @Enum
ListBoxEntryType = {
	Icon = 0,
	Text = 1,
	CheckBox = 2,
	PixelIcon = 3,
	Texture = 4
}

--- @class MalusReason @Enum
MalusReason = {
	None = 0,
	Reconstruction = 1,
	Boarding = 2
}

--- @class MaterialType @Enum
MaterialType = {
	Iron = 0,
	Titanium = 1,
	Naonite = 2,
	Trinium = 3,
	Xanion = 4,
	Ogonite = 5,
	Avorion = 6
}

--- @class MoonType @Enum
MoonType = {
	Rocky = 0,
	Smooth = 1,
	Moon = 2,
	Volcanic = 3,
	NumMoonTypes = 4
}

--- @class MouseButton @Enum
MouseButton = {
	Left = 0,
	Middle = 1,
	Right = 2,
	M4 = 3,
	M5 = 4,
	M6 = 5,
	M7 = 6,
	M8 = 7,
	M9 = 8,
	M10 = 9
}

--- @class PlanetType @Enum
PlanetType = {
	Terrestrial = 0,
	Rocky = 1,
	GasGiant = 2,
	Smooth = 3,
	Moon = 4,
	Volcanic = 5,
	BlackHole = 6,
	NumPlanetTypes = 7
}

--- @class PlayerStateType @Enum
PlayerStateType = {
	Fly = 0,
	BuildCraft = 1,
	BuildTurret = 2,
	Strategy = 3
}

--- @class ProjectileShape @Enum
ProjectileShape = {
	Default = 0,
	Plasma = 1,
	Rocket = 2
}

--- @class RarityType @Enum
RarityType = {
	Petty = 0,
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Exceptional = 4,
	Exotic = 5,
	Legendary = 6
}

--- @class RelationStatus @Enum
RelationStatus = {
	War = 0,
	Ceasefire = 1,
	Neutral = 2,
	Allies = 3
}

--- @class SavedDesignType @Enum
SavedDesignType = {
	Unknown = 0,
	CraftDesign = 1,
	TurretDesign = 2,
	Plan = 3
}

--- @class ScenarioType @Enum
ScenarioType = {
	Creative = 0,
	Normal = 1,
	Classic = 2
}

--- @class SectorChangeType @Enum
SectorChangeType = {
	Gate = 0,
	Wormhole = 1,
	Jump = 2,
	Forced = 3,
	Switch = 4,
	Login = 5,
	Logout = 6
}

--- @class ShipAvailability @Enum
ShipAvailability = {
	Available = 0,
	Destroyed = 1,
	InBackground = 2
}

--- @class SoundType @Enum
SoundType = {
	Weapon = 0,
	UI = 1,
	Other = 2
}

--- @class StatsBonuses @Enum
StatsBonuses = {
	RadarReach = 0,
	HiddenSectorRadarReach = 1,
	ScannerReach = 2,
	ScannerMaterialReach = 3,
	HyperspaceReach = 4,
	HyperspaceCooldown = 5,
	HyperspaceChargeEnergy = 6,
	ShieldDurability = 7,
	ShieldRecharge = 8,
	ShieldTimeUntilRechargeAfterHit = 9,
	ShieldTimeUntilRechargeAfterDepletion = 10,
	ShieldImpenetrable = 11,
	Velocity = 12,
	Acceleration = 13,
	GeneratedEnergy = 14,
	EnergyCapacity = 15,
	BatteryRecharge = 16,
	ArbitraryTurrets = 17,
	UnarmedTurrets = 18,
	ArmedTurrets = 19,
	PointDefenseTurrets = 20,
	AutomaticTurrets = 21,
	CargoHold = 22,
	LootCollectionRange = 23,
	TransporterRange = 24,
	DefenseWeapons = 25,
	FighterCargoPickup = 26,
	ExcessProcessingPowerSteps = 27,
	ProductionCapacity = 28,
	MinersPerTurret = 29,
	GunnersPerTurret = 30,
	MechanicsPerTurret = 31,
	Engineers = 32,
	Mechanics = 33,
	Gunners = 34,
	Miners = 35,
	Security = 36,
	Attackers = 37,
	Pilots = 38,
	FighterSquads = 39,
	FireRate = 40
}

--- @class TargetIndicatorVisuals @Enum
TargetIndicatorVisuals = {
	Default = 0,
	Tilted = 1,
	Small = 2
}

--- @class TransformationFeature @Enum
TransformationFeature = {
	SingleRotationX = 0,
	SingleRotationY = 1,
	SingleRotationZ = 2,
	MirrorX = 3,
	MirrorY = 4,
	MirrorZ = 5,
	DoubleRotationX = 6,
	DoubleRotationY = 7,
	DoubleRotationZ = 8
}

--- @class TurretAutoFireMode @Enum
TurretAutoFireMode = {
	Never = 0,
	Always = 1,
	AttackTarget = 2,
	Defensive = 3,
	Idle = 4
}

--- @class TurretSlotType @Enum
TurretSlotType = {
	Unspecified = 0,
	Armed = 1,
	Unarmed = 2,
	PointDefense = 3
}

--- @class WeaponAppearance @Enum
WeaponAppearance = {
	Invisible = 0,
	ChainGun = 1,
	Laser = 2,
	MiningLaser = 3,
	PlasmaGun = 4,
	RocketLauncher = 5,
	Cannon = 6,
	RailGun = 7,
	Repair = 8,
	Bolter = 9,
	Tesla = 10,
	PulseCannon = 11,
	AntiFighter = 12
}

--- @class WeaponCategory @Enum
WeaponCategory = {
	Armed = 0,
	Mining = 1,
	Salvaging = 2,
	Heal = 3,
	None = 4
}

---@return EntityDescriptor
function AsteroidDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function CargoLootDescriptor()
	return EntityDescriptor
end

---@param a number
---@param r number
---@param g number
---@param b number
---@return Color
function ColorARGB(a, r, g, b)
	return Color
end

---@param h number
---@param s number
---@param v number
---@return Color
function ColorHSV(h, s, v)
	return Color
end

---@param i number
---@return Color
function ColorInt(i)
	return Color
end

---@return table<number, Color>
function ColorPalette()
	return {Color}
end

---@param r number
---@param g number
---@param b number
---@return Color
function ColorRGB(r, g, b)
	return Color
end

---@param turret Entity
---@return TurretTemplate
function CreateTemplateFromTurret(turret)
	return TurretTemplate
end

---@return EntityDescriptor
function CrewLootDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function DroneDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function FighterDescriptor()
	return EntityDescriptor
end

---@return Seed
function GameSeed()
	return Seed
end

---@return Version
function GameVersion()
	return Version
end

---@param style PlanStyle
---@param seed Seed
---@param volume number
---@param maxBlocks number
---@param scaleToFit any
---@param material Material
---@return BlockPlan
function GeneratePlanFromStyle(style, seed, volume, maxBlocks, scaleToFit, material)
	return BlockPlan
end

---@param singular string @The english string
---@return string @The translated string, or, if no translation exists, the english string, with comment removed
function GetLocalizedString(singular)
	return ""
end

---@return Rarity
function HighestRarity()
	return Rarity
end

---@return EntityDescriptor
function InventoryItemLootDescriptor()
	return EntityDescriptor
end

---@param i number
---@return boolean
function IsValidMaterial(i)
	return true
end

---@param file string
---@return BlockPlan
function LoadPlanFromFile(file)
	return BlockPlan
end

---@param content string
---@return BlockPlan
function LoadPlanFromString(content)
	return BlockPlan
end

---@param path string
---@return TurretDesign
function LoadTurretDesignFromFile(path)
	return TurretDesign
end

---@return Rarity
function LowestRarity()
	return Rarity
end

---@param look vec3
---@param up vec3
---@return Matrix
function MatrixLookUp(look, up)
	return Matrix
end

---@param look vec3
---@param up vec3
---@param pos vec3
---@return Matrix
function MatrixLookUpPosition(look, up, pos)
	return Matrix
end

---@param look vec3
---@param up vec3
---@param right vec3
---@return Matrix
function MatrixLookUpRight(look, up, right)
	return Matrix
end

---@param yaw number
---@param pitch number
---@param roll number
---@return Matrix
function MatrixYawPitchRoll(yaw, pitch, roll)
	return Matrix
end

--- Returns a table containing all mods that are currently active. Order is the load order of the mods.
---@return table<number, table_t> @table containing all mods
function Mods()
	return {table_t}
end

---@return EntityDescriptor
function MoneyLootDescriptor()
	return EntityDescriptor
end

---@return number
function NumMaterials()
	return 0
end

---@return EntityDescriptor
function ResourceLootDescriptor()
	return EntityDescriptor
end

---@param x number
---@param y number
---@return Seed
function SectorSeed(x, y)
	return Seed
end

---@param str string
---@return Seed
function SeedStr(str)
	return Seed
end

---@return EntityDescriptor
function ShipDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function StationDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function SystemUpgradeLootDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function TorpedoDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function TurretDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function TurretLootDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function WormholeDescriptor()
	return EntityDescriptor
end

---@return EntityDescriptor
function WreckageDescriptor()
	return EntityDescriptor
end

--- This function is only available on the client.
---@param type string
---@param Uuid Uuid
---@param text string
---@param icon string
---@param color any
---@param withHighlight any
---@return any @nothing
function addShipProblem(type, Uuid, text, icon, color, withHighlight)
	return nil
end

--- Returns the system time in seconds. Since lua doesn't support clocks that are accurate down to milliseconds.
---@return number @The system time in seconds
function appTime()
	return 0.0
end

--- Returns the system time in milliseconds. Since lua doesn't support clocks that are accurate down to milliseconds.
---@return number @The system time in milliseconds
function appTimeMs()
	return 0.0
end

---@param callbackFunction string
---@param code string
---@param arguments table<number, any>
---@return any @nothing
function async(callbackFunction, code, arguments)
	return nil
end

--- Starts an asynchronous call that will be executed in a separate thread. Once finished, the given callback function will be called with the values returned by the run() function, which is required to be in the code to run. During the running of this function, only server, galaxy, players and factions can be accessed, other objects like sector and entities can't be accessed. The amount of threads in the thread pool responsible for running these async calls can be configured in the server.ini file. This function is only available on the server.
---@param callbackFunction string @The function in the current script that will be called once the asynchronous execution is finished
---@param file string @The file that will be executed. Path must be in format "data/scripts/path/to/file.lua". Will also files added or extended by mods. The file must contain a function run(...). The run() function will be given the arguments that are passed after this parameter. @The arguments that will be passed to the run() function
---@param arguments table<number, any>
---@return any @nothing
function asyncf(callbackFunction, file, arguments)
	return nil
end

--- Invokes a function on *all* remote clients, in the client instances of the caller script. Return values of the remotely executed functions cannot be retrieved. This function is only available on the server.
---@param functionName string @The name of the scripting function that is to be executed
---@param arguments table<number, any> @An arbitrary number of arguments that will be given to the remote function
---@return any @nothing
function broadcastInvokeClientFunction(functionName, arguments)
	return nil
end

--- Calculates a jump path on the galaxy map. ATTENTION: this might take a while, depending on the distance and rifts This function is only available on the server.
---@param player nil | Player @The player whose knowledge of gates is used (or nil)
---@param alliance nil | Alliance @The alliance whose knowledge of gates is used (or nil)
---@param origin vec2 @The origin of the calculation
---@param destination vec2 @The desired target (may lie in a rift)
---@param jumpRange number @How far the ship can jump
---@param canPassRifts boolean @true if the ship can jump across rifts, false otherwise
---@return table_t
function calculateJumpPath(player, alliance, origin, destination, jumpRange, canPassRifts)
	return table_t
end

---@param ship Entity
---@return boolean,any
function canBoard(ship)
	return true,nil
end

--- Checks if, everything considered, advanced blocks can be built on a ship in its current situation.
---@param ship Entity @The ship that should be modified
---@return boolean @A bool holding the result
function canBuildAdvancedBlocksInCurrentEnvironment(ship)
	return true
end

--- Checks if, everything considered, a ship can be modified by building in its current situation.
---@param ship Entity @The ship that should be modified
---@return gutBuildError @a BuildError enum value holding the result
function canBuildInCurrentEnvironment(ship)
	return gutBuildError
end

--- Checks if, everything considered, a ship can be repaired in its current situation.
---@param ship Entity @The ship that should be repaired
---@return gutBuildError @a BuildError enum value holding the result
function canRepairInCurrentEnvironment(ship)
	return gutBuildError
end

---@return boolean
function checkReadSecureFilename(string)
	return true
end

---@return boolean
function checkWriteSecureFilename(string)
	return true
end

--- Copies the given Object
---@param value any @A non-POD, non-table object
---@return UserObject @A true copy of the given object
function copy(value)
	return UserObject
end

--- Creates a new directory, including all required parent directories. Security-specific behavior: Creating directories is only possible in the moddata/ subdirectory of the Avorion settings folder.
---@param directory string @Path to the directory to create
---@return any @A system error code indicating if the operation was successful
function createDirectory(directory)
	return nil
end

--- Inserts dots into a large number to create an easily human readable money string. Example: 10000000 will become 10.000.000
---@param number number @The large number
---@return string @A string containing the readable number
function createMonetaryString(number)
	return ""
end

---@return string
function credits()
	return ""
end

--- Calculates the dot product between two vec3s. The vectors must have the same underlying type (double or float).
---@param a any @vector a
---@param b any @vector b
---@return any @The cross product of the vectors
function cross(a, b)
	return nil
end

--- Registers a deferred callback in the script. The given function will be executed after the given time. Depending on the tick rate of the simulation, the callback might get called slightly later than the given time. The callback will never happen before the given time hasn't passed.
---@param time number @The time in seconds to wait until the callback will be executed
---@param _function string @The function that is to be executed once the time has passed as a string
---@param args table<number, any>
---@return boolean @true if the callback was registered, false otherwise
function deferredCallback(time, _function, args)
	return true
end

--- Deletes a file. Error codes behave the same way as rmdir(). Security-specific behavior: Removing files is only possible in the moddata/ subdirectory of the Avorion settings folder.
---@param file string @Path to the file to delete
---@return any @A system error code indicating if the operation was successful
function deleteFile(file)
	return nil
end

--- This function displays a chat message on the Chat window of the client. This function is only available on the client.
---@param message string @The message that will be displayed in the chat window
---@param sender string @The sender that will be displayed for the chat message
---@param type number @The type of chat message, 0 = Normal, 1 = Error, 2 = Warning, 3 = Info
---@return any @nothing
function displayChatMessage(message, sender, type)
	return nil
end

--- This function is only available on the client.
---@param bigText string
---@param smallText string
---@return any @nothing
function displayMissionAccomplishedText(bigText, smallText)
	return nil
end

--- This function displays a speech bubble next to the given entity. If text is too long then it will be shortened and a "..." will be added. This function is only available on the client.
---@param entity Entity @The entity next to which the speech bubble should appear
---@param text string @The text that will be displayed in the speech bubble
---@return any @nothing
function displaySpeechBubble(entity, text)
	return nil
end

--- Calculates the linear distance between two vectors. The vectors must have the same type.
---@param a any @vector a
---@param b any @vector b
---@return any @The linear distance between the vectors
function distance(a, b)
	return nil
end

--- Calculates the squared linear distance between two vectors. The vectors must have the same type.
---@param a any @vector a
---@param b any @vector b
---@return any @The squared linear distance between the vectors
function distance2(a, b)
	return nil
end

--- Calculates the dot product between 2 vectors. The vectors must have the same type.
---@param a any @vector a
---@param b any @vector b
---@return any @The dot product between the two vectors
function dot(a, b)
	return nil
end

--- Draw a border. This function should only be called in valid rendering steps. This function is expensive, don't overuse it. This function is only available on the client.
---@param rect Rect @The rect that is to be drawn
---@param color Color @The color of the rect
---@return any @nothing
function drawBorder(rect, color)
	return nil
end

--- This function is only available on the client.
---@param box Box
---@param matrix Matrix
---@param color Color
---@return any @nothing
function drawDebugBox(box, matrix, color)
	return nil
end

--- This function is only available on the client.
---@param a vec3
---@param b vec3
---@param color Color
---@return any @nothing
function drawDebugLine(a, b, color)
	return nil
end

--- This function is only available on the client.
---@param sphere Sphere
---@param color Color
---@return any @nothing
function drawDebugSphere(sphere, color)
	return nil
end

--- This function is only available on the client.
---@param fighter FighterTemplate
---@return any @nothing
function drawFighterTooltip(fighter)
	return nil
end

--- Draw a rect. This function should only be called in valid rendering steps. This function is expensive, don't overuse it. This function is only available on the client.
---@param rect Rect @The rect that is to be drawn
---@param color Color @The color of the rect
---@return any @nothing
function drawRect(rect, color)
	return nil
end

--- Draw text. This function should only be called in valid rendering steps. This function is expensive, don't overuse it. This function is only available on the client.
---@param text string @The text that is to be rendered
---@param px number @The x value in pixels of the position, ie. upper left
---@param py number @The y value in pixels of the position, ie. upper left
---@param color Color @The color of the text
---@param size number @The font size of the rendered text
---@param bold number @Use 1 if the text should be bold, 0 otherwise
---@param italic number @Use 1 if the text should be italic, 0 otherwise
---@param style number @The style of the text, 0 is default style, 1 is shadowed, 2 is outlined
---@return any @nothing
function drawText(text, px, py, color, size, bold, italic, style)
	return nil
end

--- Draw text inside a rect. This function should only be called in valid rendering steps. This function is expensive, don't overuse it. This function is only available on the client.
---@param text string @The text that is to be rendered
---@param rect Rect @The rect that functions as boundaries for the text
---@param horizontalAlignment number @-1 to position the text at the left, 0 to center it horizontally, +1 to position the text at the right
---@param verticalAlignment number @-1 to position the text at the top, 0 to center it vertically, +1 to position the text at the bottom
---@param color Color @The color of the text, as an int
---@param size number @The font size of the rendered text
---@param bold number @Use 1 if the text should be bold, 0 otherwise
---@param italic number @Use 1 if the text should be italic, 0 otherwise
---@param style number @The style of the text, 0 is default style, 1 is shadowed, 2 is outlined
---@return any @nothing
function drawTextRect(text, rect, horizontalAlignment, verticalAlignment, color, size, bold, italic, style)
	return nil
end

--- This function is only available on the client.
---@param turret TurretTemplate
---@return any @nothing
function drawTurretTooltip(turret)
	return nil
end

--- Prints errors to the console. In the ingame console, server output will be printed in magenta, client output will be printed in darkish red.
---@param args table<number, any> @Any number of arguments. The first value can be a format string. If no formatting can be done then the function falls back to printing all given values.
---@return any @nothing
function eprint(args)
	return nil
end

--- Returns the current language code. This function is only available on the client.
---@return string @The language code, e.g. "en", "de", "ru", etc.
function getCurrentLanguage()
	return ""
end

--- Retrieves a global variable. These variables are shared over the entire process.
---@param name string @The name of the global variable
---@return any @The queried variable, or nil if non-existant
function getGlobal(name)
	return nil
end

---@return string
function getLanguage()
	return ""
end

---@return Entity
function getParentEntity()
	return Entity
end

--- This function is only available on the client.
---@return UserObject
function getParentFaction()
	return UserObject
end

--- This function is only available on the client.
---@return Entity
function getPlayerCraft()
	return Entity
end

--- Rounds a large number and adds a suffix such as k or M. For example, 10.000 will become 10k.
---@param number number @The number to make readable
---@return number,string @A string containing the rounded number and the suffix
function getReadableValue(number)
	return 0.0,""
end

--- This function is only available on the client.
---@return vec2
function getResolution()
	return vec2
end

--- This function is only available on the client.
---@return table<number, string>
function getSavedShips()
	return {""}
end

--- Returns the exact path of the top-level script file that this function is called from. If the script has been required by other scripts, it will return the path that was given to, for example, the function Entity():addScript(path, args...). This function can be used to determine the script path that has to be used by, for example, calls to Entity():invokeFunction(script, args...)
---@return string @A string containing the path to the top-level script file
function getScriptPath()
	return ""
end

--- This function is only available on the client.
---@return Uuid
function getSessionId()
	return 0
end

--- Get the script index of the currently tracked mission This function is only available on the client.
---@return any @The int index of the tracked mission script or nil
function getTrackedMissionScriptIndex()
	return nil
end

--- This function is only available on the client.
---@return table<number, string>
function getWorkshopShips()
	return {""}
end

--- Invokes a function on the server on the alliance of the player, during its update step. Return values of the remotely executed function cannot be retrieved. The player must be in an alliance for this call to succeed. Due to technical, multithreading-related restrictions, there is no way to check at the time of the call, if the target script or function exists in the sector. If it doesn't this call will silently fail. This function is only available on the client.
---@param scriptName string @The name of the called script
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function.
---@return any @nothing
function invokeAllianceFunction(scriptName, functionName, arguments)
	return nil
end

--- Invokes a function on a remote client, in the client instance of the caller script. Example usage would be a server Resource Trader calling the setData() function of its client instance. Return values of the remotely executed functions cannot be retrieved. This function is only available on the server.
---@param player Player @The player of the client the function should be invoked on
---@param functionName string @The name of the scripting function that is to be executed
---@param arguments table<number, any> @An arbitrary number of arguments that will be given to the remote function
---@return any @nothing
function invokeClientFunction(player, functionName, arguments)
	return nil
end

--- Invokes a function of a script on an entity in an arbitrary sector, during its update step. Use this function to call functions on entities that are in other sectors than the current script. The sector must be loaded in memory in order for this call to succeed. It will not be loaded from disk or generated. The function will not be run immediately, but it might take up to one update tick until it is run. Therefore, return values of the executed functions will not be retrieved. Due to technical, multithreading-related restrictions, there is no way to check at the time of the call, if the target entity or the script or the script function exists in the sector. If it doesn't this call will silently fail. To get an error message printed out on failure as to why it failed, pass 'true' to the 'printErrors' parameter.  Example invocations:  invokeEntityFunction(x, y, dbgBool, {faction = player.index, name = "The Executor"}, "myscript.lua", "myfunction", arg1, arg2, arg3)  invokeEntityFunction(x, y, dbgBool, craftId, "myscript.lua", "myfunction", arg1, arg2, arg3)  invokeEntityFunction(x, y, dbgBool, "3d477214-4b7d-4fd0-9114-18b8cafa5a91", "myscript.lua", "myfunction", arg1, arg2, arg3) This function is only available on the server.
---@param x number @The x-coordinate of the target sector
---@param y number @The y-coordinate of the target sector
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param entityId any @The Uuid of the entity whose script will be called. Can also be a uuid string. A table containing a faction index and craft name can also be passed, such as {faction = 1338, name = "MyAwesomeShip"}
---@param scriptName string @The name of the called script
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the sector wasn't loaded into memory, 0 otherwise.
function invokeEntityFunction(x, y, printErrors, entityId, scriptName, functionName, arguments)
	return 0
end

--- Invokes a function on a script of a player, during its sector's update step. Use this function to execute functions of scripts of a player that is in another sector than the one of the current script. The function will not be run immediately, but it might take up to one update tick until it is run. Therefore, return values of the executed functions will not be retrieved. Currently only invocations for logged-in players are supported. Due to technical, multithreading-related restrictions, there is no way to check at the time of the call, if the target script or function exists in the faction. If it doesn't this call will silently fail. To get an error message printed out on failure as to why it failed, pass 'true' to the 'printErrors' parameter.  This function is only available on the server.
---@param factionIndex number @The index of the targeted faction
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param scriptName string @The name of the called script
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the player wasn't logged in, 0 otherwise.
function invokeFactionFunction(factionIndex, printErrors, scriptName, functionName, arguments)
	return 0
end

--- Invokes a function on a script of a sector, during its update step. Use this function to call functions on sectors other than the sector of the current script. The sector must be loaded in memory in order for this call to succeed. It will not be loaded from disk or generated. The function will not be run immediately, but it might take up to one update tick until it is run. Therefore, return values of the executed functions will not be retrieved. Due to technical, multithreading-related restrictions, there is no way to check at the time of the call, if the target script or function exists in the sector. If it doesn't this call will silently fail. To get an error message printed out on failure as to why it failed, pass 'true' to the 'printErrors' parameter.  This function is only available on the server.
---@param x number @The x-coordinate of the target sector
---@param y number @The y-coordinate of the target sector
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param scriptName string @The name of the called script
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the sector wasn't loaded into memory, 0 otherwise.
function invokeSectorFunction(x, y, printErrors, scriptName, functionName, arguments)
	return 0
end

--- Invokes a function on the remote server, in the server instance of the caller script. Example usage would be a server Resource Trader calling the getData() function of its server instance. Return values of the remotely executed functions are not retrieved. On the server side, a variable called "callingPlayer" will be created or set before executing the called function. callingPlayer contains the index of the calling player. Use this variable to verify that the calling player is actually the player you'd expect. After the call finishes on the server, callingPlayer is set to nil. This function is only available on the client.
---@param functionName string @The name of the scripting function that is to be executed
---@param arguments table<number, any> @An arbitrary number of arguments that will be given to the remote function
---@return any @nothing
function invokeServerFunction(functionName, arguments)
	return nil
end

---@return boolean
function isAllianceScript()
	return true
end

--- returns true if the black market DLC is owned and installed according to local Steam This function is only available on the client.
---@return boolean
function isBlackMarketDLCInstalled()
	return true
end

---@return boolean
function isEntityScript()
	return true
end

--- This function is only available on the server.
---@return boolean
function isGalaxyScript()
	return true
end

---@return boolean
function isPlayerScript()
	return true
end

---@return boolean
function isSectorScript()
	return true
end

--- This function is only available on the client.
---@param scancode number
---@return number
function keycodeFromScancode(scancode)
	return 0
end

--- Calculates the length of a vector
---@param vec any @the vector
---@return any @The length of the vector
function length(vec)
	return nil
end

--- Calculates the squared length of a vector
---@param vec any @the vector
---@return any @The squared length of the vector
function length2(vec)
	return nil
end

--- Lists all files in a directory. Security-specific behavior: Listing files of directories is only possible in the moddata/ subdirectory of the Avorion settings folder.
---@param directory string @Path to the directory to remove
---@return table<number, string> @A list of files
function listFilesOfDirectory(directory)
	return {""}
end

---@param path string
---@return string
function loadInternalData(path)
	return ""
end

---@param eye vec3
---@param at vec3
---@param up vec3
---@return Matrix
function lookAt(eye, at, up)
	return Matrix
end

---@param x number
---@param y number
---@param seed number
---@return number
function makeFastHash(x, y, seed)
	return 0
end

---@param values table<number, any>
---@return number
function makeHash(values)
	return 0
end

---@param values table<number, any>
---@return number
function makeHash64(values)
	return 0.0
end

--- Normalizes a given vector. This function creates a new normalized vector, the given vector is not changed.
---@param vec any @the vector to normalize
---@return any @The normalized result of the given vector
function normalize(vec)
	return nil
end

--- Normalizes a given vector. This function normalizes the vector in place.
---@param vec any @the vector to normalize
---@return any
function normalize_ip(vec)
	return nil
end

--- This function is only available on the server.
---@return boolean
function onClient()
	return true
end

--- @callback
--- This callback is executed when a dialog closes. Callback is executed at the script that provided the dialog. No need to register for this callback, just declare the function "onDialogClosed".
function onDialogClosed()
end

--- A function to find out in a script, whether it's currently executed on the server. This function is only available on the client.
---@return boolean @true when called on the server, false otherwise
function onServer()
	return true
end

--- @callback
function onShowEncyclopediaArticle(id)
end

--- returns true if the player owns the black market DLC according to server This function is only available on the client.
---@return boolean
function ownsBlackMarketDLC()
	return true
end

---@param fov number
---@param aspect number
---@param nearClip number
---@param farClip number
---@return Matrix
function perspective(fov, aspect, nearClip, farClip)
	return Matrix
end

--- This function is only available on the client.
---@param soundName string
---@param type number
---@param position vec3
---@param radius number
---@param volume number
---@param entity nil | Entity
---@return any @nothing
function play3DSound(soundName, type, position, radius, volume, entity)
	return nil
end

--- This function is only available on the client.
---@param soundName string
---@param type number
---@param volume number
---@return any @nothing
function playSound(soundName, type, volume)
	return nil
end

---@param singular string @The english singular string, will be used directly and no numbers will be formatted into it
---@param plural string @The english plural string, may contain a ${i} variable that will be replaced by the number
---@param number number @The number that is to be displayed
---@return string
function plural_t(singular, plural, number)
	return ""
end

---@param singular string @The english singular string, will be used directly and no numbers will be formatted into it
---@param plural string @The english plural string, may contain a ${i} variable that will be replaced by the number
---@param context string @The context that is to be shown in the .po file
---@param number number @The number that is to be displayed
---@return string
function plural_with_context_t(singular, plural, context, number)
	return ""
end

--- Prints to the console. In the ingame console, server output will be printed in cyan, client output will be printed in grey.
---@param args table<number, any> @Any number of arguments. The first value can be a format string. If no formatting can be done then the function falls back to printing all given values.
---@return any @nothing
function print(args)
	return nil
end

--- Similar to print, but prints to the log file.
---@param args table<number, any> @Any number of arguments. The first value can be a format string. If no formatting can be done then the function falls back to printing all given values.
---@return any @nothing
function printlog(args)
	return nil
end

--- This function is only available on the client.
---@param p vec3
---@return vec3
function projectPoint(p)
	return vec3
end

--- This function is only available on the client.
---@param entityId Uuid
---@param healthColor any
---@param shieldColor any
---@param track any
---@param name any
---@return any @nothing
function registerBoss(entityId, healthColor, shieldColor, track, name)
	return nil
end

--- Removes an empty directory. Error codes behave the same way as rmdir(). Security-specific behavior: Removing directories is only possible in the moddata/ subdirectory of the Avorion settings folder.
---@param directory string @Path to the directory to remove
---@return any @A system error code indicating if the operation was successful
function removeDirectory(directory)
	return nil
end

--- This function is only available on the client.
---@param type string
---@param Uuid Uuid
---@return any @nothing
function removeShipProblem(type, Uuid)
	return nil
end

--- Sends an error report to avorion.net, including DebugInfo and StackTrace
---@param string string @containing the error that happened
---@return any @nothing
function reportError(string)
	return nil
end

---@param _in Matrix
---@param angle number
---@param axis vec3
---@return Matrix
function rotate(_in, angle, axis)
	return Matrix
end

--- Loads a script into a separate, temporary VM and runs a single function in it. The script will be run in the same context as the script calling this function. When the script has a namespace defined, only functions within that namespace can be called. The first return value is an int indicating if the call succeeded, followed by any return values of the invoked function. 0 = success, 1 = invalid script path, 2 = error during script loading, 3 = error during execution This function is only available on the server.
---@param script string @Name of the script to load
---@param func string @Name of the function to call
---@param params table<number, any> @Parameters that will be passed to the function
---@return table<number, any> @An int indicating if the call succeeded, followed by the return values of the called function
function run(script, func, params)
	return {nil}
end

--- Runs code in the context of an entity in a sector, during its update step. Use this function to execute arbitrary code in the context of entities that are in other sectors than the current script. The sector must be loaded in memory in order for this call to succeed. It will not be loaded from disk or generated. The code will not be run immediately, but it might take up to one update tick until it is run. Therefore, return values of the executed functions will not be retrieved. Due to technical, multithreading-related restrictions, there is no way to check at the time of the call, if the target entity exists in the sector. If it doesn't this call will silently fail. To get an error message printed out on failure as to why it failed, pass 'true' to the 'printErrors' parameter.  This function is only available on the server.
---@param x number @The x-coordinate of the target sector
---@param y number @The y-coordinate of the target sector
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param entityId any @The Uuid of the entity whose script will be called. Can also be a uuid string. A table containing a faction index and craft name can also be passed, such as {faction = 1338, name = "MyAwesomeShip"}
---@param code string @The code that will be run, must have at least one function defined that will be run
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the sector wasn't loaded into memory, 0 otherwise.
function runEntityCode(x, y, printErrors, entityId, code, functionName, arguments)
	return 0
end

--- Runs code in the context of a player, during its sector's update step. Use this function to execute code in the context of a player that is in another sector than the one of the current script. The code will not be run immediately, but it might take up to one update tick until it is run. Therefore, return values of the remotely executed functions will not be retrieved. Currently only invocations for logged-in players are supported. This function is only available on the server.
---@param factionIndex number @The index of the targeted faction
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param code string @The code that will be run, must have at least one function defined that will be run
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the player wasn't logged in, 0 otherwise.
function runFactionCode(factionIndex, printErrors, code, functionName, arguments)
	return 0
end

--- Runs code in the context of a sector, during its update step. Use this function to execute code in the context of sectors other than the sector of the current script. The sector must be loaded in memory in order for this call to succeed. It will not be loaded from disk or generated. The code will not be run immediately, but it might take up to one update tick until it is run. Therefore, no return values of any executed functions will be retrieved. This function is only available on the server.
---@param x number @The x-coordinate of the target sector
---@param y number @The y-coordinate of the target sector
---@param printErrors boolean @A bool indicating whether or not an error message should be printed on failure
---@param code string @The code that will be run, must have at least one function defined that will be run
---@param functionName string @The name of the called function
---@param arguments table<number, any> @The arguments that will be passed to the function
---@return number @1 if the sector wasn't loaded into memory, 0 otherwise.
function runSectorCode(x, y, printErrors, code, functionName, arguments)
	return 0
end

---@param _in Matrix
---@param size vec3
---@return Matrix
function scale(_in, size)
	return Matrix
end

--- This function is only available on the client.
---@param key number
---@return number
function scancodeFromKeycode(key)
	return 0
end

--- Returns the path of the script that is currently being executed
---@return string @string containing the path
function scriptPath()
	return ""
end

--- This function is only available on the client.
---@param id Uuid
---@param name string
---@return any @nothing
function setBossBarTitle(id, name)
	return nil
end

--- This function is only available on the client.
---@param id Uuid
---@param health any
---@param maxHealth any
---@param shield any
---@param maxShield any
---@return any @nothing
function setBossHealth(id, health, maxHealth, shield, maxShield)
	return nil
end

--- This function is only available on the client.
---@param id Uuid
---@param health any
---@param shield any
---@return any @nothing
function setBossHealthColor(id, health, shield)
	return nil
end

--- Sets a global variable. These variables are shared over the entire process.
---@param name string @The name of the global variable
---@param value any @The value of the global variable. POD datatypes only. Nil deletes the variable.
---@return any @nothing
function setGlobal(name, value)
	return nil
end

--- This function is only available on the client.
---@return any @nothing
function setTrackThisMission()
	return nil
end

--- This function is only available on the client.
---@return any @nothing
function setTrackedMission(number)
	return nil
end

--- sleeps for the given time
---@param seconds number
---@return any @nothing
function sleep(seconds)
	return nil
end

--- Terminates the script. This function returns normally and the current function will run until finished, but no more following calls will be made to the script. The script will be removed from the entity on the next occasion.
---@return any @nothing
function terminate()
	return nil
end

---@param _in Matrix
---@param pos vec3
---@return Matrix
function translate(_in, pos)
	return Matrix
end

---@param _in string
---@return string
function trim(_in)
	return ""
end

--- This function is only available on the client.
---@param entityId Uuid
---@return any @nothing
function unregisterBoss(entityId)
	return nil
end

--- Checks if the given object is valid. Some objects can become invalid, for example when an entity is deleted the instances of the Entity in the scripts will become invalid.
---@param value any @A non-POD, non-table object
---@return boolean @A boolean indicating whether the object is valid. Returns false when given nil.
function valid(value)
	return true
end

--- Similar to print, but prints to the user trace stream. This trace stream can be enabled by passing "-t user" to the command line arguments of client or server.
---@param args table<number, any> @Any number of arguments. The first value can be a format string. If no formatting can be done then the function falls back to printing all given values.
---@return any @nothing
function writeTrace(args)
	return nil
end

