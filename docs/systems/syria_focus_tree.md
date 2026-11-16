# Syria focus tree

Syria (`SYR`) starts in 1936 as a French colony (`autonomy_colony`) holding Damascus (554), Aleppo (677), Deir ez-Zor (680) and Hatay (799).
Its tree (`syria_focus`, 161 focuses) splits into staying with France or breaking away, and the breakaway route splits again into communist, fascist and Hashemite monarchy branches, plus the hidden Black Banner route.
Design decisions are recorded in `docs/specs/syria_focus_tree/decisions.md`.

## Files

| File | Content |
| --- | --- |
| `common/national_focus/SYR.txt` | The focus tree |
| `common/ideas/SYR.txt` | National spirits |
| `common/decisions/SYR.txt` | National Struggle, French Levant, Arab Unity and Black Banner decisions, the Hold Damascus and Day of Reckoning missions |
| `common/decisions/categories/SYR_decision_categories.txt` | Decision categories |
| `common/scripted_effects/SYR_scripted_effects.txt` | Resistance, independence crisis, revolt, government and Black Banner helpers |
| `common/scripted_triggers/SYR_scripted_triggers.txt` | Shared checks |
| `common/scripted_localisation/SYR_scripted_localisation.txt` | Black Banner category description (`SYR_GetBlackBannerStatus`) |
| `common/dynamic_modifiers/SYR_dynamic_modifiers.txt` | `SYR_faithful_state` (Black Banner mosque states) |
| `common/characters/SYR_independence_characters.txt` | Khalid Bakdash, Antun Saadeh, Zeid bin Hussein, Fawzi al-Qawuqji, Muhammad al-Ashmar |
| `common/on_actions/SYR_on_actions.txt` | France capitulation hook, Lebanon victory in the war of independence, end of the war of faith |
| `common/opinion_modifiers/SYR_opinion_modifiers.txt` | Opinion modifiers |
| `events/SYR_events.txt` | Namespace `syria` |
| `history/units/SYR_*.txt` | Divisions loaded by focuses and the revolt |
| `history/countries/SYR - Syria.txt` | Starting spirits and recruited leaders |
| `localisation/english/SYR_focus_l_english.yml` | English text (the only language, decision D-15) |

## Opening

The opening is five focuses: the general strike (event `syria.1`), the Paris delegation, the Lebanese question (claim on 553), the Sanjak question (event `syria.2`, only while Syria owns Hatay) and the crossroads that opens the route choice.
Turkey's `TUR_the_hatay_issue` still works unchanged: while Syria is a French subject it asks France, and once Syria is free it asks Syria.

## Loyalist route

`SYR_ratify_the_franco_syrian_treaty` needs a democratic France.
It replaces `SYR_the_french_mandate` with `SYR_the_treaty_mandate` and raises autonomy.
Three columns follow: politics (Hashim al-Atassi becomes president with a liberal leader role, the Druze and Alawite states are merged, parliament), autonomy (reforms, `set_autonomy` to `autonomy_dominion`, the Lebanese settlement through event `syria.50`) and army (Troupes Spéciales divisions, staff talks, border forts).
After the convergence, Syria supports France at war through the French Levant decisions, which pay equipment or manpower for autonomy.
The final choice is equal partnership (stays a subject, gains a research slot later) or independence by treaty (event `syria.55`).
If France shelves the treaty, Syria gets the flag `SYR_treaty_betrayed`, the National Struggle opens, and the leadership event offers only the National Bloc republic.

When France capitulates while Syria is loyal, `on_capitulation` fires `syria.60` ten days later.
Syria can stand with Free France, recognise Vichy (found through the owner of state 26, the Vichy capital set in `events/France.txt`), or leave the mandate.

## Independence route and National Resistance

`SYR_reject_the_treaty` opens the National Struggle decision category.
National Resistance is the variable `SYR_resistance`, from 0 to 100, shown in the category description.
Decisions add to it through `SYR_add_resistance`, which grows the gain by 50% while France is weakened or not a democracy and by 25% after `SYR_the_national_bloc_underground`.
Most decisions may provoke a French answer (`syria.10`, at most once per 30 days): a Sûreté crackdown, concessions or arrests, each reported to Syria.

`SYR_the_hour_of_independence` needs full resistance and runs `SYR_start_independence_crisis`:

- If France is weakened (capitulated, surrender progress above 10%, or at war with a major), France decides in `syria.30` whether to let Syria go.
- Otherwise, or if France refuses, Syria decides in `syria.31` whether to revolt now or wait. Waiting costs resistance and opens the decision `SYR_the_hour_has_come`.

