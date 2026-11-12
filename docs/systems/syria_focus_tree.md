# Syria focus tree

Syria (`SYR`) starts in 1936 as a French colony (`autonomy_colony`) holding Damascus (554), Aleppo (677), Deir ez-Zor (680) and Hatay (799).
Its tree (`syria_focus`, 141 focuses) splits into staying with France or breaking away, and the breakaway route splits again into communist, fascist and Hashemite monarchy branches.
Design decisions are recorded in `docs/specs/syria_focus_tree/decisions.md`.

## Files

| File | Content |
| --- | --- |
| `common/national_focus/SYR.txt` | The focus tree |
| `common/ideas/SYR.txt` | National spirits |
| `common/decisions/SYR.txt` | National Struggle and French Levant decisions, the Hold Damascus mission |
| `common/decisions/categories/SYR_decision_categories.txt` | Decision categories |
| `common/scripted_effects/SYR_scripted_effects.txt` | Resistance, independence crisis, revolt and government helpers |
| `common/scripted_triggers/SYR_scripted_triggers.txt` | Shared checks |
| `common/characters/SYR_independence_characters.txt` | Khalid Bakdash, Antun Saadeh, Zeid bin Hussein, Fawzi al-Qawuqji |
| `common/on_actions/SYR_on_actions.txt` | France capitulation hook |
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

| Surface | Sprites |
| --- | --- |
| Focus icons | Vanilla `GFX_focus_*` and `GFX_goal_*` sprites, for example `GFX_focus_IRQ_liberate_levant`, `GFX_focus_PER_stage_mass_protests`, `GFX_focus_fra_french_union` |
| Ideas | Vanilla idea pictures, for example `SYR_generic_2`, `CZE_divided_nation`, `FRA_undividable`, `IRQ_faisal_I_ns` |
| Decisions | `GFX_decision_category_generic_independence`, `GFX_decision_category_generic_arms_trade`, vanilla `GFX_decision_*` icons |
| Events | Vanilla `GFX_report_event_*` pictures |
| Portraits | `GFX_portrait_Khalid_Bakdash`, `GFX_portrait_Antun_Saadeh`, `GFX_portrait_Zeid_bin_Hussein` (`interface/_ef_leader_portraits.gfx`), `gfx/leaders/IRQ/Portrait_fawzi_al_qawuqji.dds`, vanilla `GFX_Portrait_Arabia_Generic_1` and `_2` for the advisors |

About 20 custom focus icons for key focuses are planned (decision D-07) and not made yet.
