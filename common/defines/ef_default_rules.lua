NDefines.NPolitics.BASE_POLITICAL_POWER_INCREASE = 2.7

--Country
NDefines.NCountry.BASE_RESEARCH_SLOTS = 3                       -- Base number of research slots per country
NDefines.NCountry.STARTING_COMMAND_POWER = 10.0					-- starting command power for every country
NDefines.NCountry.BASE_MAX_COMMAND_POWER = 200                  -- base value for maximum command power
NDefines.NCountry.SCORCHED_EARTH_STATE_COST = 25                -- Vanilla 5 - pp cost to scorch a state

--Diplomacy
NDefines.NDiplomacy.BASE_TRUCE_PERIOD = 30                      -- Base truce period in days.
NDefines.NDiplomacy.BASE_SEND_ATTACHE_COST = 50                 -- Political power cost to send attache
NDefines.NGame.MESSAGE_TIMEOUT_DAYS = 30

--Career Profile
NDefines_CareerProfile.NCareerProfile.MOD_STATISTICS_GROUP = "Europe in Flames"
NDefines_CareerProfile.NCareerProfile.MOD_STATISTICS_GROUP_NAME = "Europe in Flames"

--Military
NDefines.NMilitary.MAX_ARMY_EXPERIENCE = 1000
NDefines.NMilitary.MAX_NAVY_EXPERIENCE = 1000
NDefines.NMilitary.MAX_AIR_EXPERIENCE = 1000
NDefines.NMilitary.BASE_DIVISION_BRIGADE_CHANGE_COST = 4 --Vanilla 5 - Base cost to change a regiment column.
NDefines.NMilitary.BASE_DIVISION_BRIGADE_GROUP_COST = 6 --Vanilla 20 - Base cost to unlock a regiment slot
NDefines.NMilitary.FIELD_MARSHAL_DIVISIONS_CAP = 32      --Vanilla 24 - how many divisions a field marshall is limited to
NDefines.NMilitary.PLAN_EXECUTE_CAREFUL_LIMIT = 10
NDefines.NMilitary.PLAN_PROVINCE_BASE_IMPORTANCE = 2.0
NDefines.NMilitary.PLAN_PROVINCE_LOW_VP_DEFENSE_IMPORTANCE = 4.0
NDefines.NMilitary.PLAN_PROVINCE_MEDIUM_VP_DEFENSE_IMPORTANCE = 6.0
NDefines.NMilitary.PLAN_PROVINCE_HIGH_VP_DEFENSE_IMPORTANCE = 20.0
NDefines.NMilitary.PLAN_PROVINCE_LOW_VP_IMPORTANCE_FRONT = 4.0
NDefines.NMilitary.PLAN_PROVINCE_MEDIUM_VP_IMPORTANCE_FRONT = 6.0
NDefines.NMilitary.PLAN_PROVINCE_HIGH_VP_IMPORTANCE_FRONT = 8.0
NDefines.NMilitary.PLAN_MAX_PROGRESS_TO_JOIN = 0.60
NDefines.NMilitary.PLAN_AREA_DEFENSE_FORT_IMPORTANCE = 0.35
NDefines.NMilitary.PLAN_AREA_DEFENSE_COASTAL_FORT_IMPORTANCE = 5.0
NDefines.NMilitary.PLAN_AREA_DEFENSE_COAST_NO_FORT_IMPORTANCE = 2.0
NDefines.NMilitary.PLAN_EXECUTE_CAREFUL_MAX_FORT = 4     --Vanilla 5 - If execution mode is set to careful units will not attack provinces with fort levels greater than or equal to this
NDefines.NMilitary.PLAN_BLITZ_OPTIMISM = 0.3             --Vanilla 0.2 - Additional combat balance value in favor of blitzing side when considering targets (not a combat bonus, just offsets planning)
NDefines.NMilitary.ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.1
NDefines.NMilitary.PLAN_STICKINESS_FACTOR = 95.0         --Vanilla 100 - Factor used in unitcontroller when prioritizing units for locations
NDefines.NMilitary.PLAN_STICKINESS_IGNORE_STACK_LIMIT = 1
NDefines.NMilitary.ATTRITION_EQUIPMENT_LOSS_CHANCE = 0.005
--NDefines.NMilitary.ATTRITION_EQUIPMENT_PER_TYPE_LOSS_CHANCE = 0.1
NDefines.NMilitary.MAX_DIVISION_SUPPORT_HEIGHT = 6
--18.10.2025
NDefines.NMilitary.PIERCING_THRESHOLDS = {	-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
		1.20,
		1.10,
		1.05,
		1.00,
		0.95,
		0.90,
		0.85,
		0.80,
		0.75,
		0.70,
		0.65,
		0.60,
		0.55,					
		0.50,
		0.00, --there isn't much point setting this higher than 0
}
NDefines.NMilitary.PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		1.20,
		1.10,
		1.05,
		1.00,
		0.95,
		0.90,
		0.85,
		0.80,
		0.75,
		0.70,
		0.65,
		0.60,
		0.55,					
		0.50,
		0.50,
}
NDefines.NMilitary.REINFORCEMENT_EQUIPMENT_DELIVERY_SPEED = 0.4
NDefines.NMilitary.REINFORCEMENT_MANPOWER_DELIVERY_SPEED = 13.0
NDefines.NMilitary.COHESION_IMMOBILE_PLANNING_SPEED_MULTIPLIER = 0.70	-- Vanilla 0.50 - If using the 'immobile' cohesion setting, factor ALL planning speed growth by this
NDefines.NMilitary.OUT_OF_SUPPLY_MORALE = -0.3                   -- max org regain reduction from supply
NDefines.NMilitary.WITHDRAWING_SPEED_FACTOR = 0.2