The revolt ends the subject relation, declares an `independence_wargoal` war on France (vanilla precedent: `events/AAT_Denmark.txt`), spawns six militia divisions (`SYR_revolt`), adds `SYR_war_of_independence` and starts the 100-day mission `SYR_hold_damascus` ("Outlast France").
If the war with France still goes on when the mission ends, France signs a white peace in `syria.33` and Syria keeps its land and independence (`syria.34`).
Taking Lebanon (state 553) during this war ends it at once: `on_state_control_changed` sets `SYR_lebanon_victory` and sends France `syria.33`, which then uses the description `syria.33.d_lebanon`.
If Syria holds Lebanon (state 553) when that peace is signed and France or a French subject owns it, `SYR_keep_occupied_lebanon` gives Lebanon to Syria: Syria annexes the Lebanese puppet (LEB), or takes the state if France owns it directly.
The Lebanon war focuses are then bypassed: `SYR_the_red_cedar` and `SYR_reunite_with_lebanon` when Syria owns Lebanon, and `SYR_reclaim_lebanon` when Syria owns both Lebanon and Hatay; if only Lebanon is Syrian, `SYR_reclaim_lebanon` gives a war goal on Hatay alone.

The leadership event `syria.40` sets one route flag and installs the government.
Its stability cost scales with the chosen party's popularity, up to 15%.
If Syria becomes free without the event, the decision `SYR_choose_the_new_leadership` fires it, and `SYR_the_hour_of_independence` is bypassed.

## Ideology branches

Each branch has 13 focuses in the same shape: root, two columns, a convergence, then a diplomacy column and an expansion column ending in a capstone with cores and a research slot.

- Communist (Khalid Bakdash): land reform, workers' councils, Soviet faction invitation (`syria.80`), Soviet arms, war goals on Lebanon, Palestine and Transjordan and Iraq.
- The Syrian Road (communist, independent of Moscow): `SYR_the_moscow_unconnection` is exclusive with `SYR_the_moscow_connection`, breaks with the Soviet Union (opinion `SYR_broke_with_moscow`, -30), puts `SYR_realcominismLeader` in power (traits `dictator` and `SYR_dislikes_the_ussr`: -10% stability, -10% war support) and opens six focuses with no war goals: `SYR_the_syrian_road_to_socialism` (idea), then `SYR_the_damascus_plan` (two factories, industry research) and `SYR_the_jazira_collective_farms` (stability, infrastructure, a factory), and `SYR_the_workers_militia` (idea `SYR_the_workers_militia`: +5% militia attack, defence and speed) and `SYR_defend_the_revolution` (swaps it for `SYR_the_workers_militia_2`: +15% militia attack, defence and speed), joined by `SYR_the_neutral_peoples_republic`, which swaps the road idea for `SYR_the_neutral_peoples_republic` (political power, stability, slower enemy war justification). The capstone needs at least 20 factories and sets the cosmetic tag `SYR_socialist_levant`: the country becomes The Federation of Socialist Levant States with the map colour 84 64 140 (`common/countries/cosmetic.txt`) and keeps the Syrian flag. Syria stays outside every faction.
- Fascist (Antun Saadeh, SSNP): the Whirlwind Banner, militia, claims on natural Syria, Axis invitation (`syria.81`), war goals on Lebanon and Hatay, Palestine and Transjordan, Iraq and Cyprus.
- Hashemite monarchy (Zeid bin Hussein): coronation, Bedouin levies, the Hashemite Entente faction with an invitation to Iraq (`syria.82`), the Arab League initiative, a union offer to a free Lebanon (`syria.84`).
- Arab-Islamic alliance (Hashemite, six focuses under `SYR_the_throne_of_faisal`): `SYR_the_arab_covenant` founds the Hashemite Entente if Syria has no faction and invites Saudi Arabia and Yemen (opinion `SYR_arab_covenant`, +15), `SYR_the_islamic_conference` invites Persia and Afghanistan (opinion `SYR_islamic_solidarity`, +20); both use event `syria.85` through `SYR_invite_to_the_alliance`, and the AI accepts more often above 50 opinion, Saudi Arabia seldom (old rivalry with the Hashemites). `SYR_the_arab_brotherhood` gives the idea `SYR_arab_brotherhood` (+5% army defence, +5% war support) to Syria and every faction member; it ends when a member leaves. `SYR_liberate_the_arab_lands` gives a war goal against every non-member that holds Egyptian, Kuwaiti or Libyan core states (trigger `SYR_is_arab_nation_land`), and `SYR_the_free_arab_nations` releases the Egyptian, Kuwaiti and Libyan lands Syria holds as Syrian subjects in its faction (`SYR_free_the_arab_nations`, `release_puppet`) and demands freedom for Egypt and Libya from the country holding Cairo or Alexandria (`syria.87`) and Tripoli or Benghazi (`syria.88`). A holder that agrees releases the nation as an independent country (`SYR_grant_egypt_independence`, `SYR_grant_libya_independence`) and Syria invites it (`syria.94`, `syria.95`); a refusal (`syria.96`, `syria.97`) lets Syria declare war on the holder for those states, which gives Syria the timed idea `SYR_war_of_arab_liberation` (+15% army attack for 365 days). The capstone `SYR_the_arabia_organization` renames the faction to the Arabia Organization, sets the cosmetic tag `SYR_arabia_org` (the country becomes The Arabia Organization, dark green 0 90 40, Syrian flags copied to `gfx/flags/SYR_arabia_org*.tga`) and sends every member the union event `syria.86`: a member that accepts gives Syria cores on all its states and is annexed, and the AI accepts only above 60 opinion of Syria (`@SYR_UNION_OPINION`). The decision category `SYR_arabia_organization` (Arab Unity) is always shown after `SYR_the_free_arab_nations`: `SYR_invite_into_the_alliance` (25 political power, every 180 days, Iraq, Saudi Arabia, Yemen, Persia, Afghanistan, Egypt, Kuwait or Libya when free and outside a faction) and `SYR_free_the_held_arab_lands` (25 political power, frees the Arab lands Syria holds); after the capstone it adds, per member, `SYR_arab_diplomatic_pressure` (50 political power, once, opinion `SYR_arab_union_pressure`, +25) and `SYR_propose_arab_union` (25 political power, every 90 days, sends `syria.86` again).

