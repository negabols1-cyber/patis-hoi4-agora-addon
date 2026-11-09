# Syria focus tree

Syria (`SYR`) starts in 1936 as a French colony (`autonomy_colony`) holding Damascus (554), Aleppo (677), Deir ez-Zor (680) and Hatay (799).
Its tree (`syria_focus`, 103 focuses) splits into staying with France or breaking away, and the breakaway route splits again into communist, fascist and Hashemite monarchy branches.
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

The leadership event `syria.40` sets one route flag and installs the government.
Its stability cost scales with the chosen party's popularity, up to 15%.
If Syria becomes free without the event, the decision `SYR_choose_the_new_leadership` fires it, and `SYR_the_hour_of_independence` is bypassed.

## Ideology branches

Each branch has 13 focuses in the same shape: root, two columns, a convergence, then a diplomacy column and an expansion column ending in a capstone with cores and a research slot.

- Communist (Khalid Bakdash): land reform, workers' councils, Soviet faction invitation (`syria.80`), Soviet arms, war goals on Lebanon, Palestine and Transjordan and Iraq.
- Fascist (Antun Saadeh, SSNP): the Whirlwind Banner, militia, claims on natural Syria, Axis invitation (`syria.81`), war goals on Lebanon and Hatay, Palestine and Transjordan, Iraq and Cyprus.
- Hashemite monarchy (Zeid bin Hussein): coronation, Bedouin levies, the Hashemite Entente faction with an invitation to Iraq (`syria.82`), the Arab League initiative, a union offer to a free Lebanon (`syria.84`).

The existing `formable_nations_greater_syria` and `formable_nations_levant` decisions remain the formation step; the branches supply the claims and conquests they need.

## Economy and army

The economy branch (14 focuses) builds factories in Damascus and Aleppo, infrastructure in the east, the Iraq pipeline idea with oil in Deir ez-Zor, a refinery, the Syrian University and the Levantine Market, then a dockyard in a coastal state, the Damascus trade fair and `SYR_a_self_reliant_syria` (industry research bonus and an arms factory).
The army branch loads two infantry divisions, recruits Fawzi al-Qawuqji, adds the Homs Military Academy and research bonuses, an air arm, the fortification of Damascus and the northern frontier, `SYR_the_national_army`, then the reserve system (manpower), the northern fortress line (bunkers on Aleppo's border) and `SYR_a_modern_syrian_army` (army experience and a land doctrine bonus).
Focus costs are 7 (49 days) or less.

## Icons and GFX

Every focus, idea, decision and event uses an existing vanilla or mod sprite; no new `.gfx` entry was added.

| Surface | Sprites |
| --- | --- |
| Focus icons | Vanilla `GFX_focus_*` and `GFX_goal_*` sprites, for example `GFX_focus_IRQ_liberate_levant`, `GFX_focus_PER_stage_mass_protests`, `GFX_focus_fra_french_union` |
| Ideas | Vanilla idea pictures, for example `SYR_generic_2`, `CZE_divided_nation`, `FRA_undividable`, `IRQ_faisal_I_ns` |
| Decisions | `GFX_decision_category_generic_independence`, `GFX_decision_category_generic_arms_trade`, vanilla `GFX_decision_*` icons |
| Events | Vanilla `GFX_report_event_*` pictures |
| Portraits | `GFX_portrait_Khalid_Bakdash`, `GFX_portrait_Antun_Saadeh`, `GFX_portrait_Zeid_bin_Hussein` (`interface/_ef_leader_portraits.gfx`), `gfx/leaders/IRQ/Portrait_fawzi_al_qawuqji.dds` |

About 20 custom focus icons for key focuses are planned (decision D-07) and not made yet.
