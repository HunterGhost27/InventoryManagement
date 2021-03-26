
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

UCL = Mods.S7_UI_Components_Library