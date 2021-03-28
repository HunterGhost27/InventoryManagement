
----------------------------------------------------------------
--==============================================================

IDENTIFIER = 'S7_InventoryManagement'

---@class MODINFO: ModInfo
---@field ModVersion string
---@field ModSettings table
---@field DefaultSettings table
---@field SubdirPrefix string
MODINFO = Ext.GetModInfo('5ae0e104-3738-4cf6-8099-7d5b4969065d')

--  ========  AUX FUNCTIONS  ========
Ext.Require('AuxFunctions/Index.lua')
--  =================================

--==============================================================
----------------------------------------------------------------

UCL = Mods.S7_UI_Components_Library --  Import UI Components Library

PersistentVars = {} --  PersistentVariables

Channel = {
    QuickAdd = 'S7IMS::ContainerQuickAdd'
}

-- =======
-- ACTIONS
-- =======
ActionID = {
    Unpack = 27801,
    Repack = 27802,
}

--  ==========
--  CONTAINERS
--  ==========

Container = {
    Accessories = 'LOOT_S7_Container_Accessories',
    Arrows = 'LOOT_S7_Container_Arrows',
    BladedWeapons = 'LOOT_S7_Container_BladedWeapons',
    BluntWeapons = 'LOOT_S7_Container_BluntWeapons',
    Bombs = 'LOOT_S7_Container_Bombs',
    Books = 'LOOT_S7_Container_Books',
    BootsBelts = 'LOOT_S7_Container_BootsBelts',
    ChestPants = 'LOOT_S7_Container_ChestPants',
    CoinPursesWares = 'LOOT_S7_Container_CoinPursesWares',
    Essence = 'LOOT_S7_Container_Essence',
    Food = 'LOOT_S7_Container_Food',
    HelmetGloves = 'LOOT_S7_Container_HelmetGloves',
    Jewelry_corner = 'LOOT_S7_Container_Jewelry',
    Keys = 'LOOT_S7_Container_Keys',
    MagicWeapons = 'LOOT_S7_Container_MagicWeapons',
    Materials = 'LOOT_S7_Container_Materials',
    Potions = 'LOOT_S7_Container_Potions',
    QuestItems = 'LOOT_S7_Container_QuestItems',
    RangedWeapons = 'LOOT_S7_Container_RangedWeapons',
    Runes = 'LOOT_S7_Container_Runes',
    Scrolls = 'LOOT_S7_Container_Scrolls',
    Sellbag = 'LOOT_S7_Container_Sellbag',
    Shields = 'LOOT_S7_Container_Shields',
    Skillbooks = 'LOOT_S7_Container_Skillbooks'
}