--Air
NDefines.NAir.AA_INDUSTRY_AIR_DAMAGE_FACTOR = -0.10 --Vanilla -0.12 - 5x levels = 50% defense from bombing
NDefines.NAir.AIR_WING_XP_LOSS_WHEN_KILLED = 250 --Vanilla 300
NDefines.NAir.AIR_WING_XP_LOSS_REDUCTION_OVER_FRIENDLY_TERRITORY_FACTOR = 0.5 --Vanilla 0.3
NDefines.NAir.COMBAT_DAMAGE_SCALE = 1.05 -- iyi olmus olmasi lazim 
NDefines.NAir.HOURS_DELAY_AFTER_EACH_COMBAT = 6 --Vanilla 4 - How many hours needs the wing to be ready for the next combat. Use for tweaking if combats happens too often. (generally used as double because of roundtrip)
NDefines.NAir.MISSION_COMMAND_POWER_COSTS = {  -- command power cost per plane to create a mission
	0.0, -- AIR_SUPERIORITY
	0.0, -- CAS
	0.0, -- INTERCEPTION
	0.0, -- STRATEGIC_BOMBER
	0.0, -- NAVAL_BOMBER
	0.0, -- DROP_NUKE
	0.0, -- PARADROP
	0.0, -- NAVAL_KAMIKAZE
    0.0, -- PORT_STRIKE
	0.0, -- ATTACK_LOGISTICS
	0.025, -- AIR_SUPPLY
	0.0, -- TRAINING
	0.0, -- NAVAL_MINES_PLANTING
	0.0, -- NAVAL_MINES_SWEEPING
	0.0, -- RECON
	0.0, -- NAVAL_PATROL
	0,0, -- BARRAGE
	0,0, -- SAM
}

--Navy
NDefines.NNavy.SHORE_BOMBARDMENT_CAP = 0.375 --Vanilla -0.25

--Focus
NDefines.NFocus.FOCUS_POINT_DAYS = 5.85 --Bazi focuslarin sureleri 1-2 gun kisaldi onun disinda görünürde günlerinin farklı gözükmesi fixlenmiş oldu
NDefines.NFocus.MAX_SAVED_FOCUS_PROGRESS = 20

--Resistance
NDefines.NResistance.INITIAL_STATE_RESISTANCE = 10.0                             --Vanilla 1 - initial resistance percentage of a state once it is captured
NDefines.NResistance.RESISTANCE_TARGET_BASE = 55.0                               --Vanilla 35 - base resistance target percentage
NDefines.NResistance.RESISTANCE_TARGET_MODIFIER_OCCUPIED_CAPITULATED = 20.0      --Vanilla 10 - resistance target modifier when the enemy is capitulated
NDefines.NResistance.RESISTANCE_GROWTH_BASE = 0.30                               --Vanilla 0.2 - base resistance grow
NDefines.NResistance.RESISTANCE_GROWTH_MIN = 0.20                                --Vanilla 0.01 - min resistance grow
NDefines.NResistance.RESISTANCE_GROWTH_MAX = 100.0                               --Vanilla 100 - max resistance grow

--Supply
NDefines.NSupply.FLOATING_HARBOR_BASE_SUPPLY = 20   --Vanilla 15 - supply given by a floating harbor
NDefines.NSupply.FLOATING_HARBOR_BASE_DURATION = 30 --Vanilla 21 - duration of a full hp floating harbor

