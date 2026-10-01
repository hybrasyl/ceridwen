# Hybrasyl loot: guide for content authors

This guide describes server `main` at commit `6ed8d59a` (2026-08-23). When a trap in section 7 is a server bug, the trap names its ticket. When a ticket closes, update its trap.

## 1. Scope

This guide is for people who write loot XML: `<Loot>`, `<LootSet>`, `<Table>`, `<Items>` and `<Item>`. It describes what the server does now. In some places the server does not do what the attribute names suggest. Section 7 lists these places.

## 2. How a kill turns into loot

The server calculates loot when the monster spawns, not when it dies. A monster keeps its loot until it dies. A change to the XML does not change monsters that are already on the map.

At spawn, the server adds three loot lists:

1. The spawn loot. For a spawn written directly on a map, this is the `<Loot>` of that `<Spawn>`. For a spawn that comes from `<Spawn Import="group"/>`, this is the `<Loot>` of the imported spawn group.
2. The creature loot. This is the `<Loot>` of the `<Creature>`, or of the `<Type>` when the spawn names a subtype.
3. The map loot. This is the `<Loot>` of the map's own `<SpawnGroup>` element.

Each `<Loot>` contains `<Set>` imports and `<Table>` elements. Each table that "fires" gives its `<Gold>`, its `<Xp>`, and the result of each `<Items>` list. Each `<Items>` list gives its `Always` entries plus one or more random picks.

    kill loot = spawn <Loot> + creature <Loot> + map <SpawnGroup><Loot>
      <Loot>
        <Set Name="X" Rolls Chance/>   -> LootSet "X" -> its <Table>s
        <Table Rolls Chance>           -> direct table
      <Table> fires
        <Items> -> Always entries + random picks
        <Gold>  -> amount
        <Xp>    -> amount

When the monster dies, the items and gold drop on its tile. The server gives loot only when a player who hit the monster, or a member of that player's group, gets the kill.

## 3. Element reference (current behavior)

| Element | Attribute | What it does now |
|---|---|---|
| `<Set>` in `<Loot>` | `Name` | Names a LootSet. |
| `<Set>` | `Rolls` | Absent or 0: every table in the set fires one time, and the server ignores all other `Rolls`/`Chance` in the set. N > 0: the set gets N attempts. |
| `<Set>` | `Chance` | Chance of each set attempt. Absent means 0, so the set never fires. |
| `<Table>` in a LootSet | `Rolls`, `Chance` | Read only when the import has `Rolls` > 0. Rolls absent or 0: fires one time on each set hit. Rolls N: N attempts at `Chance`. |
| `<Table>` in `<Loot>` | `Rolls`, `Chance` | Rolls absent or 0: fires one time. Rolls N: **N + 1** attempts at `Chance`. |
| `<Items>` | `Rolls`, `Chance` | Makes `Rolls` + 1 attempts at `Chance`. Gives one random pick per success, and **at least one pick**. |
| `<Item>` | `Always` | Added each time the list is evaluated. Not part of the random picks. |
| `<Item>` | `Max` | The list keeps at most `Max` of this item name. A pick above `Max` is lost. |
| `<Item>` | `Unique` | This entry is kept at most one time. A repeat pick is lost. |
| `<Item>` | `Variants` | Picks one listed group at random, then one variant in that group at random. |
| `<Gold>`, `<Xp>` in `<Table>` | `Min`, `Max` | Max 0: gives `Min`. Otherwise a random whole number from `Min` to `Max`, both included. |
| `<Loot>` | `Xp` | Ignored. |
| `<Gold>` in `<Loot>` | `Min`, `Max` | Ignored. |
| any | `InInventory` | Ignored. |

`Chance` is a fraction from 0 to 1. It is not a percentage. `Chance="0.05"` is 5%. `Chance="5"` always succeeds.

## 4. The safe form

Use this form for all new loot. It gives a clear probability for each drop, and it does not change if the server fixes the problems in section 7.

