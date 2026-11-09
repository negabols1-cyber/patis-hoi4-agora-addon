--------------------------------------------
--------------- FRONTLINE AI ---------------
--------------------------------------------
NDefines.NAI.AGGRESSIVENESS_CHECK_BASE = 40				-- front comparison where ai will consider aggressive stance, unless it is already then the number above is used
NDefines.NAI.AGGRESSIVENESS_CHECK_EASY_TARGET = -0.1	-- if target nation is flagged as easy target we also adjust down the front comparison needed
NDefines.NAI.AGGRESSIVENESS_CHECK_CAREFUL = 30			-- at what front strength balance do we go careful
--------------------------------------------
--------------- FRONTLINE AI ---------------
--------------------------------------------

--AI
NDefines.NAI.RESEARCH_DAYS_BETWEEN_WEIGHT_UPDATE = 7        -- Refreshes need scores based on country situation
NDefines.NAI.RESEARCH_LAND_DOCTRINE_NEED_GAIN_FACTOR = 0    --Vanilla 0.15 - Multiplies value based on relative military industry size / country size.
NDefines.NAI.RESEARCH_NAVAL_DOCTRINE_NEED_GAIN_FACTOR = 0   --Vanilla 0.05 - Multiplies value based on relative naval industry size / country size.
NDefines.NAI.RESEARCH_AIR_DOCTRINE_NEED_GAIN_FACTOR = 0	    --Vanilla 0.07 - Multiplies value based on relative number of air base / country size.
NDefines.NAI.RESEARCH_NEW_WEIGHT_FACTOR = 0.5               -- Impact of previously unexplored tech weights. Higher means more random exploration.
NDefines.NAI.RESEARCH_BONUS_FACTOR = 3                      -- To which extent AI should care about bonuses to research
NDefines.NAI.RESEARCH_AHEAD_OF_TIME_FACTOR = 2.0            -- To which extent AI should care about ahead of time penalties to research
NDefines.NAI.MAX_AHEAD_RESEARCH_PENALTY = 1.5               --Vanilla 2.0 - max ahead of tiem penalty ai will pick eve

NDefines.NAI.MISSING_CONVOYS_BOOST_FACTOR = 30.0            --The more convoys a country is missing, the more resources it diverts to cover this.
NDefines.NAI.RELATIVE_STRENGTH_TO_INVADE = 0    			--Compares the estimated strength of the country/faction compared to it's enemies to see if it should invade or stay at home to defend.
NDefines.NAI.RELATIVE_STRENGTH_TO_INVADE_DEFENSIVE = 0      --Compares the estimated strength of the country/faction compared to it's enemies to see if it should invade or stay at home to defend, but while being a defensive country.
NDefines.NAI.MAX_INVASION_SIZE = 24                         --max invasion group size
--------------------------------------------------------------------------------------------------------------
-- DIVISION PRODUCTION
--------------------------------------------------------------------------------------------------------------
	-- Calculating wanted nr of divisions
NDefines.NAI.WANTED_UNITS_INDUSTRY_FACTOR = 3                        -- How many units a country wants is partially based on how much military industry that is available
NDefines.NAI.WANTED_UNITS_THREAT_BASE = 0.7                             -- If no threat, multiply min wanted units by this
NDefines.NAI.WANTED_UNITS_THREAT_MAX = 10.0                             -- Normalized threat is clamped to this
NDefines.NAI.WANTED_UNITS_WAR_THREAT_FACTOR = 1.5                       -- Factor threat with this if country is at war. this value is overriden by the value in ideology database if that value exceedes this.
NDefines.NAI.WANTED_UNITS_DANGEROUS_NEIGHBOR_FACTOR = 1.25              -- Factor if has dangerous neighbor
NDefines.NAI.WANTED_UNITS_MANPOWER_DIVISOR = 22000                      -- Normalizing divisor for AI manpower. (for each x max available manpower, they want one division)
NDefines.NAI.WANTED_UNITS_WEIGHT_FRONTS_WANT = 0.7                      -- Weight of front needs when computing final nr wanted units
NDefines.NAI.WANTED_UNITS_WEIGHT_FACTORIES = 0.7                       -- Weight of military factories when computing final nr wanted units
NDefines.NAI.WANTED_UNITS_WEIGHT_MANPOWER = 0.7                        -- Weight of manpower availability when computing final nr wanted units
NDefines.NAI.WANTED_UNITS_MIN_DEFENCE_FACTOR = 0.4						-- Factor on units required for min defence
	-- End of calculating wanted nr of divisions

