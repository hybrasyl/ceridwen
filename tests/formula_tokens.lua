-- The formula tokens the server defines. A formula that uses any other token
-- evaluates to 0.0 as a whole, and the server does not report it.
--
-- Copied from hybrasyl/server at 6ed8d59a: FormulaParser.Parameterize
-- (hybrasyl/Subsystems/Formulas/FormulaParser.cs) makes each token from a
-- property that has [FormulaVariable]. When the server adds or renames such a
-- property, update this list and the commit above. Remove this file when the
-- server checks formula names at load time (HS-1649).

local tokens = {}

-- StatInfo (hybrasyl/Objects/StatInfo.cs). SOURCE, TARGET and ORIGINALCASTER.
local STAT = {
  "Level", "Experience", "Faith", "Gold", "Ability", "AbilityExp",
  "BaseHp", "BonusHp", "Hp", "BaseMp", "BonusMp", "Mp",
  "BaseStr", "BonusStr", "BaseInt", "BonusInt", "BaseWis", "BonusWis",
  "BaseCon", "BonusCon", "BaseDex", "BonusDex",
  "BaseCrit", "BonusCrit", "Crit", "BaseMagicCrit", "BonusMagicCrit", "MagicCrit",
  "BaseDmg", "BonusDmg", "BaseHit", "BonusHit", "BaseAc", "BonusAc",
  "BaseMr", "BonusMr", "BaseRegen", "BonusRegen",
  "BonusInboundDamageModifier", "InboundDamageModifier",
  "BaseInboundHealModifier", "BonusInboundHealModifier",
  "BonusOutboundDamageModifier", "OutboundDamageModifier",
  "BaseOutboundHealModifier", "BonusOutboundHealModifier", "OutboundHealModifier",
  "BaseReflectMagical", "BonusReflectMagical", "ReflectMagical",
  "BaseReflectPhysical", "BonusReflectPhysical", "ReflectPhysical",
  "BaseExtraGold", "BonusExtraGold", "ExtraGold",
  "BaseDodge", "BonusDodge", "Dodge", "BaseMagicDodge", "BonusMagicDodge", "MagicDodge",
  "BaseExtraXp", "BonusExtraXp", "ExtraXp",
  "BaseExtraItemFind", "BonusExtraItemFind", "ExtraItemFind",
  "BaseExtraFaith", "BonusExtraFaith", "ExtraFaith",
  "BaseLifeSteal", "BonusLifeSteal", "LifeSteal",
  "BaseManaSteal", "BonusManaSteal", "ManaSteal",
  "BaseInboundDamageToMp", "BonusInboundDamageToMp", "InboundDamageToMp",
  "Shield", "MaximumHp", "MaximumMp",
  "Str", "Int", "Wis", "Con", "Dex", "Dmg", "Hit", "Ac", "Mr", "Regen",
}

-- Creature (hybrasyl/Objects/Creature.cs). SOURCE and TARGET only.
local CREATURE = { "WeaponSmallDamage", "WeaponLargeDamage" }

-- MapObject (hybrasyl/Objects/MapObject.cs). MAP.
local MAP = { "X", "Y", "Tiles", "BaseLevel" }

-- Castable and ItemObject have no [FormulaVariable] property, so no CASTABLE or
-- ITEM token exists.

local function add(prefix, names)
  for _, name in ipairs(names) do tokens[prefix .. name:upper()] = true end
end

add("SOURCE", STAT)
add("TARGET", STAT)
add("ORIGINALCASTER", STAT)
add("SOURCE", CREATURE)
add("TARGET", CREATURE)
add("MAP", MAP)

for _, name in ipairs({ "DAMAGE", "RAND_5", "RAND_10", "RAND_100", "RAND_1000", "RANDDOUBLE" }) do
  tokens[name] = true
end

return tokens