1. Put the drops in a LootSet.
2. Import the LootSet with `Rolls="1" Chance="1"`.
3. In the LootSet, give each table no `Rolls` and no `Chance` (the table always fires), or `Rolls="1" Chance="p"` (the table fires with probability p).
4. Give each `<Items>` list no `Rolls` and no `Chance`. The list then gives exactly one pick.
5. Put one `<Item>` in the list for one item. Put several `<Item>` entries in the list for a uniform pick from those items.

Why this works:

- The import makes one attempt at Chance 1. The set therefore hits one time on each kill.
- A set table with `Rolls="1"` makes one attempt at its own `Chance`.
- An `<Items>` list with no `Rolls`/`Chance` makes one attempt at Chance 0, which fails. The list then gives its one guaranteed pick.
- Each table makes its own attempt. Tables in the set are independent.

## 5. Recipes

All examples validate against the XSDs. The namespace is `http://www.hybrasyl.com/XML/Hybrasyl/2020-02`.

### 5.1 Item X with probability p, independently

Use one table for each item. The items drop independently. One kill can drop both.

    <LootSet xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02" Name="Bat Drops">
      <!-- Bat's Wing: 189 drops in 252 kills = 0.75 -->
      <Table Rolls="1" Chance="0.75">
        <Items>
          <Item>Bat's Wing</Item>
        </Items>
      </Table>
      <!-- Pearl Necklace: 1 drop in 252 kills = 0.004 -->
      <Table Rolls="1" Chance="0.004">
        <Items>
          <Item>Pearl Necklace</Item>
        </Items>
      </Table>
    </LootSet>

Import it on the creature:

    <Creature xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02" Name="Bat" Sprite="1" BehaviorSet="Critter">
      <Loot>
        <Set Name="Bat Drops" Rolls="1" Chance="1" />
      </Loot>
      <Types>
        <!-- A subtype does not get the parent loot. Repeat the import. -->
        <Type Name="Vampire Bat" Sprite="2" BehaviorSet="Critter">
          <Loot>
            <Set Name="Bat Drops" Rolls="1" Chance="1" />
          </Loot>
        </Type>
      </Types>
    </Creature>

Or import it on a spawn group:

    <SpawnGroup xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02" Name="Bat Cave" BaseLevel="5">
      <Spawns>
        <Spawn Name="Bat">
          <Spec MaxCount="10" Interval="30" />
        </Spawn>
      </Spawns>
      <Loot>
        <Set Name="Bat Drops" Rolls="1" Chance="1" />
      </Loot>
    </SpawnGroup>

Do not import the same set on both the creature and the spawn group. The server adds both, so the drops double.

### 5.2 Exactly one of these items, uniformly, on each kill

    <Table>
      <Items>
        <Item>Rotten Apple</Item>
        <Item>Rotten Tomato</Item>
        <Item>Mold</Item>
      </Items>
    </Table>

Each item has probability 1/3.

### 5.3 One of these items, with probability p in total

    <Table Rolls="1" Chance="0.1">
      <Items>
        <Item>Spinel Ring</Item>
        <Item>Talos Ring</Item>
      </Items>
    </Table>

The table fires on 10% of kills. Each ring has probability 0.05.

### 5.4 Weighted pick

There is no `Weight` attribute. Write an entry two or more times to give it more weight.

    <Table Rolls="1" Chance="0.5">
      <Items>
        <Item>Wolf Fur</Item>
        <Item>Wolf Fur</Item>
        <Item>Wolf Fang</Item>
      </Items>
    </Table>

Wolf Fur has probability 0.5 × 2/3 = 0.333. Wolf Fang has probability 0.5 × 1/3 = 0.167. Do not use `Unique` for this: `Unique` does not stop a second entry with the same name.

### 5.5 Always drop X

In a LootSet that you import with `Rolls="1" Chance="1"`, use a table with no `Rolls` and no `Chance`:

    <Table>
      <Items>
        <Item>Wolf Pelt</Item>
      </Items>
    </Table>

You can also put this table directly in the creature `<Loot>`. A direct table with no `Rolls` fires one time:

    <Creature xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02" Name="Quest Wolf" Sprite="3" BehaviorSet="Critter">
      <Loot>
        <Table>
          <Items>
            <Item>Wolf Pelt</Item>
          </Items>
        </Table>
      </Loot>
    </Creature>