NDefines.NAI.MIN_FIELD_STRENGTH_TO_BUILD_UNITS = 0.7 --0.7			            -- Cancel unit production if below this to get resources out to units in the field
NDefines.NAI.MIN_MANPOWER_TO_BUILD_UNITS = 0.85 --0.7					        -- Cancel unit production if below this to get resources out to units in the field

NDefines.NAI.DEPLOY_MIN_TRAINING_SURRENDER_FACTOR = 0.5		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in wartime while surrender progress is higher than 0 
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_SURRENDER_FACTOR = 0.8	-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in wartime while surrender progress is higher than 0 
NDefines.NAI.DEPLOY_MIN_TRAINING_PEACE_FACTOR = 0.3		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in peacetime
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_PEACE_FACTOR = 0.9	-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in peacetime
NDefines.NAI.DEPLOY_MIN_TRAINING_WAR_FACTOR = 0.9		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in wartime
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_WAR_FACTOR = 0.92		-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in wartime
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_CAP_DEPLOY_FACTOR = 0.85 -- If training is capped by equipment deficit and we have reached that cap, deploy unit anyway if percentage is above this (reinforce in field instead).

NDefines.NAI.START_TRAINING_EQUIPMENT_LEVEL = 0.9 --0.9                               -- ai will not start to train if equipment drops below this level
NDefines.NAI.STOP_TRAINING_EQUIPMENT_LEVEL = 0.8 --0.8                                -- ai will not train if equipment drops below this level
--------------------------------------------------------------------------------------------------------------
NDefines.NAI.ATTACK_HEAVILY_DEFENDED_LIMIT = 0.7
NDefines.NAI.ORG_UNIT_STRONG = 0.85		-- Vanilla 0.75										-- Organization % for unit to be considered strong
NDefines.NAI.STR_UNIT_STRONG = 0.85		-- Vanilla 0.70									-- Strength (equipment) % for unit to be considered strong
NDefines.NAI.ORG_UNIT_NORMAL = 0.7		-- Vanilla 0.35 												-- Organization % for unit to be considered normal
NDefines.NAI.STR_UNIT_NORMAL = 0.7		-- Vanilla 0.40 											-- Strength (equipment) % for unit to be considered normal
NDefines.NAI.ORG_UNIT_WEAK = 0.4		-- Vanilla 0.25 												-- Organization % for unit to be considered weak
NDefines.NAI.STR_UNIT_WEAK = 0.5		-- Vanilla 0.30 												-- Organization % for unit to be considered weak
------------------------------------------
NDefines.NAI.DESIRE_USE_XP_TO_UNLOCK_LAND_DOCTRINE = 0.5
NDefines.NAI.DESIRE_USE_XP_TO_UNLOCK_NAVAL_DOCTRINE = 0.5
NDefines.NAI.DESIRE_USE_XP_TO_UNLOCK_AIR_DOCTRINE = 0.5
NDefines.NAI.DESIRE_USE_XP_TO_UPDATE_LAND_TEMPLATE = 15.0
NDefines.NAI.DESIRE_USE_XP_TO_UPGRADE_LAND_EQUIPMENT = 25.0
NDefines.NAI.DESIRE_USE_XP_TO_UPGRADE_NAVAL_EQUIPMENT = 1.0
NDefines.NAI.DESIRE_USE_XP_TO_UPGRADE_AIR_EQUIPMENT = 25.0
NDefines.NAI.DIVISION_DESIGN_MAX_FAILED_DAYS = 30					-- max days we keep track of since failure of a template design update
NDefines.NAI.EQUIPMENT_DESIGN_MAX_FAILED_DAYS = 30					-- max days we keep track of since failure of an equipment design update
-----------------------------------------
NDefines.NAI.BUILDING_TARGETS_BUILDING_PRIORITIES = { -- buildings in order of pirority when considering building targets strategies. First has the greatest priority, omitted has the lowest. NOTE: not all buildings are supported by building targets strategies.
	'air_base',
	'infrastructure',
	'rubber_refinery',
	'synthetic_refinery',
	'steel_mill',
	'aluminum_mill',
	'tungsten_factory',
	'chromium_factory',
	'industrial_complex',
}
NDefines.NAI.BUILD_REFINERY_LACK_OF_RESOURCE_MODIFIER = 0.006
NDefines.NAI.ARMY_LEADER_ASSIGN_EMPTYNESS_MALUS	= 0.3	-- Vanilla 0.2 ---Factor for avoiding assigning leaders that can lead large armies to small armies (a value of 0.2 reduces the score by max 20 %)
NDefines.NAI.DAYS_FUEL_REMAINING_TO_ENTER_FUEL_SAVING_MODE = 15
NDefines.NAI.MAX_FUEL_CONSUMPTION_RATIO_FOR_NAVY_TRAINING = 0.40
NDefines.NAI.MIN_DELIVERED_TRADE_FRACTION = 0.70
NDefines.NAI.PRODUCTION_EQUIPMENT_SURPLUS_FACTOR = 0.6 ---test
NDefines.NAI.PRODUCTION_LINE_SWITCH_SURPLUS_NEEDED_MODIFIER = 0.4
NDefines.NAI.MINIMUM_GOOD_TRADE_RATIO_PER_CIV = 0.025
NDefines.NAITheatre.AI_THEATRE_SUPPLY_CRISIS_LIMIT = 0.25
NDefines.NSupply.AI_FRONT_DIVISIONS_PER_SUPPLY_POINT = 0.83
NDefines.NAI.LAND_DEFENSE_SUPPLY_HUB_IMPORTANCE = 8
NDefines.NAITheatre.FRONT_EVAL_UNIT_SUPPLY_AND_ORG_LACK_IMPACT = 1.8
NDefines.NAI.AVERAGE_SUPPLY_USE_PESSIMISM = 2
NDefines.NAI.STATE_CONTROL_FOR_AREA_DEFENSE = 0.65
NDefines.NAI.PLAN_STEP_COST_LIMIT = 15
NDefines.NAI.PLAN_ACTIVATION_MAJOR_WEIGHT_FACTOR = 1.5
NDefines.NAI.PLAN_ACTIVATION_PLAYER_WEIGHT_FACTOR = 2.0
NDefines.NMilitary.FRONTLINE_EXPANSION_FACTOR = 0.7
NDefines.NMilitary.PLAN_MIN_AUTOMATED_EMPTY_POCKET_SIZE = 12
NDefines.NAI.ENTRENCHMENT_WEIGHT = 3.0
NDefines.NAI.DIVISION_SUPPLY_RATIO_TO_MOTORIZE = 0.9
NDefines.NAI.FALLBACK_LOSING_FACTOR = 0.2
NDefines.NAI.MAX_MICRO_ATTACKS_PER_ORDER = 6
NDefines.NAI.MICRO_POCKET_SIZE = 5
NDefines.NAI.POCKET_DISTANCE_MAX = 10000
NDefines.NAI.FRONT_CUTOFF_MIN_EDGE_PROXIMITY = 1
NDefines.NAI.FRONT_BULGE_RATIO_LOWER_CUTOFF = 1.2
NDefines.NAI.FRONT_BULGE_RATIO_UPPER_CUTOFF = 1.8
NDefines.NAI.MIN_FORCE_RATIO_TO_PROTECT = 0.35
NDefines.NMilitary.FRONT_MIN_PATH_TO_REDEPLOY = 5
NDefines.NAI.FRONT_UNITS_CAP_FACTOR = 20.0
NDefines.NAI.PLAN_FRONT_SECTION_MAX_LENGTH = 9
NDefines.NAI.PLAN_FRONT_SECTION_MIN_LENGTH = 3
NDefines.NAI.AIFC_REFRESH_NEED_SUPPLY_FACTOR_PER_DAY = 1.6
	-- End of offensive path scoring for AIFC