The existing `formable_nations_greater_syria` and `formable_nations_levant` decisions remain the formation step; the branches supply the claims and conquests they need.

## The Black Banner (secret route)

The route is hidden until `syria.40` sets `SYR_route_secret`.
`SYR_BeterayMain_copy` completed before `SYR_the_hour_of_independence` sets `SYR_secret_path_eligible`; the Hashemite option of `syria.40` then shows the Hashemite tooltip but opens the Black Banner instead, keeps the current leader and skips the leadership cost.
`SYR_komkompuration` ("We Only Need Allah", x 37, `allow_branch`) is exclusive with the three ideology roots.

`SYR_komkompuration` runs `SYR_open_the_reckoning`: Muhammad al-Ashmar (islamism, trait `SYR_warrior_sheikh`) is recruited, the fascist party becomes the Society of the Black Banner, the capital gets the dynamic modifier `SYR_faithful_state` and the 60-day mission `SYR_the_day_of_reckoning` starts in the decision category `SYR_the_black_banner`.
The category description (`SYR_GetBlackBannerStatus`) shows the mosque states, the moderates' share, the rifle caches, mujahideen, volunteers and the days added to the countdown.

Delaying the countdown (`add_days_mission_timeout`, at most 60 days in total, so the countdown lasts 120 days at most):

| Decision | Delay | Cost | Drawback |
| --- | --- | --- | --- |
| `SYR_swear_loyalty_to_the_cabinet` | 15 days, once | 35 political power | -3% war support |
| `SYR_buy_off_the_informants` | 10 days, every 14 days | 25 political power | -2% stability |
| `SYR_the_truce_of_the_holy_month` | 20 days, once | 50 political power | the moderates' share +5% |

`SYR_raise_the_black_banner_now` (50 political power) starts the war at once: the moderates' share -5% and the timed spirit `SYR_the_surprise_rising` (+15% attack, +10% speed for 60 days).

Three preparation focuses (cost 2 each, bypassed once the war has started) unlock the rest:

- `SYR_the_minbar_of_damascus` (+5% fascism popularity): `SYR_win_the_mosques_of_FROM`, a state-targeted decision (30 political power, 21 days, one state at a time) that adds `SYR_faithful_state` (+10% local manpower). Each mosque state beyond the capital lowers the moderates' share by 8%. The moderates must keep at least one state, so the decision needs two states without mosques.
- `SYR_the_hidden_armouries` (500 rifles into the caches): `SYR_hide_rifles_in_the_mosques` (20 political power and 500 rifles, every 14 days, four times) stores 750 rifles, and `SYR_train_the_mujahideen` (25 political power and 4,000 manpower, every 14 days, six times) promises one Jund al-Raya division (six infantry battalions).
- `SYR_brothers_in_faith` (opinion `SYR_call_of_the_faithful` +15 from Saudi Arabia, Yemen, Egypt and Afghanistan): `SYR_seek_the_aid_of_FROM` (25 political power, once per nation, also during the war) sends `syria.101`. An acceptance (`syria.102`, opinion `SYR_aid_of_the_faithful` +25) gives 1,000 rifles and one volunteer division: into the caches and the waiting list before the war, at once during it. A refusal sends `syria.103`.