Do not use `Always="true"` as the only entry in a list (see 7.6).

### 5.6 Gold

Gold on each kill, from 10 to 50:

    <Table>
      <Gold Min="10" Max="50" />
    </Table>

Gold of exactly 100 on 25% of kills:

    <Table Rolls="1" Chance="0.25">
      <Gold Min="100" />
    </Table>

In a `<Table>`, the order is `<Items>`, then `<Gold>`, then `<Xp>`. Keep `Max` equal to or larger than `Min`. Strong and weak spawns change gold by up to 3%.

### 5.7 Variant drops

The item must declare each group that you name in `Variants`.

    <Table Rolls="1" Chance="0.05">
      <Items>
        <Item Variants="consecrated">Iron Ring</Item>
      </Items>
    </Table>

`Variants` takes variant group names, such as `consecrated`, not item flag names, such as `Consecratable`. When you name several groups, the server picks one group at random, then one variant in it. When the item does not declare the picked group, nothing drops. You cannot name one specific variant yet.

To drop the plain item or a variant, write two entries:

    <Table Rolls="1" Chance="0.05">
      <Items>
        <Item>Iron Ring</Item>
        <Item Variants="consecrated">Iron Ring</Item>
      </Items>
    </Table>

The table fires on 5% of kills. Half of these give the plain ring. The other half give a consecrated variant.

## 6. Converting an observed rate into XML

1. Divide the drops by the kills. The result is p.
2. Write p as a fraction from 0 to 1. Use three significant digits.
3. Put p in `Chance` on a set table with `Rolls="1"` (recipe 5.1).

| Observed | p | XML |
|---|---|---|
| 252 in 252 kills | 1 | `<Table>` (no `Rolls`, no `Chance`) |
| 189 in 252 kills | 0.75 | `<Table Rolls="1" Chance="0.75">` |
| 63 in 252 kills | 0.25 | `<Table Rolls="1" Chance="0.25">` |
| 25 in 252 kills | 0.0992 | `<Table Rolls="1" Chance="0.0992">` |
| 5 in 252 kills | 0.0198 | `<Table Rolls="1" Chance="0.0198">` |
| 1 in 252 kills | 0.00397 | `<Table Rolls="1" Chance="0.00397">` |
| 0 in 252 kills | unknown | No table. The true rate is probably below 0.012. |

Small counts are not exact. At 252 kills, "189 in 252" means a true rate of about 0.70 to 0.80. "1 in 252" means a true rate of about 0.0001 to 0.022. Use more kills for rare items when you can.

The safe form drops at most one of an item per kill. If retail can drop two of the same item on one kill, "drops ÷ kills" is a mean count and not a probability. For a mean count above 1, use two tables for the item.

## 7. Traps

### 7.1 A set import without Rolls ignores all chances in the set

`<Set Name="X"/>` has `Rolls` 0. The server then fires every table in set X on every kill. It ignores the table `Rolls` and `Chance`, and the import `Chance`. Always write `Rolls="1" Chance="1"` on an import. Ticket: HS-1659.

Example: the set below drops a ring on 10% of kills when you import it with `Rolls="1" Chance="1"`. When you import it with `<Set Name="Rings"/>`, it drops a ring on every kill.

    <LootSet xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02" Name="Rings">
      <Table Rolls="1" Chance="0.1">
        <Items>
          <Item>Spinel Ring</Item>
        </Items>
      </Table>
    </LootSet>

### 7.2 A set import with Rolls but no Chance never fires

`<Set Name="X" Rolls="1"/>` has `Chance` 0. Always write `Chance`. Ticket: HS-1659.

### 7.3 A direct table gets one more attempt than its Rolls

A `<Table Rolls="1" Chance="0.5">` directly in `<Loot>` makes two attempts. It fires on 75% of kills, and on 25% of kills it fires two times. A table in a LootSet does not have this problem. Put chances in a LootSet. Ticket: HS-1657.