--Trade
NDefines.NTrade.BASE_TRADE_FACTOR = 150
NDefines.NTrade.PARTY_SUPPORT_TRADE_FACTOR = 20
NDefines.NTrade.RELATION_TRADE_FACTOR = 1.05
NDefines.NTrade.ANTI_MONOPOLY_TRADE_FACTOR_THRESHOLD = 0
NDefines.NTrade.ANTI_MONOPOLY_TRADE_FACTOR = 0
NDefines.NTrade.DISTANCE_TRADE_FACTOR = 0

--Production
NDefines.NProduction.DEFAULT_MAX_NAV_FACTORIES_PER_LINE = 50
NDefines.NProduction.FLOATING_HARBOR_MAX_NAV_FACTORIES_PER_LINE = 50
NDefines.NProduction.CONVOY_MAX_NAV_FACTORIES_PER_LINE = 50
NDefines.NProduction.CAPITAL_SHIP_MAX_NAV_FACTORIES_PER_LINE = 20
NDefines.NProduction.MAX_MIL_FACTORIES_PER_LINE = 250
NDefines.NProduction.RAILWAY_GUN_MAX_MIL_FACTORIES_PER_LINE = 10
NDefines.NProduction.MINIMUM_NUMBER_OF_FACTORIES_TAKEN_BY_CONSUMER_GOODS_VALUE = 1		-- The minimum number of factories we have to put on consumer goods, by value.
NDefines.NProduction.MINIMUM_NUMBER_OF_FACTORIES_TAKEN_BY_CONSUMER_GOODS_PERCENT = 0.1	-- The minimum number of factories we have to put on consumer goods, in percent.
NDefines.NProduction.BASE_FACTORY_SPEED_MIL = 3.0                                       -- Vanilla 3.5 - Base factory speed multiplier (how much hoi3 style IC each factory gives).
NDefines.NProduction.BASE_FACTORY_SPEED_NAV = 4.0                                       -- Vanilla 2.0 - Base factory speed multiplier (how much hoi3 style IC each factory gives).
NDefines.NProduction.POWERED_FACTORY_SPEED_MIL = 3.5 			                        -- Vanilla 4.5 - Powered factory speed multiplier.
NDefines.NProduction.POWERED_FACTORY_SPEED_NAV = 4.5 									-- Vanilla 2.5 - Powered factory speed multiplier.
NDefines.NProduction.RESOURCE_TO_ENERGY_COEFFICIENT = 9.0		                        -- Vanilla 9.0 - How much energy per coal produces. (12.0 is experimental)

--Buildings
NDefines.NBuildings.MAX_SHARED_SLOTS = 30
NDefines.NBuildings.MAX_BUILDING_LEVELS = 25
NDefines.NBuildings.SUPPLY_PORT_LEVEL_THROUGHPUT = 4
NDefines.NBuildings.RADAR_RANGE_MAX = 400

--SProject
NDefines.NProject.BREAKTHROUGH_DAILY_NUCLEAR_REACTOR_GAIN = 0.5

--Factions
NDefines.NFactions.FACTION_INTELLIGENCE_ALLOWED_ADVISOR_TRAIT = { 
	"head_of_intelligence",
	"mastermind_code_cracker",
	"expert_code_cracker",
	"spymaster",
	"spymaster_no_lar",
	"commander_of_the_fetno_derash",
	"commander_of_the_fetno_derash_no_lar",
	"SWI_soviet_spy",
	"SWI_intelligence_officer",
	"special_envoy",
	"BRA_soviet_spy",
	"HUN_military_intelligence_officer",
	"AUS_secretive_priest",
	"AUS_veteran_head_of_agency",
	"BEL_illusive_mastermind",
	"GER_intelligence_coordinator",
	"GER_secretary_of_state_security",
	"GER_reich_security_main_office_director_lar",
	"GER_reich_security_main_office_director_no_lar",
	"head_of_the_abwehr",
	"head_of_the_abwehr_improved",
	"intelligence_service_deputy",
	"PRC_multi_talented_diplomat_lar",
	"PRC_multi_talented_diplomat_no_lar",
	"PRC_trained_by_the_nkvd",
	"PRC_spymaster",
	"PHI_intelligence_bureau_chief",
	"HUN_stalinist_agent",
	"JAP_tokko_chief",
	"CHI_spymaster",
	--EIF
	"intelligence_analyst",
	"chi_bureau_of_investigation",
	"GER_sipo_sd_trait",
	"jap_director_special_operations"
}
	
--Doctrines
NDefines.NDoctrines.TRAINING_MASTERY_GAIN_FACTOR = 0.15 -- Vanilla 0.1 - How much training contributes to doctrine mastery relative to combat/missions