The moderates' share (`SYR_moderate_strength`) starts at 50% and is kept between 20% and 60%.

When the mission ends, `SYR_start_the_war_of_faith` runs (vanilla precedent: the Persian civil war, `PER_civil_war_mission_effect`):

- `start_civil_war` with `ruling_party = fascism`, `ideology = democratic`, `size = SYR_moderate_strength` and a `states_filter` that sends every state without `SYR_faithful_state` to the moderates. The capital always keeps the modifier, and if every state has it, Aleppo (or another state other than the capital) loses it (`SYR_secure_a_moderate_stronghold`).
- The Black Banner side gets `SYR_black_banner_side` after the split, so the moderates' breakaway country never sees the category or the later focus. `SYR_seat_the_black_banner` promotes Muhammad al-Ashmar, bans elections and sets the cosmetic tag `SYR_emirate_of_sham`: The Emirate of Sham, adjective Shami, map colour 12 36 20, the black banner copied from `SAU_islamic_state_fascism` to `gfx/flags/SYR_emirate_of_sham.tga` (and the medium and small folders).
- `SYR_the_war_of_faith` (+10% morale, +15% conscription, +10% defence on cores, ends with the civil war), the caches go to the stockpile, the mujahideen and volunteers appear in the capital and the mosque modifiers are removed. Event `syria.100` reports the rising.
- If the moderates hold no state at all (Syria owns only its capital), the government falls without a war (`syria.105`).

`on_civil_war_end` gives the winning Black Banner `SYR_war_of_faith_won` and `syria.104` (+5% stability).
`SYR_the_banner_over_damascus` (needs the three preparation focuses and the victory) adds `SYR_the_rule_of_the_banner` (+10% stability, +0.15 political power, +10% war support, fascism drift), +10% stability and 25 army experience.
If the moderates win, they annex the Black Banner like in any vanilla civil war.

After the victory, `SYR_rebuild_the_souks` (an industrial complex and a building slot in the capital and in another state) and `SYR_the_zakat_treasury` (idea: -5% consumer goods, +10% construction speed, +5% factory output) lead to `SYR_the_call_to_the_arab_nations` (+10% war support).

Under the call sit three focuses:
- `SYR_the_peace_of_the_emirate` gives the idea `SYR_the_peace_of_the_emirate` (-15% resistance target and -20% resistance growth in the states we occupy, +15% political power).
- `SYR_the_march_on_anatolia` declares war on Turkey (`annex_everything`).
- `SYR_the_arsenal_of_the_banner` gives 50 army experience, two 50% infantry weapons research bonuses, one 50% land doctrine bonus and 5,000 infantry equipment.
- `SYR_the_workshops_of_the_emirate`, under the arsenal, gives one off-map military and one off-map civilian factory for every owned and controlled state with infrastructure 4 or higher.
It opens the category `SYR_the_emirates_call`: `SYR_demand_the_submission_of_FROM` (50 political power, once per nation) targets independent Iraq, Saudi Arabia, Yemen, Transjordan, Lebanon, Egypt, Kuwait, Oman, Palestine and Libya with `syria.106`.
A nation that submits becomes Syria's puppet (`SYR_make_sham_vassal`, `syria.107`) and takes the cosmetic tag `SYR_sham_vassal_<TAG>`: its own name, a lighter shade of the Emirate's green (38 80 50) and its vanilla flags copied to `gfx/flags/SYR_sham_vassal_<TAG>*.tga`. The AI submits rarely (base 15 against 60, three times as often above 50 opinion, never as a major).
A refusal sends `syria.108`: Syria declares war with a puppet war goal and gets `SYR_the_sword_of_the_emirate` (+15% attack and defence) for 120 days, renewed by each new refusal.

## AI route game rule

