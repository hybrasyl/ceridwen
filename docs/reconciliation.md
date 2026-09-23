# Reconciliation list

This file lists map data that was reconstructed from indirect sources. Each item needs a check in game or in an editor. Delete an item when you have verified it.

Sources, from most to least reliable:

1. **Midir** (`%LOCALAPPDATA%/erisco/midir/transitions.json`) - warps observed in the live client. Gives the exact source tile and the exact arrival tile.
2. **Kyle scrape** (`worlds.zip` logs) - retail portal records. Gives both tiles.
3. **DAWalker route file** (`WorldMap.dat`) - gives the exact source tile only. It has no arrival tiles, because the walker reads its position from the client after each warp.
4. **da-wizard map images** - portal tiles recovered from the rendered picture. Accurate to about one tile. No arrival tiles.

## Piet Dungeon

57 maps, 143 warps. Every map is reachable from Piet and no link is one-way.

- 19 warps come from Midir and are exact.
- The other 124 warps use a portal tile read from a da-wizard image. Measured against the Midir warps, 6 of 9 comparable tiles matched exactly and 8 of 9 were within one tile.
- **Every arrival tile that does not come from Midir is inferred.** The rule is "one step inward from the portal on the far side". Expect to move some of them. The affected files carry a comment that says so.

Items to check:

| Map | Item |
| --- | --- |
| Piet Dungeon 8-2 | Portal to 9-2 reads (13,22) from the image but Midir observed (11,19). The Midir tile is used. Check which one is the portal. |
| Piet Dungeon 12-3 | One portal marker is unassigned. Its label is damaged and the map graph allows either 11-2 or 11-3. |
| Piet Dungeon 14-3 | One portal marker is unassigned. The graph allows either 13-3 or 15-3. |
| Piet Dungeon 15-4 | One portal marker is unassigned; the label is unreadable. |

Each of those three rooms is already linked from the other side, so nothing is cut off by them.

18 maps were added in this pass: 237, 238, 241, 242, 244, 245, 248, 249, 251-259,
261. pound2017 has no names for these, so the names and sizes come from the Kyle scrape. **254 and 258 are blank files in Chaos-Server**; ceridwen uses the Kyle copies instead. Check that those two rooms look right.

## Chaos

35 maps, 74 links, 34 reachable from Chaos Entrance.

- Forward tiles come from `WorldMap.dat` and are exact.
- **The way back and every arrival tile come from da-wizard's markers.** They are approximate. The files carry a comment that says so.

| Map | Item |
| --- | --- |
| Chaos 34 | Not linked. The walker route ends at "Chaos 34 Portals" (map 4335), which ceridwen does not have. |
| Chaos 5 | Off the walker route. Linked to Chaos 4 and Chaos 6 by number. The tiles are unverified. |
| Chaos 15 | Off the walker route. Linked to Chaos 14 and Chaos 16 by number. The tiles are unverified. |
| Chaos 26 | Off the walker route. Linked to Chaos 25 and Chaos 27 by number. The tiles are unverified. |
| Chaos 1 | No entrance marker in the image. The arrival from Chaos Entrance is a placeholder at (15,15). |
| Chaos Entrance | No entrance marker in the image. The arrival from Chaos 1 is a placeholder at (10,10). |

## Mileth Crypt

109 maps. 86 are wired from the Kyle scrape and are exact. 23 have no warps.

- 102-107 ("Crypt Hidden 1" to "Crypt Hidden 6", 10x10) are reached by quest script in retail. They are expected to have no warps.
- The other 17 (45, 46, 49, 50, 52, 53, 54, 58, 62, 65, 67, 71, 74, 75, 79, 86, 87) are branch rooms that no source covers. da-wizard's crypt pages mark only the descent path: 58 markers for 109 rooms, and Kyle already covers that path. **A walk through these rooms with Midir is the only way to fill them.**

## Abel Dungeon

28 maps, 56 links, 27 reachable from Abel Dungeon 1-1. 17 maps were added in this pass (262-269, 271-279) from Kyle names and Chaos-Server map files.

Both tiles of every link are read from da-wizard's per-level images, so **all of Abel Dungeon is approximate**. The labels beside the markers are small and often merge with the arrow, so the room a marker leads to is decided by the crypt graph from the overview image, with the label only breaking ties.

| Item | Detail |
| --- | --- |
| Abel Dungeon 11-1 | Not linked. Kyle knows the map but da-wizard's chart stops at 10-2. |
| Surface entrance | Wired. Abel Coast (26,31) and (27,30) lead to 1-1 at (22,1); 1-1 (22,0) leads back to Abel Coast (26,32). The Coast tiles come from the world repo's Old Coast, which is the same map file and id as ceridwen's Abel Coast; (22,0) is the only walkable tile on row 0 of 1-1. |
| 12 one-way links | Descent works but the way back is missing where the far room's marker could not be assigned. |
| 5 markers unassigned | The label is unreadable and the graph allows more than one room. |
| 12 arrivals guessed | The far room has no marker back, so the arrival is the middle of the map. |