NDefines.NAI.LAND_COMBAT_FIGHTERS_PER_PLANE = 2.0
NDefines.NAI.LAND_DEFENSE_FIGHERS_PER_PLANE = 2.5
NDefines.NAI.DESPERATE_AI_MIN_UNIT_ASSIGN_TO_ESCAPE = 8			-- AI will assign at least this amount of units to break from desperate situations
NDefines.NAI.DESPERATE_AI_MIN_ORG_BEFORE_ATTACK = 0.8					-- ai will wait for this much org to attack an enemy prov in desperate situations
NDefines.NAI.DESPERATE_AI_MIN_ORG_BEFORE_MOVE = 0.10				-- ai will wait for this much org to move in desperate situations
NDefines.NAI.INDUSTRIAL_ORG_TRAIT_UNLOCK_RANDOMNESS = 1.0
NDefines.NAI.INDUSTRIAL_ORG_RESEARCH_ASSIGN_RANDOMNESS = 1.0
NDefines.NAI.INDUSTRIAL_ORG_PRODUCTION_ASSIGN_RANDOMNESS = 1.0
NDefines.NAI.HOUR_BAD_COMBAT_REEVALUATE = 24 -- if we are in combat for this amount and it goes shitty then try skipping it
NDefines.NAI.SEA_PATH_LENGTH_SCORE_BASE = 0 -- -30          -- scoring reduction from naval paths for AI when picking trade partners
NDefines.NTrade.MAX_MONTH_TRADE_FACTOR = 0
NDefines.NAI.AI_UPDATE_ROLES_FREQUENCY_HOURS = 96 --gerek yok o kadar sık güncellemeye
NDefines.NAI.NUM_SILOS_PER_CIVILIAN_FACTORIES = 0.0					-- ai will try to build a silo per this ratio of civ factories
NDefines.NAI.NUM_SILOS_PER_MILITARY_FACTORIES = 0.0					-- ai will try to build a silo per this ratio of mil factories
NDefines.NAI.NUM_SILOS_PER_DOCKYARDS = 0.0								-- ai will try to build a silo per this ratio of dockyards
NDefines.NAI.ASSIGN_TANKS_TO_WAR_FRONT = 8.0 --4.0
NDefines.NAI.ASSIGN_TANKS_TO_NON_WAR_FRONT = 0 --0.4
NDefines.NAir.AI_ALLOWED_PLANES_KEPT_IN_RESERVE = 0.0
NDefines.NAI.MAX_SUPPLY_DIVISOR = 1.55
NDefines.NAI.ARMY_LEADER_ASSIGN_ARMOR_LEADER_IF_NO_ARMOR = -2
NDefines.NAI.ESTIMATED_CONVOYS_PER_DIVISION = 8
NDefines.NAI.FRONT_TERRAIN_DEFENSE_FACTOR = 6.0				                -- Multiplier applied to unit defense modifier for terrain on front province multiplied by terrain importance
NDefines.NAI.FRONT_TERRAIN_ATTACK_FACTOR = 6.0 				                -- Multiplier applied to unit attack modifier for terrain on enemy front province multiplied by terrain importance
NDefines.NAI.UNIT_ASSIGNMENT_TERRAIN_IMPORTANCE = 15.0	-- Terrain score for units are multiplied by this when the AI is deciding which front they should be assigned to
NDefines.NAI.UPGRADE_PERCENTAGE_OF_FORCES = 0.06
NDefines.NAI.PLAN_ACTIVATION_SUPERIORITY_AGGRO = 1.50 --default 1.0 test		-- How aggressive a country is in activating a plan based on how superiour their force is.
NDefines.NAI.DYNAMIC_STRATEGIES_THREAT_FACTOR = 5.0 -- test
NDefines.NAI.FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.4
NDefines.NAI.HEAVILY_FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.4
NDefines.NAI.LAND_DEFENSE_CIVIL_FACTORY_IMPORTANCE = 100 -- 50			-- Strategic importance of civil factories
NDefines.NAI.LAND_DEFENSE_MILITARY_FACTORY_IMPORTANCE = 140 -- 70		-- Strategic importance of military factories
NDefines.NAI.LAND_DEFENSE_NAVAL_FACTORY_IMPORTANCE = 50 -- 30			-- Strategic importance of naval factories
NDefines.NAI.MAX_DIST_PORT_RUSH = 30.0	--default 20.0			-- If a unit is in enemy territory with no supply it will consider nearby ports within this distance.
NDefines.NAI.REVISITED_PROV_BOOST_FACTOR = 5   -- Vanilla 4 --When the AI picks units for a front, it prioritises units already nearby.
NDefines.NAI.LOW_PRIO_TEMPLATE_BONUS_FOR_GARRISONS = 5000	-- Vanilla 1000	--bonus to make ai more likely to assign low prio units to garrisons
NDefines.NAI.LOW_PRIO_TEMPLATE_PENALTY_FOR_FRONTS = 2000	-- Vanilla 500  --penalty to make ai less likely to assign low prio units to fronts
NDefines.NAI.CONSTRUCTION_PRIO_SUPPLY_BUILDING = 2.50
NDefines.NAI.CONSTRUCTION_PRIO_RAILWAY = 5.0
--NDefines.NAI.POLITICAL_IDEA_MIN_SCORE = 0.5 -- gerek kalmadı
NDefines.NAI.CONSTRUCTION_PRIO_INFRASTRUCTURE = 2
NDefines.NAI.CONSTRUCTION_PRIO_CIV_FACTORY = 1
NDefines.NAI.CONSTRUCTION_PRIO_FACTOR_OWNED_CORE = 2.5
NDefines.NSupply.AI_FRONT_MINIMUM_UNITS_PER_PROVINCE_FOR_SUPPLY_CALCULATIONS = 2
NDefines.NAI.MIN_NUM_CONQUERED_PROVINCES_TO_DEPRIO_NAVAL_INVADED_FRONTS = 40
NDefines.NAI.FRONT_EVAL_UNIT_ACCURACY = 2.0
NDefines.NAI.FRONT_EVAL_UNIT_AIR_SUP_IMPACT = 1.6 -- Vanilla 1.0	-- scale how good the AI thinks air superiority is for units
NDefines.NAI.FRONT_EVAL_PERCENT_TO_ASSIST_ALLY_FRONT = 0.60  -- Vanilla 0.5  percentage of how many units the AI thinks it should have compared to an ally before considering sending units
NDefines.NAI.DEPLOYED_UNIT_MANPOWER_RATIO_TO_BUFFER_PEACETIME = 0.12     		-- deployment will try to buffer a ratio of deployed manpower (for reinforcements) during peace time
NDefines.NAI.DESIRED_UNITS_FACTOR_AREA_ORDER = 0.5				-- Factor for desired number of units to assign to area defense orders
NDefines.NAI.MANPOWER_RATIO_CAREFULNESS_THRESHOLD = 0.1
NDefines.NAI.PLAN_VALUE_TO_EXECUTE = -0.25
NDefines.NAI.LAND_COMBAT_ENEMY_LAND_FORTS_AIR_IMPORTANCE = 10
NDefines.NAI.LAND_COMBAT_ENEMY_COASTAL_FORTS_AIR_IMPORTANCE = 6
NDefines.NAI.LAND_COMBAT_BOMBERS_PER_COASTAL_FORT_LEVEL = 10
NDefines.NAI.MAIN_ENEMY_FRONT_IMPORTANCE = 5.0
NDefines.NAI.RESOURCE_WANT_PER_MISSING_BALANCE = 0.25
NDefines.NAI.DESIRED_UNITS_FACTOR_FRONT_ORDER = 1.2
NDefines.NAI.UPGRADE_DIVISION_RELUCTANCE = 14
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_DOCTRINE = 14
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_TEMPLATE = 14
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_EQUIPMENT = 14
NDefines.NAI.UPDATE_SUPPLY_MOTORIZATION_FREQUENCY_HOURS = 96
NDefines.NAI.RESERVE_TO_COMMITTED_BALANCE = 0.20
NDefines.NAI.RAIDS_CREATE_FREQUENCY_DAYS = 21
NDefines.NAI.RAIDS_COMMAND_POWER_CAP_TO_CREATE = 100.0
NDefines.NAI.AIFC_REFRESH_NEED_PER_DAY = 1.5
NDefines.NAI.AIFC_CA_DIVISIONS_PER_PROVINCE = 2
NDefines.NAI.AIFC_ACTIVATE_AVG_ORG_RATIO_THRESHOLD = 0.5
NDefines.NAI.AIFC_TARGET_SUPPLY_HUB_BASE_SCORE = 23.0
NDefines.NAI.AIFC_PATH_COST_TRN_MOUNTAINS = 4.0
NDefines.NAI.AIFC_PATH_COST_TRN_MARSH = 3.0
NDefines.NAI.AIFC_PATH_COST_TRN_PLAINS = 1.5
NDefines.NAI.AIFC_PATH_COST_TRN_FOREST = 1.5
NDefines.NAI.AIFC_PATH_COST_TRN_URBAN = 0.50
NDefines.NAI.AIFC_PATH_COST_ADJ_RIVER = 1.5
NDefines.NAI.AIFC_PATH_COST_ADJ_RIVER_LARGE = 3.25
NDefines.NAI.AIFC_FRESHNESS_ADD_ON_PROGRESS = 22.0
NDefines.NAI.AIFC_PATH_COST_RAILWAY_CONNECTION = 0.80
NDefines.NAI.AIFC_PATH_COST_HAS_SUPPLY_HUB = 0.50
NDefines.NAI.AIFC_TARGET_SHORT_PATH_PENALTY_FACTOR = 0