The game rule `SYR_ai_behavior` (`common/game_rules/SYR_game_rules.txt`, group AI behaviour) picks the route an AI Syria follows: Historical (default, normal weights), Loyal to France, Communist, Independent Communist, Syrian Social Nationalist, Hashemite Monarchy, Arab-Islamic Alliance, The Black Banner or Random.
Random rolls one route at game start (`on_startup` in `SYR_on_actions.txt`, flags `SYR_AI_RANDOM_*`; Independent Communist weight 10, the others 15).
The scripted triggers `SYR_ai_wants_*` read the rule and the flag and steer: `SYR_ratify_the_franco_syrian_treaty` and `SYR_reject_the_treaty` (the loyalist block on independence lifts if France stops being a democracy), the three leadership options of `syria.40`, `SYR_the_moscow_connection` against `SYR_the_moscow_unconnection`, `SYR_the_throne_of_faisal` and `SYR_the_arab_covenant` (zero weight on the plain Hashemite route), and `SYR_BeterayMain` and `SYR_BeterayMain_copy`, which the Black Banner AI takes before independence and the other fixed routes leave alone.
If the Black Banner AI reaches `syria.40` without `SYR_secret_path_eligible`, its option leads to the Hashemite branch.

## Economy and army

The economy branch (14 focuses) builds factories in Damascus and Aleppo, infrastructure in the east, the Iraq pipeline idea with oil in Deir ez-Zor, a refinery, fuel silo and 24 oil in Deir ez-Zor (`SYR_the_homs_refinery`), the Syrian University and the Levantine Market, then a dockyard in a coastal state, the Damascus trade fair and `SYR_a_self_reliant_syria` (industry research bonus and an arms factory).
`SYR_the_damascus_industrial_zone_minesplaces` builds two industrial complexes and adds steel in Damascus, and unlocks `SYR_open_the_local_mines` in the vanilla `prospect_for_resources` category: for 150 political power it adds 5 tungsten and 5 chromium to Damascus (state 554) after 30 days, and it can be taken two times (country variable `SYR_local_mines_opened`).
The army branch loads two infantry divisions, recruits Fawzi al-Qawuqji, adds the Homs Military Academy and research bonuses, an air arm, the fortification of Damascus and the northern frontier, `SYR_the_national_army`, then the reserve system (manpower), the northern fortress line (bunkers on Aleppo's border) and `SYR_a_modern_syrian_army` (army experience and a land doctrine bonus).
Focus costs are 7 (49 days) or less.

## Advisors

Syria starts with three custom political advisors (`common/characters/SYR_independence_characters.txt`, traits in `common/country_leader/SYR_traits.txt`):

- Ana Marudun (`SYR_patron_of_learning`): +10% research speed.
- Jamil Mardam Bey (`SYR_mobilisation_organiser`): +15% mobilisation speed.
- Shukri al-Quwatli (`SYR_voice_of_arab_unity`): +5% manpower from non-core states.

## Icons and GFX

Every focus, idea, decision and event uses an existing vanilla or mod sprite; no new `.gfx` entry was added.
The Black Banner uses `GFX_z_goal_imam`, `GFX_z_goal_send_ulema_to_front`, `GFX_z_goal_islamic_friendship`, `GFX_goal_SAU_black_gold_feeding_black_flag` (focuses), `GFX_PER_decision_built_mosques` and vanilla decision icons, the ideas `PER_islamic_army`, `PER_guardians_of_the_islamic_revolution` and `SAU_sharia_law`, the event pictures `GFX_report_event_SAU_*`, and the vanilla portrait `GFX_Portrait_Arabia_Generic_land_2` for Muhammad al-Ashmar until a custom portrait is made.
Its cosmetic flag files `gfx/flags/SYR_emirate_of_sham.tga` (with medium and small) are copies of the mod's `SAU_islamic_state_fascism` flag.

| Surface | Sprites |
| --- | --- |
| Focus icons | Vanilla `GFX_focus_*` and `GFX_goal_*` sprites, for example `GFX_focus_IRQ_liberate_levant`, `GFX_focus_PER_stage_mass_protests`, `GFX_focus_fra_french_union` |
| Ideas | Vanilla idea pictures, for example `SYR_generic_2`, `CZE_divided_nation`, `FRA_undividable`, `IRQ_faisal_I_ns` |
| Decisions | `GFX_decision_category_generic_independence`, `GFX_decision_category_generic_arms_trade`, vanilla `GFX_decision_*` icons |
| Events | Vanilla `GFX_report_event_*` pictures |
| Portraits | `GFX_portrait_Khalid_Bakdash`, `GFX_portrait_Antun_Saadeh`, `GFX_portrait_Zeid_bin_Hussein` (`interface/_ef_leader_portraits.gfx`), `gfx/leaders/IRQ/Portrait_fawzi_al_qawuqji.dds`, vanilla `GFX_Portrait_Arabia_Generic_1` and `_2` for the advisors |

About 20 custom focus icons for key focuses are planned (decision D-07) and not made yet.