### 7.4 An Items list gives at least one pick, and Rolls gives one more attempt

`<Items Rolls="4" Chance="0.25">` makes five attempts. It always gives at least one pick. The mean is 1.49 picks. The list `Chance` cannot make the list give nothing. Use the table `Chance` to control whether anything drops. Keep `Rolls` and `Chance` off `<Items>`. Ticket: HS-1658.

### 7.5 Max and Unique do not pick again

When a pick breaks `Max` or `Unique`, the server discards the pick. It does not pick another item. `Max` counts within one evaluation of one list only. Ticket: HS-1658.

### 7.6 A list with only Always entries stops the spawn group

The server needs at least one entry without `Always="true"`. Without one, it gives an error on each spawn attempt. After more than five errors it disables the whole spawn group. The same thing happens when `Max` is smaller than `Min` in `<Gold>` or `<Xp>`, or when a list has a very large `Rolls` (about 100 or more). Ticket: HS-1660.

### 7.7 An imported spawn group erases the loot of its spawns

`<Spawn Import="group"/>` replaces the `<Loot>` of each spawn in the group with the `<Loot>` of the group. Do not put `<Loot>` on a `<Spawn>` inside a spawn group. Put it on the group, or on the creature. Tickets: HS-1573, HS-1655.

All maps that import one spawn group also share one spawn timer for each spawn in it. Until HS-1655 is fixed, give each map its own spawn group, or write the spawns directly in the map. An imported group's `BaseLevel` is not used either (HS-1656), so put `<Base Level>` on each spawn.

### 7.8 A subtype does not inherit the parent loot

A `<Type>` in `<Types>` is a separate creature for loot. Write a `<Loot>` on each `<Type>` that must drop loot. Ticket: HTOO-519.

### 7.9 Some attributes do nothing

The server ignores `<Loot Xp="…">`, `<Gold>` directly in `<Loot>`, and every `InInventory`. Put gold and XP in a `<Table>`. Tickets: HS-1661, HS-1378.

### 7.10 A table Xp replaces the default experience

When a monster's loot gives no XP, the server calculates XP from the monster level. When any table gives XP, that XP replaces the calculated value. It does not add to it.

### 7.11 A variant group that the item does not declare drops nothing

Check each name in `Variants` against the `<Variants>` of the item. The names are case-sensitive. Tickets: WLD-37, HS-1251.

### 7.12 Chance is a fraction

`Chance="25"` does not mean 25%. It always succeeds. Use `Chance="0.25"`. `Chance="0"` never succeeds.

### 7.13 Creidhne keeps only the first table of a loot set

When Creidhne saves a loot set, it keeps the first `<Table>` and the first `<Items>` list only. It deletes the other tables. The safe form (section 4) uses one table for each item, so a save in Creidhne removes all items but one. Edit loot sets with more than one table in a text editor until HTOO-522 is fixed.

## 8. Test your loot

Privileged users can whisper `#` to test loot.

- `evallootset "<set name>" <N>` gives the total loot of N set hits. Each hit uses the table `Rolls` and `Chance`. This is the same as N kills with the import `Rolls="1" Chance="1"`. Divide each count by N.
- `evalloot "<spawn group>" "<spawn>" <N>` gives the total loot of N + 1 evaluations. When a map imports the spawn group, this command counts the group loot two times. Use `evallootset` for rate checks. Ticket: HS-1662.

Validate each file against the XSDs before you commit it.

## 9. Formula summary

- Set table in the safe form: count per kill is 1 with probability p and 0 otherwise.
- `<Items Rolls="r" Chance="c">`: picks = max(1, successes in r + 1 attempts). Mean = (r + 1)·c + (1 − c)^(r+1).
- Direct `<Table Rolls="R" Chance="C">`, R > 0: firings = successes in R + 1 attempts. P(at least one) = 1 − (1 − C)^(R+1).
- Import `Rolls="S" Chance="Q"`, set table `Rolls="R" Chance="C"`, R > 0: P(at least one firing) = 1 − (1 − Q·(1 − (1 − C)^R))^S.
- Import without `Rolls`: each table fires exactly one time.
