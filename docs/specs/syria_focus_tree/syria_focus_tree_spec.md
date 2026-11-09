# Syria focus tree specification

Status: implemented from the consultation answers in `decisions.md`; the custom focus icons of D-07 are still to be made.
The implementation reference is `docs/systems/syria_focus_tree.md`.

## Premise

Syria begins as a French mandate shaken by the 1936 general strike.
The player decides whether Syria earns its sovereignty inside the French alliance or seizes it in a national struggle, and a free Syria then chooses between a communist people's republic, the Syrian Social Nationalist Party and a restored Hashemite kingdom.

## Route families

| Family | Anchor | End state |
| --- | --- | --- |
| Opening | `SYR_the_general_strike` | The treaty-or-struggle fork at `SYR_crossroads_of_the_levant` |
| Loyalist | `SYR_ratify_the_franco_syrian_treaty` | Equal partner of the French Union, or an independent republic allied to France |
| Independence | `SYR_reject_the_treaty` | Independence by French consent or by war, then the leadership event |
| Communist | `SYR_the_peoples_front` | Union of Arab Soviet Republics |
| Fascist | `SYR_the_syrian_social_nationalist_party` | Greater Syria proclaimed |
| Hashemite | `SYR_the_hashemite_restoration` | The Hashemite Kingdom of Syria |
| Economy | `SYR_the_mandate_economy` | The Levantine Market |
| Army | `SYR_an_army_for_syria` | The National Army |

## Mechanics

- National Resistance meter driven by decisions, with French answers and a crisis that France decides when weak and Syria decides when France is strong.
- A war of independence with spawned militia and a mission to hold Damascus for a negotiated peace.
- Loyalist autonomy growth, a Lebanese settlement, wartime support decisions and a France-has-fallen choice between Free France, Vichy and independence.
- A betrayed-treaty failure state that turns the loyalist route toward the struggle while keeping the republic.

## AI

Syria's AI prefers the treaty while France is a democratic, unthreatened power and its democratic party leads, and turns to the struggle when France weakens or leaves democracy.
The leadership event weighs each movement by its popularity.
France's AI answers unrest with force while strong and with concessions or consent while weakened.