Unassigned markers:

- Abel Dungeon 3-1: down marker at (27, 15) not assigned (label None, candidates none left)
- Abel Dungeon 5-2: down marker at (25, 36) not assigned (label None, candidates ['Abel Dungeon 6-1', 'Abel Dungeon 6-2'])
- Abel Dungeon 5-2: down marker at (32, 9) not assigned (label None, candidates ['Abel Dungeon 6-1', 'Abel Dungeon 6-2'])
- Abel Dungeon 7-1: up marker at (3, 39) not assigned (label None, candidates none left)
- Abel Dungeon 9-2: up marker at (1, 39) not assigned (label None, candidates none left)

Rooms whose arrival point is a guess:

- Abel Dungeon 2-1: no marker back to Abel Dungeon 1-1
- Abel Dungeon 2-2: no marker back to Abel Dungeon 1-1
- Abel Dungeon 3-1: no marker back to Abel Dungeon 2-1
- Abel Dungeon 3-3: no marker back to Abel Dungeon 2-2
- Abel Dungeon 5-1: no marker back to Abel Dungeon 4-1
- Abel Dungeon 5-1: no marker back to Abel Dungeon 4-2
- Abel Dungeon 5-2: no marker back to Abel Dungeon 4-2
- Abel Dungeon 5-2: no marker back to Abel Dungeon 4-3
- Abel Dungeon 5-2: no marker back to Abel Dungeon 6-1
- Abel Dungeon 5-3: no marker back to Abel Dungeon 4-3
- Abel Dungeon 8-2: no marker back to Abel Dungeon 7-2
- Abel Dungeon 8-3: no marker back to Abel Dungeon 7-3

## Kasmanium Mines

36 level maps, 73 links, 35 reachable from Mine 1-1. Five links are one-way.

Door tiles are read from the map files, so they are exact. Two tilesets, two rules:

- **lod624 tileset.** A door is a sprite pair, and only one half is walkable. 5223/5224 faces east and the **5224** tile is the one to warp from; 5219/5220 faces south and the **5219** tile is. Counted this way, the number of doors matches the number of links on 24 of the 30 maps in this tileset.
- **lod658 tileset.** There are no door sprites. The map is a set of pockets walled off from each other, and a pocket's exits are the map edge it can reach plus the ground clusters that mimic a wall (2763/2765 and 2776/2777). For the pocket that holds the play area this gives, for example, (39,0) and (13,34) on Mine 22-1.

Which door leads where comes from da-wizard's route arrows. The overview chart draws each link in the same colour as the arrow on the per-map image, so no label has to be read. Arrival points are one step in from the door on the far side, so **arrivals are approximate even though the door tiles are exact**.

| Item | Detail |
| --- | --- |
| Mine 29-1 | Not linked. The chart has no arrow for 28-1 to 29-1. |
| 5 one-way links | 8-1 and 7-2 to 8-2; 27-1, 28-2 and 29-1 to 28-1. |
| Mine 8-2, Mine 28-1 | Two doors for three links each, so one link has no door. |
| 6 doors assumed | An unclaimed door paired with the only neighbour that had none. |

Doors assigned by elimination rather than by an arrow:

- Mine 27-2: the door at (27, 2) is assumed to be the way to Mine 26-1
- Mine 3-1: the door at (13, 32) is assumed to be the way to Mine 2-1
- Mine 3-1: the door at (58, 2) is assumed to be the way to Mine 2-2
- Mine 4-1: the door at (46, 99) is assumed to be the way to Mine 3-2
- Mine 4-1: the door at (67, 14) is assumed to be the way to Mine 3-1
- Mine 7-2: the door at (27, 2) is assumed to be the way to Mine 6-2

## Other

- Loures Harbor, Mine and Roton: the Inn and Bank warps are placed as if the maps were still 12x12. Move them to suit the 20x20 layouts.
- Loures Harbor Armor Shop and Loures Harbor Shop 4 are copies of Abel Armor Shop; Loures Harbor Weapon Shop is a copy of Abel Weapon Shop. Shops 1, 2, 3, 5 and 6 are copies of West Rucesion Port Recall Shop.
- Abel Armor Shop 2 (443) still has an internal door that targets "Abel Weapon Shop", not its own pair.
- Tagor village (662) uses the retail map file, and 16 warps sit on tiles that the world repo had altered.
- Nobis has no verified position on the world map; the point is a guess.
