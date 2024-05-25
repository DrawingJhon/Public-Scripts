-- NOTE (READ!!): This script doesn't work on voidacity's script builder 
--                since it crashes your game, but it's usable on other
--                script builders like fancy dev's or nexure's.
--                (it just doesn't work on voidacity only)

--[[
	
	
	
   ▓▒▒▓▓  ░▓▒▒██▒▒▓█▒▒▓▓ █▒▒▓█▒▒▒▒▒▒▒█▓▒▒▒▒▒▒▒█▒▓▒▒▒▒▒▓█▒▒▒▒▒▒▒█▓▒▒▒▓▒▒▓█▒▒▒▒▒▓▒▓░
   ▓  ░█▒ ▓░  ▓▓  ░█  ░█░▒  ▒▒       █░       █ ░     ▒▓       ▓▒       █       ░░
  ░░ ░ ▒██░░░ █░  ▓▓  ░░█░  ▓▒  ▒█████░  ▓█████░░ ▓▓  ░█ ▒█░█▓ ▒▓  ░███████▓   ██░
  ▓    ▓█▓  ▒▒█   █▒   ░█   ▓▒  ▒█████░  ▓█████░░ ▓▓  ░█  ▒█▓░ ░▓   ▓███████   █▓ 
  ▓    ░░    ▒█   █▒    ░   █░   ░░░░█░  ▓█████░     ▒██░ ▒██▒ ░█     ░ ░███   ▒░ 
 ▒░  ░░      ▓▓   █░  ▓▒    █░   ░░ ░█░  ▓█████░       █░ ░░ ░  █░     ░ ███░  ░▒ 
 ▒░  ▓▓ ▒▓   █░  ▒█   █▒ ░  █   ▓█████░  ▓    █░  ▒▓   █▒   ░   █▒  ▒█▓█████▓  ░▒ 
 ▒░▒░█▒▒█▓   █░  ▓█   ██░ ░ █░  ▓█████░  ▓█████░  ▒█ ░ █▒  ▒█ ░ █▒  ░███▓███▓░  ▒ 
░▒░ ▒█▓ ▒▒  ▒█░  ▓▓  ░██   ░▓ ▒    ░ █░       █░  ▒█   ▓▒  ░█   ▒▓   ███ ▓███░  ▒░
▒░ ░▓██▒░░  ▓▓   █▒  ▒██   ▓▓ ░   ░ ░█░     ░ █░  ▒█   ▓▓   █░  ▒█   █▓░ ░███▒  ░▒
▒▒  ▒███░▒  ░█   █▓  ░██░  ▒█ ░      █░     ░ █░  ▒█   █▒  ░█   ▓▓  ░█   ░██▓▒  ▓░
 ▒▒  ▒██▓▓▒  ▒▓   █░  ▓█▓   █░      ▒█░       █░  ▓▓  ░█░  ▓▒  ░█▒  ▓     ▓█▒░ ▒▒ 
  ▒▒░ █▓  ▓▒░▒█▒░░▓█░░▒█▒▒░░▓▓░▒▒▒░░▒█▒░░░░░░░█▒░▒█▓░░▓█▒░▒█░░░█▓░░▓▒     ▓█░░▒▒  
   ░▒▒▒░   ▒░░▒▒░░░░░░░░ ▒░░░▒▒▒▒▒▒▒▒░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒░▒▒▒░░░░      ░░░▒░   
                           ASCII Art Generators are cool :)



]]

-- Scroll down for changelog...

-- ORIGINAL CREATOR: Depr1
-- EDITED BY: DrawingJhon

-- If this script isn't on pastebin or the user who uploaded this isn't called "Delros12"
-- (and yes my pastebin account is Delros12) or the link is not https://pastebin.com/2NNDTLjL
-- then this is not the original link of this script. 

-- The original link of the script gets edited constantly for updates, if you use the original
-- link you will be able to enjoy the most recent updates of this script without changing to 
-- another link which contains updated script.

-- Controls: Q to sneak, use the keypad numbers 1-9 to change blocks, 
-- choose a empty slot if you want to remove a block, E to open creative
-- inventory, right-click to destroy a block in your toolbar in creative
-- inventory, R to make camera face your character's front or back.

-- You will become steve when you use this script, if you die after 
-- using this script, keep trying to use it or wait 60 seconds 
-- (it doesn't work at first but eventually it will)

-- Enjoy! :)

local updateHand = false
local Changelog = [[

   Redstone coming soon. (not... sorry)
   Note (Read!): It will be a very long while till this script gets 
   updated again, i stopped updating this since im focusing more on other things
   like C++ programming and game development, i'm not really that active much
   in roblox (and if im off im probably programming), so yeah, maybe in a
   million years i'll come back to update the script again (:P).
   09/03/2018:
   + Added the heart bar.
   + Added death animation.
   * Your camera now shakes like in minecraft when hurt.
   * Toolbar Selection GUI now is accurate.

   02/03/2018:
   * Fixed a bug with the textures.

   01/03/2018:
   + Added a global grid.
   + Added something that i'm not sure how to describe.
   * Punching Animation in first person is now more accurate.

   17/02/2018:
   + You can't break your neck anymore (360 head you know)
   + Added this changelog
   - Removed the name tag, since it causes it to get banned on
     some servers for some reason (really voidacity?).
   * Walking animation is now more accurate

   Note: It's been a while since i don't update the script, but i'll
         get back to updating it.
	
   05/02/2018:
   + Added gravity to sand and gravel (WARNING: Can be laggy!)

   04/02/2018:
   + Added creative inventory
   + Added 31 blocks (that's a lot, but not near minecraft's level)
   + Added sprinting (i'll add footsteps and particles later)
   - Removed Herobrine
   * Fixed a bug where the hand dissapears if u look down while sneaking
   * Fixed? (not sure) a bug where if u ran the script you would die

   01/02/2018:
   + Added the hand that appears on minecraft when ur first person
   + Added a walking animation to the hand
   + Punching animation added to the hand
   + Camera bobbing
   + Sneaking now lowers your camera just like in minecraft
   + Blocks now have sounds (i chose the ones that are the closest to minecraft sounds)
   + When a block is broken, particles will fall from it
]]

workspace:WaitForChild("Camera"):ClearAllChildren()
local RS = game:GetService("RunService").RenderStepped
local targetName = game.Players.LocalPlayer.Name
local player = game.Players:FindFirstChild(targetName)

local creativeInventory = {
	{
		name = "Dirt",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152569532",
		backTex = "rbxassetid://152569532",
		topTex = "rbxassetid://152569532",
		bottomTex = "rbxassetid://152569532",
		leftTex = "rbxassetid://152569532",
		rightTex = "rbxassetid://152569532",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Grass",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://96430337",
		backTex = "rbxassetid://96430337",
		topTex = "rbxassetid://96430265",
		bottomTex = "rbxassetid://179655033",
		leftTex = "rbxassetid://96430337",
		rightTex = "rbxassetid://96430337",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Sand",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://347007448",
		backTex = "rbxassetid://347007448",
		topTex = "rbxassetid://347007448",
		bottomTex = "rbxassetid://347007448",
		leftTex = "rbxassetid://347007448",
		rightTex = "rbxassetid://347007448",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = true,
		objectType = "Block"
	},
	{
		name = "Gravel",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151701568",
		backTex = "rbxassetid://151701568",
		topTex = "rbxassetid://151701568",
		bottomTex = "rbxassetid://151701568",
		leftTex = "rbxassetid://151701568",
		rightTex = "rbxassetid://151701568",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = true,
		objectType = "Block"
	},
	{
		name = "Stone",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://75880927",
		backTex = "rbxassetid://75880927",
		topTex = "rbxassetid://75880927",
		bottomTex = "rbxassetid://75880927",
		leftTex = "rbxassetid://75880927",
		rightTex = "rbxassetid://75880927",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Diamond Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://57928490",
		backTex = "rbxassetid://57928490",
		topTex = "rbxassetid://57928490",
		bottomTex = "rbxassetid://57928490",
		leftTex = "rbxassetid://57928490",
		rightTex = "rbxassetid://57928490",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Diamond Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://56749955",
		backTex = "rbxassetid://56749955",
		topTex = "rbxassetid://56749955",
		bottomTex = "rbxassetid://56749955",
		leftTex = "rbxassetid://56749955",
		rightTex = "rbxassetid://56749955",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
{
		name = "Emerald Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152410853",
		backTex = "rbxassetid://152410853",
		topTex = "rbxassetid://152410853",
		bottomTex = "rbxassetid://152410853",
		leftTex = "rbxassetid://152410853",
		rightTex = "rbxassetid://152410853",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Emerald Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152410868",
		backTex = "rbxassetid://152410868",
		topTex = "rbxassetid://152410868",
		bottomTex = "rbxassetid://152410868",
		leftTex = "rbxassetid://152410868",
		rightTex = "rbxassetid://152410868",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Obsidian",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://112560322",
		backTex = "rbxassetid://112560322",
		topTex = "rbxassetid://112560322",
		bottomTex = "rbxassetid://112560322",
		leftTex = "rbxassetid://112560322",
		rightTex = "rbxassetid://112560322",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Gold Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572128",
		backTex = "rbxassetid://152572128",
		topTex = "rbxassetid://152572128",
		bottomTex = "rbxassetid://152572128",
		leftTex = "rbxassetid://152572128",
		rightTex = "rbxassetid://152572128",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Gold Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572121",
		backTex = "rbxassetid://152572121",
		topTex = "rbxassetid://152572121",
		bottomTex = "rbxassetid://152572121",
		leftTex = "rbxassetid://152572121",
		rightTex = "rbxassetid://152572121",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Iron Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572134",
		backTex = "rbxassetid://152572134",
		topTex = "rbxassetid://152572134",
		bottomTex = "rbxassetid://152572134",
		leftTex = "rbxassetid://152572134",
		rightTex = "rbxassetid://152572134",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Iron Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://132879562",
		backTex = "rbxassetid://132879562",
		topTex = "rbxassetid://132879562",
		bottomTex = "rbxassetid://132879562",
		leftTex = "rbxassetid://132879562",
		rightTex = "rbxassetid://132879562",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Redstone Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://136260219",
		backTex = "rbxassetid://136260219",
		topTex = "rbxassetid://136260219",
		bottomTex = "rbxassetid://136260219",
		leftTex = "rbxassetid://136260219",
		rightTex = "rbxassetid://136260219",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Redstone Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572209",
		backTex = "rbxassetid://152572209",
		topTex = "rbxassetid://152572209",
		bottomTex = "rbxassetid://152572209",
		leftTex = "rbxassetid://152572209",
		rightTex = "rbxassetid://152572209",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Coal Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152527418",
		backTex = "rbxassetid://152527418",
		topTex = "rbxassetid://152527418",
		bottomTex = "rbxassetid://152527418",
		leftTex = "rbxassetid://152527418",
		rightTex = "rbxassetid://152527418",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Coal Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572101",
		backTex = "rbxassetid://152572101",
		topTex = "rbxassetid://152572101",
		bottomTex = "rbxassetid://152572101",
		leftTex = "rbxassetid://152572101",
		rightTex = "rbxassetid://152572101",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Bedrock",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://75881126",
		backTex = "rbxassetid://75881126",
		topTex = "rbxassetid://75881126",
		bottomTex = "rbxassetid://75881126",
		leftTex = "rbxassetid://75881126",
		rightTex = "rbxassetid://75881126",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Cobblestone",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152572105",
		backTex = "rbxassetid://152572105",
		topTex = "rbxassetid://152572105",
		bottomTex = "rbxassetid://152572105",
		leftTex = "rbxassetid://152572105",
		rightTex = "rbxassetid://152572105",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Mossy Stone Brick",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://61826751",
		backTex = "rbxassetid://61826751",
		topTex = "rbxassetid://61826751",
		bottomTex = "rbxassetid://61826751",
		leftTex = "rbxassetid://61826751",
		rightTex = "rbxassetid://61826751",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Cracked Stone Brick",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151802087",
		backTex = "rbxassetid://151802087",
		topTex = "rbxassetid://151802087",
		bottomTex = "rbxassetid://151802087",
		leftTex = "rbxassetid://151802087",
		rightTex = "rbxassetid://151802087",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Chiseled Stone Brick",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151802074",
		backTex = "rbxassetid://151802074",
		topTex = "rbxassetid://151802074",
		bottomTex = "rbxassetid://151802074",
		leftTex = "rbxassetid://151802074",
		rightTex = "rbxassetid://151802074",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Stone Brick",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://61826773",
		backTex = "rbxassetid://61826773",
		topTex = "rbxassetid://61826773",
		bottomTex = "rbxassetid://61826773",
		leftTex = "rbxassetid://61826773",
		rightTex = "rbxassetid://61826773",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Nether Brick",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151802104",
		backTex = "rbxassetid://151802104",
		topTex = "rbxassetid://151802104",
		bottomTex = "rbxassetid://151802104",
		leftTex = "rbxassetid://151802104",
		rightTex = "rbxassetid://151802104",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Granite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776467",
		backTex = "rbxassetid://151776467",
		topTex = "rbxassetid://151776467",
		bottomTex = "rbxassetid://151776467",
		leftTex = "rbxassetid://151776467",
		rightTex = "rbxassetid://151776467",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Diorite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776452",
		backTex = "rbxassetid://151776452",
		topTex = "rbxassetid://151776452",
		bottomTex = "rbxassetid://151776452",
		leftTex = "rbxassetid://151776452",
		rightTex = "rbxassetid://151776452",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Andesite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776422",
		backTex = "rbxassetid://151776422",
		topTex = "rbxassetid://151776422",
		bottomTex = "rbxassetid://151776422",
		leftTex = "rbxassetid://151776422",
		rightTex = "rbxassetid://151776422",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Polished Granite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776506",
		backTex = "rbxassetid://151776506",
		topTex = "rbxassetid://151776506",
		bottomTex = "rbxassetid://151776506",
		leftTex = "rbxassetid://151776506",
		rightTex = "rbxassetid://151776506",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Polished Diorite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776533",
		backTex = "rbxassetid://151776533",
		topTex = "rbxassetid://151776533",
		bottomTex = "rbxassetid://151776533",
		leftTex = "rbxassetid://151776533",
		rightTex = "rbxassetid://151776533",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{		
		name = "Polished Andesite",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151776506",
		backTex = "rbxassetid://151776506",
		topTex = "rbxassetid://151776506",
		bottomTex = "rbxassetid://151776506",
		leftTex = "rbxassetid://151776506",
		rightTex = "rbxassetid://151776506",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Brick Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://59389191",
		backTex = "rbxassetid://59389191",
		topTex = "rbxassetid://59389191",
		bottomTex = "rbxassetid://59389191",
		leftTex = "rbxassetid://59389191",
		rightTex = "rbxassetid://59389191",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Packed Ice",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152528023",
		backTex = "rbxassetid://152528023",
		topTex = "rbxassetid://152528023",
		bottomTex = "rbxassetid://152528023",
		leftTex = "rbxassetid://152528023",
		rightTex = "rbxassetid://152528023",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Ice Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 1;
		frontTex = "rbxassetid://118555586",
		backTex = "rbxassetid://118555586",
		topTex = "rbxassetid://118555586",
		bottomTex = "rbxassetid://118555586",
		leftTex = "rbxassetid://118555586",
		rightTex = "rbxassetid://118555586",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Netherrack",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151802119",
		backTex = "rbxassetid://151802119",
		topTex = "rbxassetid://151802119",
		bottomTex = "rbxassetid://151802119",
		leftTex = "rbxassetid://151802119",
		rightTex = "rbxassetid://151802119",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "End Stone",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://151802091",
		backTex = "rbxassetid://151802091",
		topTex = "rbxassetid://151802091",
		bottomTex = "rbxassetid://151802091",
		leftTex = "rbxassetid://151802091",
		rightTex = "rbxassetid://151802091",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Glass Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 1;
		frontTex = "rbxassetid://152239003",
		backTex = "rbxassetid://152239003",
		topTex = "rbxassetid://152239003",
		bottomTex = "rbxassetid://152239003",
		leftTex = "rbxassetid://152239003",
		rightTex = "rbxassetid://152239003",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Glowstone",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://54790811",
		backTex = "rbxassetid://54790811",
		topTex = "rbxassetid://54790811",
		bottomTex = "rbxassetid://54790811",
		leftTex = "rbxassetid://54790811",
		rightTex = "rbxassetid://54790811",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Bookshelf",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://118554092",
		backTex = "rbxassetid://118554092",
		topTex = "rbxassetid://346201871",
		bottomTex = "rbxassetid://346201871",
		leftTex = "rbxassetid://118554092",
		rightTex = "rbxassetid://118554092",
		displayTex = "",
		sound = "rbxassetid://507863457",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Oak Wood Planks",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://346201871",
		backTex = "rbxassetid://346201871",
		topTex = "rbxassetid://346201871",
		bottomTex = "rbxassetid://346201871",
		leftTex = "rbxassetid://346201871",
		rightTex = "rbxassetid://346201871",
		displayTex = "",
		sound = "rbxassetid://507863457",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Oak Log",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://71445924",
		backTex = "rbxassetid://71445924",
		topTex = "rbxassetid://152538557",
		bottomTex = "rbxassetid://152538557",
		leftTex = "rbxassetid://71445924",
		rightTex = "rbxassetid://71445924",
		displayTex = "",
		sound = "rbxassetid://507863457",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Oak Leaves",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 1;
		frontTex = "rbxassetid://151708391",
		backTex = "rbxassetid://151708391",
		topTex = "rbxassetid://151708391",
		bottomTex = "rbxassetid://151708391",
		leftTex = "rbxassetid://151708391",
		rightTex = "rbxassetid://151708391",
		displayTex = "",
		sound = "rbxassetid://507863457", 
		-- couldn't find a leaves sound for this one, sorry lol
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	}
}
local toolBar = {
	{
		name = "Dirt Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://152569532",
		backTex = "rbxassetid://152569532",
		topTex = "rbxassetid://152569532",
		bottomTex = "rbxassetid://152569532",
		leftTex = "rbxassetid://152569532",
		rightTex = "rbxassetid://152569532",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Grass Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://96430337",
		backTex = "rbxassetid://96430337",
		topTex = "rbxassetid://96430265",
		bottomTex = "rbxassetid://179655033",
		leftTex = "rbxassetid://96430337",
		rightTex = "rbxassetid://96430337",
		displayTex = "",
		sound = "rbxassetid://1102186681",
		soundVol = 1.25,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Stone",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://75880927",
		backTex = "rbxassetid://75880927",
		topTex = "rbxassetid://75880927",
		bottomTex = "rbxassetid://75880927",
		leftTex = "rbxassetid://75880927",
		rightTex = "rbxassetid://75880927",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Diamond Ore",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://57928490",
		backTex = "rbxassetid://57928490",
		topTex = "rbxassetid://57928490",
		bottomTex = "rbxassetid://57928490",
		leftTex = "rbxassetid://57928490",
		rightTex = "rbxassetid://57928490",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Diamond Block",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://56749955",
		backTex = "rbxassetid://56749955",
		topTex = "rbxassetid://56749955",
		bottomTex = "rbxassetid://56749955",
		leftTex = "rbxassetid://56749955",
		rightTex = "rbxassetid://56749955",
		displayTex = "",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Oak Wood Planks",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://346201871",
		backTex = "rbxassetid://346201871",
		topTex = "rbxassetid://346201871",
		bottomTex = "rbxassetid://346201871",
		leftTex = "rbxassetid://346201871",
		rightTex = "rbxassetid://346201871",
		displayTex = "",
		sound = "rbxassetid://507863457",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	},
	{
		name = "Oak Log",
		size = Vector3.new(2.6, 2.6, 2.6),
		transparency = 0;
		frontTex = "rbxassetid://71445924",
		backTex = "rbxassetid://71445924",
		topTex = "rbxassetid://152538557",
		bottomTex = "rbxassetid://152538557",
		leftTex = "rbxassetid://71445924",
		rightTex = "rbxassetid://71445924",
		displayTex = "",
		sound = "rbxassetid://507863457",
		soundVol = 2,
		hasGravity = false,
		objectType = "Block"
	}
	--[[{
		name = "Redstone",
		size = Vector3.new(2.6, 0.05, 2.6),
		transparency = 1;
		frontTex = "rbxassetid://151911305",
		backTex = "",
		topTex = "rbxassetid://151911305",
		bottomTex = "",
		leftTex = "",
		rightTex = "",
		displayTex = "rbxassetid://64124418",
		sound = "rbxassetid://1016978163",
		soundVol = 2,
		hasGravity = false,
		objectType = "Redstone Dust"
	},]]
}
function putTexture(part, frontF, backF, topF, bottomF, leftF, rightF, className)
	local faces = {"Front", "Back", "Top", "Bottom", "Left", "Right"}
	for i,f in pairs(faces) do
		local decal = Instance.new(className, part)
		if i == 1 then decal.Texture = frontF decal.Name = f end
		if i == 2 then decal.Texture = backF or frontF decal.Name = f  end
		if i == 3 then decal.Texture = topF or frontF decal.Name = f  end
		if i == 4 then decal.Texture = bottomF or frontF decal.Name = f end
		if i == 5 then decal.Texture = leftF or frontF decal.Name = f  end
		if i == 6 then decal.Texture = rightF or frontF decal.Name = f  end
		decal.Face = f
	end
	return part
end
function makeSquare(position, size, color, transparency, parent, zindex)
	local label = Instance.new("TextLabel", parent)
	label.Text = ""
	label.BorderSizePixel = 0
	label.BackgroundTransparency = transparency
	label.Position = position
	label.Size = size
	label.BackgroundColor3 = color
	if zindex == nil then label.ZIndex = 1 else label.ZIndex = zindex end
	return label
end
function makeImage(position, size, image, parent, zindex)
	local imglabel = Instance.new("ImageLabel", parent)
	imglabel.BorderSizePixel = 0
	imglabel.BackgroundTransparency = 1
	imglabel.Position = position
	imglabel.Size = size
	imglabel.Image = image
	if zindex == nil then imglabel.ZIndex = 1 else imglabel.ZIndex = zindex end
	return imglabel
end
function putInventorySlot(position, image, parent, zindex)
	local button = Instance.new("TextButton", parent)
	button.Position = position
	button.Size = UDim2.new(0, 36, 0, 36)
	button.BackgroundColor3 = Color3.new(139/255, 139/255, 139/255)
	button.Text = ""
	button.BorderSizePixel = 0
	button.ZIndex = zindex
	local imageLabel = Instance.new("ImageLabel", button)
	imageLabel.BackgroundTransparency = 0.9
	imageLabel.Position = UDim2.new(0, 2, 0, 2)
	imageLabel.Size = UDim2.new(0, 32, 0, 32)
	imageLabel.Image = image
	imageLabel.BorderSizePixel = 0
	imageLabel.ZIndex = zindex
	makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(0, 34, 0, 2),
		Color3.new(55/255, 55/255, 55/255), 0, button, zindex)
	makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(0, 2, 0, 34),
		Color3.new(55/255, 55/255, 55/255), 0, button, zindex)
	makeSquare(UDim2.new(0, 34, 0, 2), UDim2.new(0, 2, 0, 34),
		Color3.new(255/255, 255/255, 255/255), 0, button, zindex)
	makeSquare(UDim2.new(0, 2, 0, 34), UDim2.new(0, 34, 0, 2),
		Color3.new(255/255, 255/255, 255/255), 0, button, zindex)
	return button
end

function AngleDifference(Angle1, Angle2)
	local Difference = {X = 0, Y = 0, Z = 0}
	Difference.X = Angle2.X - Angle1.X
	
	if (Difference.X > 180) then 
		Difference.X = Difference.X - 360
	elseif (Difference.X < -180) then 
		Difference.X = Difference.X + 360 
	end
	
	Difference.Y = Angle2.Y - Angle1.Y
	
	if (Difference.Y > 180) then 
		Difference.Y = Difference.Y - 360
	elseif (Difference.Y < -180) then 
		Difference.Y = Difference.Y + 360
	end
	
	Difference.Z = Angle2.Z - Angle1.Z
	
	if (Difference.Z > 180) then 
		Difference.Z = Difference.Z - 360
	elseif (Difference.Z < -180) then 
		Difference.Z = Difference.Z + 360 
	end
	
	return Vector3.new(Difference.X, Difference.Y, Difference.Z)
end

local draggingBlock = nil
function makeInventory()
	local playerGui = player:FindFirstChild("PlayerGui")
	if playerGui then
		local invGui = Instance.new("ScreenGui", playerGui)
		local creativeInv = Instance.new("Frame", invGui)
		creativeInv.BackgroundTransparency = 1
		creativeInv.Position = UDim2.new(0.5, -170, 0.5, -202)
		
		creativeInv.Visible = false
		
		-- creative inventory GUI...
		
		local blackOut = makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0),
			Color3.new(0/255, 0/255, 0/255), 0.3, invGui, 1)
		blackOut.Visible = false
		
		creativeInv.Changed:connect(function()
			blackOut.Visible = creativeInv.Visible
		end)
		
		local changeLog = Instance.new("TextLabel", invGui)
		changeLog.Text = Changelog
		changeLog.Font = "SourceSans"
		changeLog.FontSize = Enum.FontSize.Size12
		changeLog.Size = UDim2.new(0, changeLog.TextBounds.X, 0, changeLog.TextBounds.Y + 2)
		changeLog.BackgroundColor3 = Color3.new(0, 0, 0)
		changeLog.BorderSizePixel = 0
		changeLog.BackgroundTransparency = 0.5
		changeLog.Position = UDim2.new(0.5, -changeLog.Size.X.Offset/2, 0.5, -changeLog.Size.Y.Offset/2)
		changeLog.TextColor3 = Color3.new(1, 1, 1)
		changeLog.TextXAlignment = "Left"
		changeLog.TextYAlignment = "Top"
		
		local coolButton = Instance.new("TextButton", changeLog)
		coolButton.Position = UDim2.new(1, -17, 0, 1)
		coolButton.Size = UDim2.new(0, 16, 0, 12)
		coolButton.Text = "X"
		coolButton.Font = "SourceSans"
		coolButton.FontSize = Enum.FontSize.Size12
		coolButton.BorderSizePixel = 0
		coolButton.BackgroundColor3 = Color3.new(1, 0, 0)
		coolButton.BackgroundTransparency = 0.2
		coolButton.TextColor3 = Color3.new(1, 1, 1)
		coolButton.TextStrokeTransparency = 0.5
		coolButton.ZIndex = 2
		
		local line = makeSquare(UDim2.new(0, 0, 1, -14), UDim2.new(1, 0, 0, 14),
			Color3.new(0, 0, 0), 0.75, changeLog, 2)

		local line2 = makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 14),
			Color3.new(1, 1, 1), 0.9, changeLog, 1)
		
		line2.Text = "Change Log"
		line2.TextColor3 = Color3.new(1, 1, 1)
		line2.TextStrokeTransparency = 0.75
		line2.Font = "SourceSans"
		line2.FontSize = Enum.FontSize.Size12
		
		line.Text = "Made by Depr1"
		line.TextColor3 = Color3.new(1, 0.65, 0)
		line.TextStrokeTransparency = 0.5
		line.Font = "SourceSans"
		line.FontSize = Enum.FontSize.Size14
		line.TextXAlignment = "Left"
		
		coolButton.MouseButton1Click:connect(function()
			changeLog.Visible = false
		end)
		
		makeSquare(UDim2.new(0, -2, 0, 2), UDim2.new(0, 340, 0, 404),
			Color3.new(198/255, 198/255, 198/255), 0, creativeInv, 3)
		makeSquare(UDim2.new(0, 338, 0, 0), UDim2.new(0, 6, 0, 406),
			Color3.new(85/255, 85/255, 85/255), 0, creativeInv, 2)
		makeSquare(UDim2.new(0, 0, 0, 404), UDim2.new(0, 342, 0, 4),
			Color3.new(85/255, 85/255, 85/255), 0, creativeInv, 3)
		makeSquare(UDim2.new(0, 2, 0, 0), UDim2.new(0, 338, 0, 402),
			Color3.new(198/255, 198/255, 198/255), 0, creativeInv, 3)
		makeSquare(UDim2.new(0, -4, 0, -2), UDim2.new(0, 4, 0, 406),
			Color3.new(255/255, 255/255, 255/255), 0, creativeInv, 3)
		makeSquare(UDim2.new(0, -2, 0, -4), UDim2.new(0, 342, 0, 6),
			Color3.new(255/255, 255/255, 255/255), 0, creativeInv, 2)
		makeSquare(UDim2.new(0, 340, 0, -2), UDim2.new(0, 2, 0, 2),
			Color3.new(198/255, 198/255, 198/255), 0, creativeInv, 2)
		makeSquare(UDim2.new(0, 340, 0, -4), UDim2.new(0, 2, 0, 4),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, 342, 0, -2), UDim2.new(0, 2, 0, 2),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, 344, 0, 0), UDim2.new(0, 2, 0, 406),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, -4, 0, -4), UDim2.new(0, 2, 0, 4),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, -2, 0, -6), UDim2.new(0, 342, 0, 4),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, 0, 0, 406), UDim2.new(0, 342, 0, 4),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, 342, 0, 404), UDim2.new(0, 2, 0, 4),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, -4, 0, 404), UDim2.new(0, 2, 0, 2),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, -2, 0, 406), UDim2.new(0, 2, 0, 2),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		makeSquare(UDim2.new(0, -6, 0, -2), UDim2.new(0, 2, 0, 406),
			Color3.new(0/255, 0/255, 0/255), 0, creativeInv, 1)
		local text = makeSquare(UDim2.new(0, 4, 0, 8), UDim2.new(0, 0, 0, 0), Color3.new(0/255, 0/255, 0/255), 1, creativeInv, 3)
		text.Text = "Creative Inventory"
		text.Font = "SourceSansSemibold"
		text.TextSize = 14
		text.TextXAlignment = "Left"
		--		
		local draggingBlockPicture = Instance.new("ImageLabel", invGui)
		draggingBlockPicture.BackgroundTransparency = 1
		draggingBlockPicture.Size = UDim2.new(0, 32, 0, 32)
		draggingBlockPicture.ZIndex = 5
		coroutine.resume(coroutine.create(function()
			local invMouse = player:GetMouse()
			--local RS = game:GetService("RunService").RenderStepped	
			invMouse.Button2Down:connect(function()
				draggingBlock = nil
			end)
			while RS:wait() do
				draggingBlockPicture.Position = UDim2.new(0, invMouse.X - 16, 0, invMouse.Y - 16)
				if draggingBlock ~= nil then
					draggingBlockPicture.Image = draggingBlock.frontTex
				else
					draggingBlockPicture.Image = ""
				end
			end
		end))
		
		local done = false
		local x = 0
		local y = 0
		
		for i,b in pairs(creativeInventory) do
			local display = ""
			if b.displayTex == "" then
				display = b.frontTex
			else
				if b.displayTex then
					display = b.displayTex
				end
			end
			putInventorySlot(UDim2.new(0.5, (x*36) + 8, 0.5, (y*36) + 28), display, creativeInv, 4).MouseButton1Down:connect(function()
				if draggingBlock == nil then
					draggingBlock = b
				end
			end)
			x = x + 1
			if x >= 8 then
				x = 0
				y = y + 1
			end
		end
		if x == 0 then done = true end
		while x < 8 and done == false do
			putInventorySlot(UDim2.new(0.5, (x*36) + 8, 0.5, (y*36) + 28), "", creativeInv, 4)
			x = x + 1
		end
		for i = 1, 9 do
			if toolBar[i] ~= nil then
				local invSlot = putInventorySlot(UDim2.new(0, 8 + ((i-1)*36), 0, 360), toolBar[i].frontTex, creativeInv, 4)
				invSlot.MouseButton2Down:connect(function()
					local imgLabel = invSlot:FindFirstChild("ImageLabel")
					if imgLabel then
						toolBar[i] = nil
						imgLabel.Image = ""
					end
				end)
				invSlot.MouseButton1Down:connect(function()
					--updateHand = true
					local imgLabel = invSlot:FindFirstChild("ImageLabel")
					if toolBar[i] == nil then
						toolBar[i] = draggingBlock
						imgLabel.Image = draggingBlock.frontTex
						draggingBlock = nil		
						return				
					end
					if toolBar[i] ~= nil and draggingBlock == nil then
						draggingBlock = toolBar[i]
						toolBar[i] = nil
						imgLabel.Image = ""
						return
					elseif toolBar[i] ~= nil and draggingBlock ~= nil then
						--draggingBlock = toolBar[i]
						--toolBar[i] = nil
						imgLabel.Image = ""
						local temp = toolBar[i]
						toolBar[i] = draggingBlock
						if imgLabel and draggingBlock ~= nil then 
							imgLabel.Image = draggingBlock.frontTex
						end 
						if imgLabel and draggingBlock == nil then
							imgLabel.Image = ""
						end
						draggingBlock = temp
						return
					end
				end)
			else
				local invSlot = putInventorySlot(UDim2.new(0, 8 + ((i-1)*36), 0, 360), "", creativeInv, 4)
				invSlot.MouseButton2Down:connect(function()
					local imgLabel = invSlot:FindFirstChild("ImageLabel")
					if imgLabel then
						toolBar[i] = nil
						imgLabel.Image = ""
					end
				end)
				invSlot.MouseButton1Down:connect(function()
					--updateHand = true
					local imgLabel = invSlot:FindFirstChild("ImageLabel")
					if toolBar[i] == nil then
						toolBar[i] = draggingBlock
						imgLabel.Image = draggingBlock.frontTex
						draggingBlock = nil		
						return				
					end
					if toolBar[i] ~= nil and draggingBlock == nil then
						draggingBlock = toolBar[i]
						toolBar[i] = nil
						imgLabel.Image = ""
						return
					elseif toolBar[i] ~= nil and draggingBlock ~= nil then
						--draggingBlock = toolBar[i]
						--toolBar[i] = nil
						imgLabel.Image = ""
						local temp = toolBar[i]
						toolBar[i] = draggingBlock
						if imgLabel and draggingBlock ~= nil then 
							imgLabel.Image = draggingBlock.frontTex
						end 
						if imgLabel and draggingBlock == nil then
							imgLabel.Image = ""
						end
						draggingBlock = temp
						return						
					end
				end)
			end
		end
		return creativeInv
	end
end
function putToolBarSlot(position, image, zindex)
	local playerGui = player:FindFirstChild("PlayerGui")
	if playerGui then
		local gui = playerGui:FindFirstChild("ToolBar") or Instance.new("ScreenGui", playerGui)
		gui.Name = "ToolBar"
		local slot = Instance.new("ImageLabel", gui)
		slot.Position = position
		slot.Size = UDim2.new(0, 32, 0, 32)
		slot.BackgroundTransparency = 1
		slot.ImageTransparency = 0
		slot.Image = image
		slot.ZIndex = 2
		
		local imgSlot = makeImage(UDim2.new(0, 0, 0, 0), UDim2.new(0, 32, 0, 32), 
			"rbxassetid://347007448", slot)
		
		imgSlot.ImageTransparency = 0.25
		imgSlot.BackgroundTransparency = 1
		imgSlot.ImageColor3 = Color3.new(0.225, 0.225, 0.225)
		
		makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(0, 2, 0, 32), 
			Color3.new(0/255, 0/255, 0/255), 0.7, slot)
		makeSquare(UDim2.new(0, 2, 0, 0), UDim2.new(0, 30, 0, 2), 
			Color3.new(0/255, 0/255, 0/255), 0.7, slot)
		makeSquare(UDim2.new(0, -2, 0, -2), UDim2.new(0, 36, 0, 2), 
			Color3.new(106/255, 106/255, 106/255), 0, slot)
		makeSquare(UDim2.new(0, -2, 0, -2), UDim2.new(0, 2, 0, 36), 
			Color3.new(106/255, 106/255, 106/255), 0, slot)
		makeSquare(UDim2.new(0, 0, 0, 32), UDim2.new(0, 34, 0, 2), 
			Color3.new(130/255, 130/255, 130/255), 0, slot)
		makeSquare(UDim2.new(0, 32, 0, 0), UDim2.new(0, 2, 0, 34), 
			Color3.new(130/255, 130/255, 130/255), 0, slot)
		makeSquare(UDim2.new(0, -4, 0, -2), UDim2.new(0, 2, 0, 38), 
			Color3.new(130/255, 130/255, 130/255), 0, slot)
		makeSquare(UDim2.new(0, 34, 0, -2), UDim2.new(0, 2, 0, 36), 
			Color3.new(106/255, 106/255, 106/255), 0, slot)
		makeSquare(UDim2.new(0, -2, 0, 34), UDim2.new(0, 38, 0, 2), 
			Color3.new(106/255, 106/255, 106/255), 0, slot)
		makeSquare(UDim2.new(0, -4, 0, -4), UDim2.new(0, 40, 0, 2), 
			Color3.new(156/255, 156/255, 156/255), 0, slot)
		return slot
	end
end
function divide(x, d)
	if x ~= 0 and d ~= 0 then
		return x/d
	else
		return x
	end
end -- so it doesn't divide by zero
function getDistance(v1, v2)
	return math.abs((Vector3.new(math.abs(v2.X - v1.X), math.abs(v2.Y - v1.Y), math.abs(v2.Z - v1.Z))).Magnitude)
end
function SnapToGrid(x, gridX)
    local x = math.floor((x / gridX) + 0.5) * gridX 
    return x
end
function weldTo(part1, part2)
	local weld = Instance.new("Weld", part1)
	weld.Part0 = part1
	weld.Part1 = part2
	return weld
end
function getMagnitudeXZ(velocity)
	return math.sqrt(math.abs(velocity.X)^2 + math.abs(velocity.Z)^2)
end
function findHumanoid(inst)
	local find = inst
	local hum = nil
	repeat
		if find.Name == "Workspace" then return nil end
		find = find.Parent
		hum = find:FindFirstChild("Humanoid")
	until hum
	--if hum then print("found!!") else print("aw... not found") end
	--if hum.ClassName ~= "Humanoid" then hum = nil end
	return hum
end
function getSideByLocation(loc)
	local side = nil
    if loc.X < 0 then side = "Left" end
	if loc.X > 0 then side = "Right" end
	if loc.Y > 0 then side = "Top" end
	if loc.Y < 0 then side = "Bottom" end
	if loc.Z < 0 then side = "Front" end
	if loc.Z > 0 then side = "Back" end
	
	if (math.abs(loc.X) > 0 and math.abs(loc.Y) > 0) or
		(math.abs(loc.X) > 0 and math.abs(loc.Z) > 0) or
		(math.abs(loc.Y) > 0 and math.abs(loc.Z) > 0)
		then 
		return nil
	end
    return side
end
function getSideByLocationRedstone(loc)
	local side = nil
    if loc.X < 0 then side = "Left" end
	if loc.X > 0 then side = "Right" end
	if loc.Y > 0 then side = "Top" end
	if loc.Y < 0 then side = "Bottom" end
	if loc.Z < 0 then side = "Front" end
	if loc.Z > 0 then side = "Back" end
	
	if (math.abs(loc.X) > 0 and math.abs(loc.Y) > 0) or
		(math.abs(loc.X) > 0 and math.abs(loc.Z) > 0) or
		(math.abs(loc.Y) > 0 and math.abs(loc.Z) > 0)
		then 
		return nil
	end
    return side
end
function getBlockAtRegion(region)
	local blockFound = nil
	for _,part in pairs(game.Workspace:FindPartsInRegion3(region, nil, math.huge)) do
		local usePart = true
		if part.Name == "Debris" then usePart = false end
		if usePart == true then
			blockFound = part
			break
		end
	end
	return blockFound
end
function getRedstoneAtRegion(region)
	local blockFound = nil
	for _,part in pairs(game.Workspace:FindPartsInRegion3(region, nil, math.huge)) do
		if isRedstone(part) then
			blockFound = part
			break
		end
	end
	return blockFound
end
function isRedstone(block)
	local objType = block:FindFirstChild("ObjectType")
	if objType then 
		if objType.Value == "Redstone Dust" then 
			return true 
		else
			return false
		end 
	end
end
function updateRedstoneDust(dust, leftBlk, rightBlk, topBlk, bottomBlk, frontBlk, backBlk, recursion)
	local objType = nil
	if dust then
		objType = dust:FindFirstChild("ObjectType")
	end
	
	local redstoneDust = "rbxassetid://151911305"
	local redstoneLine = "rbxassetid://151907047"
	local redstoneCorner = "rbxassetid://151907106"
	local redstoneT = "rbxassetid://151907156"
	local redstoneCross = "rbxassetid://151906997"
	
	local Rotation = 0
	
	local theresRedstoneAtLeft = false
	local theresRedstoneAtRight = false
	local theresRedstoneAtFront = false
	local theresRedstoneAtBack = false
	
	if leftBlk then theresRedstoneAtLeft = isRedstone(leftBlk) end
	if rightBlk then theresRedstoneAtRight = isRedstone(rightBlk) end
	if frontBlk then theresRedstoneAtFront = isRedstone(frontBlk) end
	if backBlk then theresRedstoneAtBack = isRedstone(backBlk) end
	
	if objType then 
		if objType.Value == "Redstone Dust" then 
			local topDecal = dust:FindFirstChild("Top")
			if topDecal then
				if theresRedstoneAtBack == false and theresRedstoneAtFront == false and
					theresRedstoneAtLeft == false and theresRedstoneAtRight == false then
					topDecal.Texture = redstoneDust
					Rotation = 0
				end				
				
				if theresRedstoneAtLeft == true or theresRedstoneAtRight == true then
					topDecal.Texture = redstoneLine
					Rotation = 0
				end
				
				if theresRedstoneAtFront == true or theresRedstoneAtBack == true then
					topDecal.Texture = redstoneLine
					Rotation = 90
				end
				
				if theresRedstoneAtLeft == true and theresRedstoneAtBack == true then
					topDecal.Texture = redstoneCorner
					Rotation = 0
				end	

				if theresRedstoneAtBack == true and theresRedstoneAtRight == true then
					topDecal.Texture = redstoneCorner
					Rotation = 90
				end	
				
				if theresRedstoneAtRight == true and theresRedstoneAtFront == true then
					topDecal.Texture = redstoneCorner
					Rotation = 180
				end	
				
				if theresRedstoneAtFront == true and theresRedstoneAtLeft == true then
					topDecal.Texture = redstoneCorner
					Rotation = -90
				end	

				if theresRedstoneAtBack == true and theresRedstoneAtLeft == true 
					and theresRedstoneAtFront == true then
					topDecal.Texture = redstoneT
					Rotation = -90
				end	

				if theresRedstoneAtLeft == true and theresRedstoneAtFront == true 
					and theresRedstoneAtRight == true then
					topDecal.Texture = redstoneT
					Rotation = -180
				end	
				
				if theresRedstoneAtFront == true and theresRedstoneAtRight == true 
					and theresRedstoneAtBack == true then
					topDecal.Texture = redstoneT
					Rotation = 90
				end	
				
				if theresRedstoneAtRight == true and theresRedstoneAtBack == true 
					and theresRedstoneAtLeft == true then
					topDecal.Texture = redstoneT
					Rotation = 0
				end	
				
				if theresRedstoneAtLeft == true and theresRedstoneAtRight == true and
					theresRedstoneAtFront == true and theresRedstoneAtBack == true then
					topDecal.Texture = redstoneCross
					Rotation = 0
				end
			end
		else
			error("Not redstone dust.") 
		end
	end
	
	if recursion == true then
		local function updateTex(blockTarget)
			local leftSide = nil
			local rightSide = nil
			local frontSide = nil
			local backSide = nil
			
			local Point1 = blockTarget.CFrame.p - Vector3.new(2.6, 0.1, 2.6)
			local Point2 = blockTarget.CFrame.p + Vector3.new(2.6, 0.1, 2.6)
			local Region = Region3.new(Point1, Point2)
			for _,part in pairs(game.Workspace:FindPartsInRegion3(
				Region,
				nil,
				math.huge
			)) do
				local objType = part:FindFirstChild("ObjectType")
				if isRedstone(part) then
					local side = getSideByLocationRedstone(blockTarget.CFrame.p - part.CFrame.p)
					if side == "Left" then
						leftSide = part
					elseif side == "Right" then
						rightSide = part
					elseif side == "Front" then
						frontSide = part
					elseif side == "Back" then
						backSide = part
					elseif side == "Left Top" then
						leftSide = part
					elseif side == "Right Top" then
						rightSide = part
					elseif side == "Front Top" then
						frontSide = part
					elseif side == "Back Top" then
						backSide = part
					elseif side == "Left Bottom" then
						leftSide = part
					elseif side == "Right Bottom" then
						rightSide = part
					elseif side == "Front Bottom" then
						frontSide = part
					elseif side == "Back Bottom" then
						backSide = part
					end
				end
			end
			
			updateRedstoneDust(blockTarget, leftSide, rightSide, nil, nil, frontSide, backSide, false)
		end
		if leftBlk and theresRedstoneAtLeft then updateTex(leftBlk) end
		if rightBlk and theresRedstoneAtRight then updateTex(rightBlk) end
		if frontBlk and theresRedstoneAtFront then updateTex(frontBlk) end
		if backBlk and theresRedstoneAtBack then updateTex(backBlk) end
	end
	
	if dust then dust.CFrame = CFrame.new(dust.CFrame.p.X, dust.CFrame.p.Y, dust.CFrame.p.Z) * CFrame.Angles(0, math.rad(Rotation), 0) end
end
function placeBlock(block, cFPos, Mouse)
	if block == nil then
		if Mouse.Target.Size.X <= 10 and Mouse.Target.Size.Y <= 10 and Mouse.Target.Size.Z <= 10 and Mouse.Target then
			if Mouse.Target.Parent.Name ~= "Camera" then
				--print(Mouse.Target:GetFullName())
				local blkTar = Mouse.Target
				--Mouse.Target.Parent = nil
				local blockIsRedstone = isRedstone(blkTar)
				
				local Point1 = blkTar.CFrame.p - Vector3.new(2.7, 2.7, 2.7)
				local Point2 = blkTar.CFrame.p + Vector3.new(2.7, 2.7, 2.7)
				local Region = Region3.new(Point1, Point2)
				for _,part in pairs(game.Workspace:FindPartsInRegion3(
					Region,
					nil,
					math.huge
					)) do
				
					if part:FindFirstChild("IsBlock") then
						local side1 = getSideByLocation(blkTar.CFrame.p - part.CFrame.p)				
						if getSideByLocation(blkTar.CFrame.p - part.CFrame.p) then
							local texture = part:FindFirstChild(side1)
							if texture then
								texture.Transparency = 0
							end
						end
					end
				end
				 
				for i = 1, 9 do
					local part = Instance.new("Part", workspace)
					part.Size = Vector3.new(0, 0, 0)
					part.Transparency = 1
					part.CanCollide = false
					part.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5))
					part.Name = "Debris"
					
					part.CFrame = 
						Mouse.Target.CFrame * 
						CFrame.new(math.random(-blkTar.Size.X/2, blkTar.Size.X/2), math.random(-blkTar.Size.Y/2, blkTar.Size.Y/2), math.random(-blkTar.Size.Z/2, blkTar.Size.Z/2))
							
					part.CustomPhysicalProperties = PhysicalProperties.new(0, 0.2, 0, 100, 100)
					
					local billboard = Instance.new("BillboardGui", part)
					billboard.Size = UDim2.new(1.2, 0, 1.2, 0)
									
					local clipDescendant = Instance.new("TextLabel", billboard)
					clipDescendant.Size = UDim2.new(0.5, 0, 0.5, 0)
					clipDescendant.BackgroundTransparency = 1
					clipDescendant.Text = ""
					clipDescendant.ClipsDescendants = true
									
					local img = Instance.new("ImageLabel", clipDescendant)
					img.Size = UDim2.new(2, 0, 2, 0)
					img.BackgroundTransparency = 1
					img.Position = UDim2.new(math.random(-70, 70)/100, 0, math.random(-70, 70)/100, 0)
									
					local tex =  blkTar:FindFirstChild("Front")
					if tex then
						img.Image = tex.Texture
					else
						img.Image = "rbxassetid://744949545"
					end
						
					if img.Image == "rbxassetid://744949545" then
						img.ImageColor3 = blkTar.Color
					end
									
					part.Touched:connect(function(prt)
						if prt ~= blkTar then
							part.CanCollide = true
						end
					end)								
									
					coroutine.resume(coroutine.create(function()
						wait(math.random(50, 65)/100)
						part:Destroy()
					end))
					--part.Anchored = false
				end
				blkTar:Destroy()
				if blockIsRedstone == true then
					local leftSide = nil
					local rightSide = nil
					local frontSide = nil
					local backSide = nil
					
					local Point1 = blkTar.CFrame.p - Vector3.new(2.6, 0.1, 2.6)
					local Point2 = blkTar.CFrame.p + Vector3.new(2.6, 0.1, 2.6)
					local Region = Region3.new(Point1, Point2)
					for _,part in pairs(game.Workspace:FindPartsInRegion3(
						Region,
						nil,
						math.huge
					)) do
						local objType = part:FindFirstChild("ObjectType")
						if isRedstone(part) then
							local side = getSideByLocationRedstone(blkTar.CFrame.p - part.CFrame.p)
							if side == "Left" then
								leftSide = part
							elseif side == "Right" then
								rightSide = part
							elseif side == "Front" then
								frontSide = part
							elseif side == "Back" then
								backSide = part
							elseif side == "Left Top" then
								leftSide = part
							elseif side == "Right Top" then
								rightSide = part
							elseif side == "Front Top" then
								frontSide = part
							elseif side == "Back Top" then
								backSide = part
							elseif side == "Left Bottom" then
								leftSide = part
							elseif side == "Right Bottom" then
								rightSide = part
							elseif side == "Front Bottom" then
								frontSide = part
							elseif side == "Back Bottom" then
								backSide = part
							end
						end
					end
					
					updateRedstoneDust(nil, leftSide, rightSide, nil, nil, frontSide, backSide, true)
				end
			end
		end
		return nil
	else
		local blkMouseTarget = Mouse.Target
		
		local blockPlaced = Instance.new("Part", workspace)
		blockPlaced.Material = "Fabric"
		blockPlaced.Transparency = block.transparency
		blockPlaced.Anchored = true
		blockPlaced.Size = block.size
		
		blockPlaced.CFrame = cFPos
		
		local blockType = Instance.new("StringValue", blockPlaced)
		blockType.Name = "ObjectType"
		blockType.Value = block.objectType
		
		blockPlaced.Name = block.name
		putTexture(blockPlaced, block.frontTex, block.backTex, 
			block.topTex, block.bottomTex, block.leftTex, block.rightTex, "Texture")		
		
		if block.objectType == "Slab" then
			blockPlaced.Size = blockPlaced.Size / Vector3.new(1, 2, 1)
			blockPlaced.CFrame = blockPlaced.CFrame * CFrame.new(0, -blockPlaced.Size.Y/2, 0)
		elseif block.objectType == "Redstone Dust" then
			blockPlaced.CFrame = blockPlaced.CFrame * CFrame.new(0, -1.3, 0)
			blockPlaced.CanCollide = false
			
			local canPlace = false
			
			if isRedstone(blkMouseTarget) == true then 
				blockPlaced:Destroy() 
				return 
			end			
			
			local partBelow = getBlockAtRegion(Region3.new(
				blockPlaced.CFrame.p - Vector3.new(1, 1, 1), 
				blockPlaced.CFrame.p + Vector3.new(1, 1, 1)
			))
			
			if partBelow then
				local targetObjType = partBelow:FindFirstChild("ObjectType")
				if targetObjType then
					if targetObjType.Value == "Block" then
						canPlace = true
					end 
				end
			end
			
			if canPlace == false then
				blockPlaced:Destroy()
				return
			end
			
			local leftSide = nil
			local rightSide = nil
			local frontSide = nil
			local backSide = nil
			
			local Point1 = blockPlaced.CFrame.p - Vector3.new(2.6, 0.1, 2.6)
			local Point2 = blockPlaced.CFrame.p + Vector3.new(2.6, 0.1, 2.6)
			local Region = Region3.new(Point1, Point2)
			for _,part in pairs(game.Workspace:FindPartsInRegion3(
				Region,
				nil,
				math.huge
			)) do
				local objType = part:FindFirstChild("ObjectType")
				if isRedstone(part) then
					
					local side = getSideByLocationRedstone(blockPlaced.CFrame.p - part.CFrame.p)
					if side == "Left" then
						leftSide = part
					elseif side == "Right" then
						rightSide = part
					elseif side == "Front" then
						frontSide = part
					elseif side == "Back" then
						backSide = part
					elseif side == "Left Top" then
						leftSide = part
					elseif side == "Right Top" then
						rightSide = part
					elseif side == "Front Top" then
						frontSide = part
					elseif side == "Back Top" then
						backSide = part
					elseif side == "Left Bottom" then
						leftSide = part
					elseif side == "Right Bottom" then
						rightSide = part
					elseif side == "Front Bottom" then
						frontSide = part
					elseif side == "Back Bottom" then
						backSide = part
					end
						
								
						--if getSideByLocation(cFPos.p - part.CFrame.p) then
						--	local texture = part:FindFirstChild(side1)
						--	if texture then
						--		texture.Transparency = 1
						--	end
						--end
						--[[local side2 = getSideByLocation(part.CFrame.p - cFPos.p)				
						if getSideByLocation(cFPos.p - part.CFrame.p) then
							local texture = blockPlaced:FindFirstChild(side2)
							if texture then
								texture.Transparency = 1
							end
						end]]
				end
			end		
			
			updateRedstoneDust(blockPlaced, leftSide, rightSide, nil, nil, frontSide, backSide, true)
			
			--local partBelow = getBlockAtRegion(Region3.new(
			--	blockPlaced.CFrame.p - Vector3.new(1, 1, 1), 
			--	blockPlaced.CFrame.p + Vector3.new(1, 1, 1)
			--))
		end
		
		if Mouse.Target.Name == block.name then
			local targetObjType = Mouse.Target:FindFirstChild("ObjectType")
			if targetObjType then
				if targetObjType.Value == "Slab" then
					local side = Mouse.TargetSurface.Name --getSideByLocation(Mouse.Target.Position - cFPos.p)
					if side == "Bottom" or side == "Top" then
						Mouse.Target.Size = Mouse.Target.Size * Vector3.new(1, 2, 1)
						Mouse.Target.CFrame = Mouse.Target.CFrame * CFrame.new(0, blockPlaced.Size.Y/2, 0)
						
						targetObjType.Value = "Block"
						
						blockPlaced:Destroy()
						return
					end
				end
			end
		end
		
		local Point1 = cFPos.p - Vector3.new(2.7, 2.7, 2.7)
		local Point2 = cFPos.p + Vector3.new(2.7, 2.7, 2.7)
		local Region = Region3.new(Point1, Point2)
		for _,part in pairs(game.Workspace:FindPartsInRegion3(
			Region,
			nil,
			math.huge
		)) do
			local objType = part:FindFirstChild("ObjectType")
			if part:FindFirstChild("IsBlock") and objType then
				local doNothing = false
				if objType.Value == "Slab" or block.objectType == "Slab" then doNothing = true end
				if part.Name == blockPlaced.Name and doNothing == false then
					local side1 = getSideByLocation(cFPos.p - part.CFrame.p)		
					if getSideByLocation(cFPos.p - part.CFrame.p) then
						local texture = part:FindFirstChild(side1)
						if texture then
							texture.Transparency = 1
						end
					end
					local side2 = getSideByLocation(part.CFrame.p - cFPos.p)				
					if getSideByLocation(cFPos.p - part.CFrame.p) then
						local texture = blockPlaced:FindFirstChild(side2)
						if texture then
							texture.Transparency = 1
						end
					end
				end
			end
		end
		
		
		local isBlock = Instance.new("CFrameValue", blockPlaced)
		isBlock.Name = "IsBlock"
		
		if block.hasGravity == true then
			local connectedTo = Instance.new("ObjectValue", blockPlaced)
			connectedTo.Name = "ConnectedTo"
			blockPlaced.Anchored = false
			blockPlaced.CanCollide = false
			local detector = Instance.new("Part", workspace:WaitForChild("Camera"))
			detector.Transparency = 1
			detector.CanCollide = false
			detector.Size = Vector3.new(1, 0, 1)
			local weldDetector = Instance.new("Motor6D", detector)
			weldDetector.Part0 = detector
			weldDetector.Part1 = blockPlaced
			weldDetector.C1 = CFrame.new(0, -blockPlaced.Size.Y/2, 0)
			local landed = false
			local function fallingBlock()
				coroutine.resume(coroutine.create(function()
					local falling = blockPlaced:FindFirstChild("IsFalling") or Instance.new("CFrameValue", blockPlaced)
					falling.Name = "IsFalling"
					local grav = 0
					while RS:wait() do
						if landed then falling:Destroy() break end
						grav = math.max(-1, grav - 0.0025)
						--blockPlaced.CFrame = CFrame.new(cFPos.X, blockPlaced.CFrame.Y + grav, cFPos.Z)
					end
				end))
			end
			fallingBlock()
			detector.Touched:connect(function(part)
				if blockPlaced.Anchored == false and part ~= blockPlaced and part.Name ~= "Debris" and part:FindFirstChild("IsFalling") == nil and findHumanoid(part) == nil then
					landed = true
					blockPlaced.CanCollide = true
					blockPlaced.Velocity = Vector3.new(0, 0, 0)
					blockPlaced.Anchored = true
					connectedTo.Value = part
					local yOrigin = part.CFrame.Y + (blockPlaced.Size.Y/2) + (part.Size.Y/2)
					blockPlaced.CFrame = CFrame.new(cFPos.X, yOrigin, cFPos.Z)
					--detector:Destroy()
					local falling = false
					part.Changed:connect(function()
						if part.Position.Y ~= yOrigin and falling == false then
							falling = true
							wait(0.075)
							landed = false
							blockPlaced.Anchored = false
							blockPlaced.CanCollide = false
							blockPlaced.Velocity = Vector3.new(0, 0, 0)
							fallingBlock()
							falling = false
						end
					end)
					workspace.ChildRemoved:connect(function()
						--print("hi")
						if connectedTo.Value.Parent == nil and falling == false then
							falling = true
							landed = false
							blockPlaced.Anchored = false
							blockPlaced.CanCollide = false
							blockPlaced.Velocity = Vector3.new(0, 0, 0)
							fallingBlock()
						end
					end)
				end
			end)
		end
		
		local blockSound = Instance.new("Sound", blockPlaced)
		blockSound.SoundId = block.sound
		blockSound.Volume = block.soundVol
		blockSound.Pitch = math.random(95, 105)/100
		blockSound.PlayOnRemove = true
		blockSound:Play()
		return blockPlaced
	end
end
if player then
	local char = player.Character
	if char then
		for _,cM in pairs(char:GetChildren()) do
			if cM.ClassName == "CharacterMesh" then cM:Destroy() end
		end
		
		--[]
		local gui = player.PlayerGui:FindFirstChild("ToolBar") or Instance.new("ScreenGui", player.PlayerGui)
		gui.Name = "ToolBar"
		
		makeSquare(UDim2.new(0.5, -166, 1, -111), UDim2.new(0, 364, 0, 2), 
			Color3.new(0/255, 0/255, 0/255), 0, gui)
		makeSquare(UDim2.new(0.5, -166, 1, -111 + 42), UDim2.new(0, 364, 0, 2), 
			Color3.new(0/255, 0/255, 0/255), 0, gui)
		makeSquare(UDim2.new(0.5, -166, 1, -111), UDim2.new(0, 2, 0, 44), 
			Color3.new(0/255, 0/255, 0/255), 0, gui)
		makeSquare(UDim2.new(0.5, -166 + 362, 1, -111), UDim2.new(0, 2, 0, 44), 
			Color3.new(0/255, 0/255, 0/255), 0, gui)
		
		for i = 1, 9 do
			if toolBar[i] ~= nil then
				local img = putToolBarSlot(UDim2.new(0.5, -160 + ((i-1)*40), 1, -105), toolBar[i].frontTex)
				coroutine.resume(coroutine.create(function()
					while wait() do
						if toolBar[i] ~= nil then
							if toolBar[i].displayTex == "" then
								img.Image = toolBar[i].frontTex
							else
								img.Image = toolBar[i].displayTex
							end
						else
							img.Image = ""
						end
					end
				end))
			else
				local img = putToolBarSlot(UDim2.new(0.5, -160 + ((i-1)*40), 1, -105), "")
				coroutine.resume(coroutine.create(function()
					while wait() do
						if toolBar[i] ~= nil then
							if toolBar[i].displayTex == "" then
								img.Image = toolBar[i].frontTex
							else
								img.Image = toolBar[i].displayTex
							end
						else
							img.Image = ""
						end
					end
				end))
			end
		end
		
		local creativeInventoryGUI = makeInventory()
		
		local humRootPart = char:WaitForChild("HumanoidRootPart")
		local head = char:WaitForChild("Head")
		local torso = char:WaitForChild("Torso")
		local lArm = char:WaitForChild("Left Arm")
		local rArm = char:WaitForChild("Right Arm")
		local lLeg = char:WaitForChild("Left Leg")
		local rLeg = char:WaitForChild("Right Leg")
		
		local humanoid = char:WaitForChild("Humanoid")	
		char.Humanoid:ClearAllChildren()
		humanoid.HipHeight = 0.3
		humanoid.AutoRotate = false
		
		-- Heart bar
		local hpFrame = makeSquare(UDim2.new(0.5, -166, 1, -130), UDim2.new(0, 162, 0, 18),
			Color3.new(0/255, 0/255, 0/255), 1, gui, 1)

		local hearts = makeSquare(UDim2.new(0, 0, 0, 0), UDim2.new(0, 162, 0, 18),
			Color3.new(0/255, 0/255, 0/255), 1, hpFrame, 1)
		hearts.ClipsDescendants = true
		
		for i = 1, 10 do
			local heartImg = makeImage(UDim2.new(0, (i-1)*16, 0, 0), UDim2.new(0, 18, 0, 18),
				"rbxassetid://1494233443", hearts, 2)
			
			makeSquare(UDim2.new(0, 4, 0, 4), UDim2.new(0, 2, 0, 2),
				Color3.new(255/255, 200/255, 200/255), 0, heartImg, 2)
			
			heartImg.ImageColor3 = Color3.new(240/255, 0, 0)
			
			local emptyHeart = makeImage(UDim2.new(0, (i-1)*16, 0, 0), UDim2.new(0, 18, 0, 18),
				"rbxassetid://1494233443", hpFrame, 1)
			emptyHeart.ImageColor3 = Color3.new(0.3, 0.3, 0.3)
			
			local outline = makeImage(UDim2.new(0, 0, 0, 0), UDim2.new(0, 18, 0, 18),
				"rbxassetid://1494176679", emptyHeart, 1)
			outline.ImageColor3 = Color3.new(0, 0, 0)
			
			local oldHP = humanoid.Health/humanoid.MaxHealth --SnapToGrid((humanoid.Health/humanoid.MaxHealth)*162, 8)
			humanoid.Changed:connect(function()
				local hp = humanoid.Health/humanoid.MaxHealth --SnapToGrid((humanoid.Health/humanoid.MaxHealth)*162, 8)
				if SnapToGrid(oldHP*162, 8) < SnapToGrid(hp*162, 8) then
					outline.ImageColor3 = Color3.new(1, 1, 1)
					wait(0.1)
					outline.ImageColor3 = Color3.new(0, 0, 0)
					wait(0.1)
				end
				if oldHP > hp then
					for i = 1, 2 do
						outline.ImageColor3 = Color3.new(1, 1, 1)
						wait(0.1)
						outline.ImageColor3 = Color3.new(0, 0, 0)
						wait(0.1)
					end
				end
				oldHP = hp
			end)
			coroutine.resume(coroutine.create(function()
				local yIncrease = 0
				local originalY = emptyHeart.Position.Y.Offset
				
				while wait() do
					if humanoid.Health/humanoid.MaxHealth <= 0.27 then
						if yIncrease <= 0 then
							yIncrease = math.random(1, 2)
						else
							yIncrease = yIncrease - 1
						end
						
						heartImg.Position = UDim2.new(0, heartImg.Position.X.Offset, 0, -yIncrease)
						emptyHeart.Position = UDim2.new(0, emptyHeart.Position.X.Offset, 0, -yIncrease)
					else
						if yIncrease >= 1 then
							yIncrease = yIncrease - 1
							
							heartImg.Position = UDim2.new(0, heartImg.Position.X.Offset, 0, -yIncrease)
							emptyHeart.Position = UDim2.new(0, emptyHeart.Position.X.Offset, 0, -yIncrease)
						end
					end
				end
			end))
		end
		
		humanoid.Parent = nil
		
		if char:FindFirstChild("Animate") then
			char.Animate:Remove()
		end
		
		head.Size = Vector3.new(1.3, 1.3, 1.3)
		putTexture(head, "rbxassetid://38738031", "rbxassetid://36047330", 
			"rbxassetid://36047341", "rbxassetid://36047347",
			"rbxassetid://36047323", "rbxassetid://36047315", "Decal")
		head:WaitForChild("Mesh"):Destroy()
		head:WaitForChild("face"):Destroy()
		
		torso.Size = Vector3.new(1.3, 1.95, 0.65)
		putTexture(torso, "rbxassetid://38934753", "rbxassetid://38934731", 
			"rbxassetid://38934780", "rbxassetid://38934740",
			"rbxassetid://38934762", "rbxassetid://38934762", "Decal")
		
		lArm.Size = Vector3.new(0.65, 1.95, 0.65)
		putTexture(lArm, "rbxassetid://38934581", "rbxassetid://38934560", 
			"rbxassetid://38934613", "rbxassetid://38934568",
			"rbxassetid://38934601", "rbxassetid://38934591", "Decal")
		
		rArm.Size = Vector3.new(0.65, 1.95, 0.65)
		putTexture(rArm, "rbxassetid://38934560", "rbxassetid://38934581", 
			"rbxassetid://38934613", "rbxassetid://38934568",
			"rbxassetid://38934601", "rbxassetid://38934591", "Decal")
		
		lLeg.Size = Vector3.new(0.65, 1.95, 0.65)
		putTexture(lLeg, "rbxassetid://38936226", "rbxassetid://38936209", 
			"rbxassetid://38934719", "rbxassetid://38934712",
			"rbxassetid://38936255", "rbxassetid://38936242", "Decal")
		
		rLeg.Size = Vector3.new(0.65, 1.95, 0.65)
		putTexture(rLeg, "rbxassetid://38936209", "rbxassetid://38936226", 
			"rbxassetid://38934719", "rbxassetid://38934712",
			"rbxassetid://38936242", "rbxassetid://38936255", "Decal")
		
		-- now for the real stuff
		-- |
		-- |
		-- V
		Instance.new("BlockMesh", torso)
		Instance.new("BlockMesh", lArm)
		Instance.new("BlockMesh", rArm)
		Instance.new("BlockMesh", lLeg)
		Instance.new("BlockMesh", rLeg)
		
		local camera = workspace.Camera
		
		local camPart = Instance.new("Part", camera)
		camPart.Size = Vector3.new(0, 0, 0)
		camPart.CFrame = camera.CFrame
		camPart.CanCollide = false
		camPart.Anchored = true
		camPart.Transparency = 1
		
		local cameraHand = Instance.new("Part", camera)
		cameraHand.Size = Vector3.new(0.65, 1.95, 0.65)
		cameraHand.CanCollide = false
		cameraHand.Anchored = true
		cameraHand.Name = "CameraHand"
		putTexture(cameraHand, "rbxassetid://38934560", "rbxassetid://38934581", 
			"rbxassetid://38934613", "rbxassetid://38934568",
			"rbxassetid://38934601", "rbxassetid://38934591", "Decal")
		
		local cameraHandItem = Instance.new("Part", camera)
		cameraHandItem.Name = "CameraHandItem"
		cameraHandItem.Size = Vector3.new(1.1, 1.1, 1.1)
		cameraHandItem.Anchored = true
		cameraHandItem.CanCollide = false
		cameraHandItem.Transparency = 1	
		
		-- welding doesn't really work.
		--local cameraHandWeld = Instance.new("Motor6D", camPart)
		--cameraHandWeld.Part0 = camPart
		--cameraHandWeld.Part1 = cameraHand
		--cameraHandWeld.C0 = CFrame.new(5, 0, 0)

		local rootJoint = torso:FindFirstChild("RootJoint") or Instance.new("Motor6D", torso)
		rootJoint.Name = "RootJoint"
		rootJoint.Part0 = humRootPart
		rootJoint.Part1 = torso
		rootJoint.C1 = CFrame.new(0, 0.05, 0)
		
		local neck = torso:FindFirstChild("Neck") or Instance.new("Motor6D", torso)
		neck.Name = "Neck"
		neck.Part0 = head
		neck.Part1 = torso
		
		local lS = torso:FindFirstChild("Left Shoulder") or Instance.new("Motor6D", torso)
		lS.Name = "Left Shoulder"
		lS.Part0 = lArm
		lS.Part1 = torso
		lS.C0 = CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(0, 0, 0)
		lS.C1 = CFrame.new(0.65, 0.975, 0)

		local rS = torso:FindFirstChild("Right Shoulder") or Instance.new("Motor6D", torso)
		rS.Name = "Right Shoulder"
		rS.Part0 = rArm
		rS.Part1 = torso
		rS.C0 = CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(0, 0, 0)
		rS.C1 = CFrame.new(-0.65, 0.975, 0) * CFrame.Angles(0, -math.rad(180), 0)

		local lH = torso:FindFirstChild("Left Hip") or Instance.new("Motor6D", torso)
		lH.Name = "Left Hip"
		lH.Part0 = lLeg
		lH.Part1 = torso
		lH.C0 = CFrame.new(0, 0.975, 0)
		lH.C1 = CFrame.new(0.325, -0.975, 0) * CFrame.Angles(0, 0, 0)

		local rH = torso:FindFirstChild("Right Hip") or Instance.new("Motor6D", torso)
		rH.Name = "Right Hip"
		rH.Part0 = rLeg
		rH.Part1 = torso
		rH.C0 = CFrame.new(0, 0.975, 0)
		rH.C1 = CFrame.new(-0.325, -0.975, 0) * CFrame.Angles(0, -math.rad(180), 0)
		
		for _,p in pairs(char:GetChildren()) do
			if p.Name ~= "HumanoidRootPart" and p.ClassName == "Part" then
				local hit = Instance.new("Part", char)
				hit.Name = "DamagePart"
				hit.BrickColor = BrickColor.new("Bright red")
				hit.Material = "SmoothPlastic"
				hit.Transparency = 1
				hit.Size = Vector3.new(p.Size.X + 0.05, p.Size.Y + 0.05, p.Size.Z + 0.05)
				hit.CanCollide = false
				weldTo(hit, p)
			end
		end
		
		wait(0.25)

--		local billNameTag = Instance.new("BillboardGui", char)
--		billNameTag.Size = UDim2.new(1, 0, 1, 0)
--		billNameTag.Adornee = head
--		billNameTag.PlayerToHideFrom = player
--		
--		local textLabel = Instance.new("TextLabel", billNameTag)
--		textLabel.Font = "Arcade"
--		--textLabel.Size = UDim2.new(1, 0, 1, 0)
--		textLabel.TextScaled = true
--		--textLabel.TextSize = 100
--		textLabel.Text = targetName
--		textLabel.Size = UDim2.new(textLabel.TextBounds.X/100, 0, 0.75, 0)
--		textLabel.BorderSizePixel = 0
--		textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
--		textLabel.TextColor3 = Color3.new(1, 1, 1)
--		textLabel.BackgroundTransparency = 0.5
--		
--		if textLabel.Text == "Depr1" then
--			textLabel.TextColor3 = Color3.new(1, 0.75, 0)
--		end
--		
--		billNameTag.SizeOffset = Vector2.new(-textLabel.TextBounds.X/200 + 0.5, 0)
--		billNameTag.StudsOffset = Vector3.new(0, 1.5, 0)
		
		
		humanoid.Parent = char
		
		local ticks = 0
		local times = 0
		
		local walkAnim = 0
		local increaseWalkAnim = 1
		
		local idleAnimRotX = 0
		local idleAnimRotZ = 0
		local sneaking = 0
		
		--local RS = game:GetService("RunService").RenderStepped
		local Mouse = player:GetMouse()		
		
		local oldHP = humanoid.Health
		local damageTime = 0
		
		local punchRotX = 0
		local punchRotY = 0
		local punchRotZ = 0
		local punchRotXcam = 0
		local punchRotYcam = 0
		local punchRotZcam = 0
		local punchSpeed = 0
		local punching = 0
		local selectedBlock = 8
		local punchEnded = 1
		local itemOnHand = nil
		
		local selectBox = Instance.new("SelectionBox", camera)	
		selectBox.Transparency = 0.5
		selectBox.Color3 = Color3.new(0, 0, 0)
		selectBox.LineThickness = 0	
		
		local handItem = Instance.new("Part", char)
		handItem.Name = "HandItem"
		handItem.Size = Vector3.new(0.52, 0.52, 0.52)
		handItem.Transparency = 1	
		handItem.CanCollide = false
		
		local handItemWeld = Instance.new("Weld", char)
		handItemWeld.Part0 = handItem
		handItemWeld.Part1 = lArm
		handItemWeld.C1 = CFrame.new(0, -0.9, -0.6) * CFrame.Angles(math.rad(-10), math.rad(45), 0)	
		
		local sound = Instance.new("Sound", char)
		sound.Name = "Hurt"
		sound.Volume = 10
		sound.SoundId = "rbxassetid://535690488"		
		
		local facesToResize = {"Front", "Back", "Left", "Right", "Bottom", "Top"}
		
		local camCurrentZoom = (camera.CFrame.p - head.Position).magnitude
		Mouse.Button1Down:connect(function()
			if punchEnded == 1 then punching = 1 end
			if Mouse.Target then
				if getDistance(head.CFrame.p, Mouse.Hit.p) <= 10.4 then
					local humanoid = Mouse.Target.Parent:FindFirstChild("Humanoid")
					if humanoid then
						humanoid.Health = humanoid.Health - 10
						local parts = Mouse.Target.Parent:GetChildren()
						for _,p in pairs(parts) do
							if p.ClassName == "Part" then
								p.Velocity = Vector3.new(p.Velocity.X + (head.CFrame.lookVector.X * 18), p.Velocity.Y + (head.CFrame.lookVector.Y * 18) + 8, p.Velocity.Z + (head.CFrame.lookVector.Z * 18))
							end
						end
						return
					end
					local function round(pos, offset)
						local result = {}
						for i, val in pairs{X=pos.X;Y=pos.Y;Z=pos.Z} do
							local def = val - (val%offset)
							result[i] = def
						end
						local endPos = Vector3.new(result.X, result.Y, result.Z)
						return endPos + (Vector3.new(offset,offset,offset)/2)
					end
					local unitRay = Mouse.UnitRay
					local castParams = RaycastParams.new()
					castParams.FilterDescendantsInstances = {player.Character}
					castParams.FilterType = Enum.RaycastFilterType.Blacklist
					local result = Workspace:Raycast(
						unitRay.Origin, unitRay.Direction.unit * 999999999999,
						castParams
					)
					if result then
						local cf = CFrame.new(round(result.Position + result.Normal * 1.5, 2.6))
						local blk = placeBlock(toolBar[selectedBlock + 1], cf, Mouse)
						if blk then
							for _,f in pairs(facesToResize) do
								blk:WaitForChild(f).StudsPerTileU = 2.6
								blk:WaitForChild(f).StudsPerTileV = 2.6
							end
						end
					end
				end
			end
		end)		
		
		local changedItem = false
		local hasItemOnHand = 0
		local hi = 0
		-- selection thingy
		local selectLabel = Instance.new("TextLabel", gui)
		selectLabel.Size = UDim2.new(0, 32, 0, 32)
		selectLabel.Position = UDim2.new(0.5, -160 + (selectedBlock*40), 1, -105)
		selectLabel.BackgroundTransparency = 1
		selectLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		selectLabel.BorderSizePixel = 0
		selectLabel.Text = ""
		selectLabel.ZIndex = 3
		
		makeSquare(UDim2.new(0, -2, 0, 0), UDim2.new(0, 2, 0, 32),
			Color3.new(88/255, 102/255, 85/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -2, 0, -2), UDim2.new(0, 32, 0, 2),
			Color3.new(88/255, 102/255, 85/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -2, 0, 32), UDim2.new(0, 36, 0, 2),
			Color3.new(212/255, 231/255, 207/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 32, 0, 0), UDim2.new(0, 2, 0, 32),
			Color3.new(212/255, 231/255, 207/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 34, 0, -4), UDim2.new(0, 2, 0, 40),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -4, 0, -4), UDim2.new(0, 2, 0, 40),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -4, 0, -4), UDim2.new(0, 40, 0, 2),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 32, 0, -2), UDim2.new(0, 2, 0, 2),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -4, 0, 34), UDim2.new(0, 40, 0, 2),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -6, 0, -6), UDim2.new(0, 2, 0, 42),
			Color3.new(212/255, 231/255, 207/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, -6, 0, -6), UDim2.new(0, 42, 0, 2),
			Color3.new(212/255, 231/255, 207/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 36, 0, -4), UDim2.new(0, 2, 0, 40),
			Color3.new(88/255, 102/255, 85/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 36, 0, -6), UDim2.new(0, 2, 0, 2),
			Color3.new(163/255, 180/255, 159/255), 0, selectLabel, 3)
		makeSquare(UDim2.new(0, 38, 0, -6), UDim2.new(0, 2, 0, 44),
			Color3.new(0/255, 0/255, 0/255), 0.3, selectLabel, 3)
		makeSquare(UDim2.new(0, -8, 0, -6), UDim2.new(0, 2, 0, 44),
			Color3.new(0/255, 0/255, 0/255), 0.3, selectLabel, 3)
		makeSquare(UDim2.new(0, -8, 0, -8), UDim2.new(0, 48, 0, 2),
			Color3.new(0/255, 0/255, 0/255), 0, selectLabel, 3)
		--	
		local oldItemOnHand = itemOnHand
		function updateItemOnHand()
			for _,d in pairs(handItem:GetChildren()) do
				d:Destroy()
			end
			for _,d in pairs(cameraHandItem:GetChildren()) do
				d:Destroy()
			end
			if itemOnHand ~= nil then
				putTexture(handItem, itemOnHand.frontTex, itemOnHand.backTex,
					itemOnHand.topTex, itemOnHand.bottomTex,
					itemOnHand.leftTex, itemOnHand.rightTex, "Texture")
				
				putTexture(cameraHandItem, itemOnHand.frontTex, itemOnHand.backTex,
					itemOnHand.topTex, itemOnHand.bottomTex,
					itemOnHand.leftTex, itemOnHand.rightTex, "Texture")
				
				for _,f in pairs(facesToResize) do
					handItem:WaitForChild(f).StudsPerTileU = 0.52
					handItem:WaitForChild(f).StudsPerTileV = 0.52
				end
				
				for _,f in pairs(facesToResize) do
					cameraHandItem:WaitForChild(f).StudsPerTileU = 1.1
					cameraHandItem:WaitForChild(f).StudsPerTileV = 1.1
				end
				
				cameraHand.Transparency = 1
				for _,f in pairs(facesToResize) do
					cameraHand:WaitForChild(f).Transparency = 1
					cameraHand:WaitForChild(f).Transparency = 1
				end
			else
				cameraHand.Transparency = 0
				for _,f in pairs(facesToResize) do
					cameraHand:WaitForChild(f).Transparency = 0
					cameraHand:WaitForChild(f).Transparency = 0
				end
			end
			if oldItemOnHand ~= itemOnHand then
				changedItem = true
			end
		end		
		
		local pressedWTimes = 0
		local sprintingNum = 0
		local sprinting = false
		Mouse.KeyDown:connect(function(key)
			if sprinting == false then sprintingNum = 0 else sprintingNum = 1 end
			if (key == "w" and sprinting == false and sneaking == 0) then
				if pressedWTimes >= 1 or key == Enum.KeyCode.LeftControl then
					sprinting = true
					humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
					pressedWTimes = 0
					coroutine.resume(coroutine.create(function()
						for i = 1, 24 do
							camera.FieldOfView = camera.FieldOfView + ((24-i)/10)
							RS:wait()
						end
					end))
				end
				pressedWTimes = pressedWTimes + 1
				coroutine.resume(coroutine.create(function()
					for i = 1, 9 do
						if sprinting == true then break end
						wait()
					end
					pressedWTimes = 0
				end))
			end
			if key == "q" and sprinting == false then
				sneaking = 1
				humanoid.WalkSpeed = humanoid.WalkSpeed / 2
				humanoid.HipHeight = humanoid.HipHeight - 0.35
				rootJoint.C1 = CFrame.new(0, 0.325, 0) * CFrame.Angles(math.rad(sneaking*45), 0, 0)
				lH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(-math.rad(sneaking*45), 0, 0)
				rH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(math.rad(sneaking*45), 0, 0)
				--print("Sneaking...")
			end
			if key == "e" then
				if creativeInventoryGUI.Visible == true then
					creativeInventoryGUI.Visible = false
				elseif creativeInventoryGUI.Visible == false then
					creativeInventoryGUI.Visible = true
				end
			end
			if key == "1" or key == "2" or key == "3" or
				 key == "4" or key == "5" or key == "6" or
				 key == "7" or key == "8" or key == "9" then
				selectedBlock = tonumber(key) - 1
				oldItemOnHand = itemOnHand
				itemOnHand = toolBar[tonumber(key)]
				updateItemOnHand()
				if hasItemOnHand == 0 and itemOnHand then hi = 1 end
				if hasItemOnHand == 1 and itemOnHand == nil then hi = 1 end
			end
			--if (key == "0" or key == "1" or key == "2" 
			--	or key == "3" or key == "4" or key == "5"
			--	or key == "6" or key == "7") and hasItemOnHand == 0 then hi = 1 end
			selectLabel.Position = UDim2.new(0.5, -160 + ((selectedBlock)*40), 1, -105)
		end)
		
		local interrump = false
		game:GetService('RunService'):BindToRenderStep('Camera', Enum.RenderPriority.Camera.Value, function()
			if humanoid.Health < oldHP then
				interrump = true
				RS:wait()
				interrump = false
				for i = 1, 15 do
					if interrump == true then interrump = false break end
					camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, -math.rad(15-i))
					RS:wait()
				end
			end
		end)
		
		local changedPerspective = 0
		Mouse.KeyUp:connect(function(key)
			if sprinting == false then sprintingNum = 0 else sprintingNum = 1 end
			if (key == "w" and sprinting == true and sneaking == 0) then
				sprinting = false
				humanoid.WalkSpeed = humanoid.WalkSpeed / 1.5
				coroutine.resume(coroutine.create(function()
					for i = 1, 24 do
						camera.FieldOfView = camera.FieldOfView - ((24-i)/10)
						RS:wait()
					end
				end))
			end
			if key == "q" and sprinting == false then
				sneaking = 0
				humanoid.WalkSpeed = humanoid.WalkSpeed * 2
				humanoid.HipHeight = humanoid.HipHeight + 0.35
				rootJoint.C1 = CFrame.new(0, 0.05, 0) * CFrame.Angles(0, 0, 0)
				lH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(0, 0, 0)
				rH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(0, 0, 0)
				--print("Stopped sneaking...")
			end
			if key == "r" then
				if changedPerspective == 0 then
					changedPerspective = 1
					camera.CFrame = camera.CFrame * CFrame.Angles(0, math.rad(180), 0)
				elseif changedPerspective == 1 then
					changedPerspective = 0
					camera.CFrame = camera.CFrame * CFrame.Angles(0, math.rad(-180), 0)
				end
			end
		end)
		
		Mouse.TargetFilter = camera

		local dead = false
		local humOffset = CFrame.new(0, 0, 0)
		local camHandY = 0
		local camHandZ = 0
		local cameraHandCFrame = CFrame.new(1.15, -1.35, -2) * CFrame.fromEulerAnglesXYZ(math.rad(90), math.rad(55), math.rad(20))
		local bodyRot = CFrame.new(0, 0, 0)
		local lastCamRot = camPart.Orientation
		while RS:wait() do
			hearts.Size = UDim2.new(0, SnapToGrid((humanoid.Health/humanoid.MaxHealth)*162, 8) + 2, 0, 18)
			camCurrentZoom = ((CFrame.new(0, -1*sneaking, 0) * camera.CFrame).p - head.Position).magnitude
			if itemOnHand ~= nil then 
				hasItemOnHand = 1 
				handItem.Transparency = itemOnHand.transparency
			else 
				hasItemOnHand = 0 
				handItem.Transparency = 1
			end
			if humanoid.Health <= 0 and dead == false then
				dead = true
				local corpseCF = humRootPart.CFrame + Vector3.new(0, -2.925, 0)
				local corpse = Instance.new("Part", workspace)
				corpse.Name = "Dead Corpse"
				corpse.Size = Vector3.new(3, 1, 3)
				corpse.CFrame = corpseCF
				corpse.Transparency = 1
				corpse.CustomPhysicalProperties = PhysicalProperties.new(1, 1, 0, 1, 1)
				
				local dHead = Instance.new("Part", corpse)
				dHead.CanCollide = false
				dHead.Material = "Fabric"

				local dTorso = Instance.new("Part", corpse)
				dTorso.CanCollide = false
				dTorso.Material = "Fabric"
				
				local dLArm = Instance.new("Part", corpse)
				dLArm.CanCollide = false
				dLArm.Material = "Fabric"
				
				local dRArm = Instance.new("Part", corpse)
				dRArm.CanCollide = false
				dRArm.Material = "Fabric"
				
				local dLLeg = Instance.new("Part", corpse)
				dLLeg.CanCollide = false
				dLLeg.Material = "Fabric"
				
				local dRLeg = Instance.new("Part", corpse)
				dRLeg.CanCollide = false
				dRLeg.Material = "Fabric"
				
				dHead.Size = Vector3.new(1.3, 1.3, 1.3)
				putTexture(dHead, "rbxassetid://38738031", "rbxassetid://36047330", 
					"rbxassetid://36047341", "rbxassetid://36047347",
					"rbxassetid://36047323", "rbxassetid://36047315", "Decal")
				
				dTorso.Size = Vector3.new(1.3, 1.95, 0.65)
				putTexture(dTorso, "rbxassetid://38934753", "rbxassetid://38934731", 
					"rbxassetid://38934780", "rbxassetid://38934740",
					"rbxassetid://38934762", "rbxassetid://38934762", "Decal")
				
				dLArm.Size = Vector3.new(0.65, 1.95, 0.65)
				putTexture(dLArm, "rbxassetid://38934581", "rbxassetid://38934560", 
					"rbxassetid://38934613", "rbxassetid://38934568",
					"rbxassetid://38934601", "rbxassetid://38934591", "Decal")
				
				dRArm.Size = Vector3.new(0.65, 1.95, 0.65)
				putTexture(dRArm, "rbxassetid://38934560", "rbxassetid://38934581", 
					"rbxassetid://38934613", "rbxassetid://38934568",
					"rbxassetid://38934601", "rbxassetid://38934591", "Decal")
				
				dLLeg.Size = Vector3.new(0.65, 1.95, 0.65)
				putTexture(dLLeg, "rbxassetid://38936226", "rbxassetid://38936209", 
					"rbxassetid://38934719", "rbxassetid://38934712",
					"rbxassetid://38936255", "rbxassetid://38936242", "Decal")
				
				dRLeg.Size = Vector3.new(0.65, 1.95, 0.65)
				putTexture(dRLeg, "rbxassetid://38936209", "rbxassetid://38936226", 
					"rbxassetid://38934719", "rbxassetid://38934712",
					"rbxassetid://38936242", "rbxassetid://38936255", "Decal")
				
				local weldCorpse = weldTo(dTorso, corpse)
				weldCorpse.C0 = CFrame.new(0, -1.95 - 0.4, 0)
				
				-- lazy naming...

				local weld1 = weldTo(dTorso, dHead)
				weld1.C0 = CFrame.new(0, 1.625, 0)

				local weld2 = weldTo(dTorso, dLArm)
				weld2.C0 = CFrame.new(0.325, 0.975, 0) * CFrame.Angles(0, 0, 0)
				weld2.C1 = CFrame.new(-0.65, 0.975, 0)
				
				local weld3 = weldTo(dTorso, dRArm)
				weld3.C0 = CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(0, 0, 0)
				weld3.C1 = CFrame.new(-0.65, 0.975, 0) * CFrame.Angles(0, -math.rad(180), 0)
				
				local weld4 = weldTo(dTorso, dLLeg)
				weld4.C0 = CFrame.new(0, -0.975, 0)
				weld4.C1 = CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(0, 0, 0)
				
				local weld5 = weldTo(dTorso, dRLeg)
				weld5.C0 = CFrame.new(0, -0.975, 0)
				weld5.C1 = CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(0, -math.rad(180), 0)
				
				for _,p in pairs(corpse:GetChildren()) do
					if p.ClassName == "Part" then
						local hit = Instance.new("Part", p)
						hit.Name = "DamagePart"
						hit.BrickColor = BrickColor.new("Bright red")
						hit.Material = "SmoothPlastic"
						hit.Transparency = 0.5
						hit.Size = Vector3.new(p.Size.X + 0.05, p.Size.Y + 0.05, p.Size.Z + 0.05)
						hit.CanCollide = false
						weldTo(hit, p)
					end
				end
				
				head.Parent = nil
				torso.Parent = nil
				lArm.Parent = nil
				rArm.Parent = nil
				lLeg.Parent = nil
				rLeg.Parent = nil
				
				weldTo(dTorso, humRootPart)
				
				coroutine.resume(coroutine.create(function()
					for i = 1, 55 do
						corpse.CFrame = corpseCF --*
							--CFrame.Angles(math.rad(-corpse.Orientation.X), 0, math.rad(-corpse.Orientation.Z))
						
						weldCorpse.C1 = weldCorpse.C1:lerp(CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90)), 0.075)
						RS:wait()
					end
					for _,p in pairs(corpse:GetChildren()) do
						p:Destroy()
					end
					
					corpse.Anchored = true
					
					local smoke = Instance.new("ParticleEmitter", corpse)
					smoke.Size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.6),
						NumberSequenceKeypoint.new(1, 0.6)
					})
					smoke.Texture = "rbxassetid://1494734425"
					smoke.Rate = 100
					smoke.Lifetime = NumberRange.new(0.6, 1.2)
					smoke.Speed = NumberRange.new(2, 5)
					smoke.SpreadAngle = Vector2.new(-30, 30)
					
					wait(0.07)
					
					smoke.Enabled = false
					
					wait(2)
					
					corpse:Destroy()
				end))
				print("You died!")
			end
			if humanoid.Health < oldHP then
				damageTime = 60
				sound:Play()
			end
			oldHP = humanoid.Health
			if damageTime > 0 and humanoid.Health > 0 then
				for _,p in pairs(char:GetChildren()) do
					if p.Name ~= "HumanoidRootPart" and p.ClassName == "Part" then
						if p.Name == "DamagePart" then
							p.Transparency = 0.5
						end
					end
				end
				damageTime = damageTime - 2
				if damageTime <= 0 then
					for _,p in pairs(char:GetChildren()) do
						if p.Name ~= "HumanoidRootPart" and p.ClassName == "Part" then
							if p.Name == "DamagePart" then
								p.Transparency = 1
							end
						end
					end
				end
			end
			camPart.CFrame = camera.CFrame * CFrame.Angles(0, math.rad(changedPerspective*180), 0)
			
			if getMagnitudeXZ(torso.Velocity) > 1 then
				if walkAnim >= 1 then
					increaseWalkAnim = -1
				elseif walkAnim <= -1 then
					increaseWalkAnim = 1
				end
				walkAnim = walkAnim + (increaseWalkAnim/(10+(sneaking*20))) * ((5 + getMagnitudeXZ(torso.Velocity))/20)
			else
				walkAnim = 0
			end
			
			--lH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(-math.rad(sneaking*45), 0, 0)
			--rH.C0 = CFrame.new(0, 0.975, 0) * CFrame.Angles(math.rad(sneaking*45), 0, 0)
			lH.C0 = lH.C0:lerp(CFrame.new(0, 0.975, 0) * CFrame.Angles(math.max(math.rad(-60), math.min(math.rad(60), -math.rad(sneaking*45) + math.rad(damageTime*1.5) + math.rad(walkAnim*getMagnitudeXZ(torso.Velocity)*5/(1+sneaking)))), 0, 0), 0.15)
	    	rH.C0 = rH.C0:lerp(CFrame.new(0, 0.975, 0) * CFrame.Angles(math.max(math.rad(-60), math.min(math.rad(60), math.rad(sneaking*45) + math.rad(damageTime*1.5) + math.rad(walkAnim*getMagnitudeXZ(torso.Velocity)*5/(1+sneaking)))), 0, 0), 0.15)
			--
			--rootJoint.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
			--print(math.abs(head.Orientation.Y) - math.abs(humRootPart.Orientation.Y))
			--if (head.Orientation.Y * 2) - (head.Orientation.Y + torso.Orientation.Y) > 45 then
				--humRootPart.CFrame = humRootPart.CFrame * CFrame.Angles(0, math.rad(-45 + head.Orientation.Y), 0)
				--print("-45")
			--end
			--if (head.Orientation.Y * 2) - (head.Orientation.Y + torso.Orientation.Y) < -45 then
				--humRootPart.CFrame = humRootPart.CFrame * CFrame.Angles(0, math.rad(45 + head.Orientation.Y), 0)
				--print("45")
			--end
			
			if changedItem then
				changedItem = false
				coroutine.resume(coroutine.create(function()
					for i = 1, 8 do
						camHandY = camHandY - 0.2
						RS:wait()
					end
					for i = 1, 8 do
						camHandY = camHandY + 0.2
						RS:wait()
					end
				end))
			end			
			
			--move these arms
			rootJoint.C1 = rootJoint.C1:lerp(CFrame.new(0, 0.325, 0) * CFrame.Angles(math.rad(sneaking*45), math.rad(punchRotY), 0), 0.2)
			
	    	lS.C0 = lS.C0:lerp(CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(math.max(math.rad(-60), math.min(math.rad(60), idleAnimRotX/20 + math.rad(-hasItemOnHand*10) + math.rad(punchRotX) + math.rad(damageTime*1.5) + math.rad(walkAnim*getMagnitudeXZ(torso.Velocity)*5/(1+sneaking)))), 0, math.rad(punchRotZ) + idleAnimRotZ/20), 0.025+(math.min(1, getMagnitudeXZ(torso.Velocity))/12)*2 + divide(punchSpeed, 6) + hi)
	    	rS.C0 = rS.C0:lerp(CFrame.new(-0.325, 0.975, 0) * CFrame.Angles(math.max(math.rad(-60), math.min(math.rad(60), idleAnimRotX/20 + math.rad(damageTime*1.5) + math.rad(walkAnim*getMagnitudeXZ(torso.Velocity)*5/(1+sneaking)))), 0, idleAnimRotZ/20), 0.025+(math.min(1, getMagnitudeXZ(torso.Velocity))/12)*2)
			
			if Mouse.Target and getDistance(head.CFrame.p, Mouse.Hit.p) <= 10.4 then 
				if Mouse.Target.Parent:FindFirstChild("Humanoid") == nil and Mouse.Target.Parent ~= camera then
					selectBox.Adornee = Mouse.Target
				else 
					selectBox.Adornee = nil 
				end
			else 
				selectBox.Adornee = nil 
			end		
			
			--local neckYRot = math.rad(camPart.Orientation.Y - torso.Orientation.Y)
			
			--neck.C1 = CFrame.new(0, 0.975, 0) * CFrame.fromEulerAnglesXYZ(math.rad(sneaking*45), neckYRot, 0)
			--neck.C0 = CFrame.new(0, -0.65, 0) * CFrame.Angles(-math.rad(camPart.Orientation.X - torso.Orientation.X - (sneaking*45)), 0, 0)	
			
			--print(AngleDifference(camPart.Orientation, torso.Orientation).Y)	
			
			local negate = 1
			if torso.Velocity.Y < 0 then
				negate = -1
			end
			
			--local vel = math.log(math.abs(torso.Velocity.Y))*negate
			--if vel == math.huge or vel == -math.huge then vel = 0.1 end
			--local vel = torso.Velocity.Y^0.6
			
			local BobbingY = walkAnim*2
			if BobbingY >= 1 then BobbingY = 1 BobbingY = -BobbingY end
			
			local rotationSpeed = AngleDifference(camPart.Orientation, lastCamRot)	
					
			local BobbingX = -0.5 + walkAnim
			
			--cameraHandCFrame = cameraHandCFrame:lerp(CFrame.new(1.15*1.3 + (walkAnim/2 - (walkAnim/4)), -1.35*1.3 + camHandY + (-BobbingY/8) + 0, -0.45 + -camHandZ + ((camera.FieldOfView/45)-1.6)*1.3) * CFrame.Angles(math.rad(punchRotXcam), math.rad(punchRotYcam), math.rad(punchRotZcam)) * CFrame.new(0, 0, -1.75) * CFrame.fromEulerAnglesXYZ(math.rad(85), math.rad(55), math.rad(22.5)), 0.25)
			cameraHandCFrame = cameraHandCFrame:lerp(CFrame.Angles(math.rad(rotationSpeed.X/1.5), math.rad(rotationSpeed.Y/1.5), math.rad(rotationSpeed.Z/1.5)) * CFrame.new(1.15*1.3 + (BobbingX/3.5), -1.35*1.3 + camHandY + ((0.4-BobbingY)/7) + 0, -0.45 + -camHandZ + ((camera.FieldOfView/45)-1.6)*1.3) * CFrame.Angles(math.rad(punchRotXcam), math.rad(punchRotYcam), math.rad(punchRotZcam)) * CFrame.new(0, 0, -1.75) * CFrame.fromEulerAnglesXYZ(math.rad(85), math.rad(55), math.rad(22.5)), 0.25)			
			
			humOffset = humOffset:lerp(CFrame.new(walkAnim/4 - (walkAnim/8), BobbingY/13, 0), 0.25)
			humanoid.CameraOffset = Vector3.new(humOffset.X, humOffset.Y, 0)
			
			cameraHand.CFrame = camPart.CFrame * cameraHandCFrame
			
			cameraHandItem.CFrame = cameraHand.CFrame * CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(-210), math.rad(-40), math.rad(-100)) * CFrame.new(0, -0.35, 0)
			
			if camCurrentZoom >= 1.5 then
				cameraHand.Transparency = 1
				for _,t in pairs(cameraHand:GetChildren()) do
					if t.Transparency == 0 then
						t.Transparency = 1
					end
				end
				for _,t in pairs(cameraHandItem:GetChildren()) do
					if t.Transparency == 0 then
						t.Transparency = 1
					end				
				end
			else
				changedPerspective = 0
				cameraHand.Transparency = hasItemOnHand
				for _,t in pairs(cameraHand:GetChildren()) do
					if t.Transparency == 1 then
						t.Transparency = hasItemOnHand
					end
				end
				for _,t in pairs(cameraHandItem:GetChildren()) do
					if t.Transparency == 1 then
						t.Transparency = 0
					end				
				end				
			end		
			
			if updateHand == true then
				updateHand = false
				updateItemOnHand()
			end
			
			if punching == 1 and punchEnded == 1 then
				punching = 0
				--print("steve uses punch!!")
				local coPunchCam = coroutine.wrap(function()
					local mult = 2.25
					punchRotXcam = 40/2*mult
					punchRotYcam = 25/2*mult
					camHandZ = 2.5
					wait(0.075/4)
					punchRotXcam = 50/2*mult
					punchRotYcam = 25*mult
					punchRotZcam = -10*mult
					camHandZ = 1
					wait(0.075/4)
					punchRotYcam = 50/1.5*mult
					punchRotXcam = -10*mult
					--wait(0.075/2)
					--punchRotYcam = 50
					--punchRotXcam = -10
					wait(0.02)
					punchRotXcam = -20*mult
					wait(0.055)
					camHandZ = 0
					punchRotXcam = 0
					punchRotYcam = 0
					punchRotZcam = 0
				end)
				local coPunch = coroutine.wrap(function()
					punchEnded = 0
					punchSpeed = 1
					punchRotX = -60
					punchRotY = -8
					punchRotZ = -35
					
					wait(0.075/1.3)
					punchSpeed = 1
					punchRotX = -75
					punchRotY = 8
					punchRotZ = 40
					wait(0.075/1.3)
					punchSpeed = 1
					punchRotX = -20
					punchRotZ = 40
					wait(0.075/1.3)
					punchSpeed = 3.5
					punchRotX = 0
					punchRotY = 0
					punchRotZ = 0
					
					punchRotXcam = 0
					punchRotYcam = 0
					punchRotZcam = 0				
					
					punchEnded = 1
					wait(0.06/1.3)	
					punchSpeed = 0			
				end)
				coPunch()
				coPunchCam()
			end			
			if ticks > 20 then
				ticks = 0
				if times == 0 then
					times = times + 1
					idleAnimRotX = -1
					idleAnimRotZ = 0
				elseif times == 1 then
					times = times + 1
					idleAnimRotX = -0.75
					idleAnimRotZ = -0.75
				elseif times == 2 then
					times = times + 1
					idleAnimRotX = 0
					idleAnimRotZ = -1
				elseif times == 3 then
					times = times + 1
					idleAnimRotX = 0.75
					idleAnimRotZ = -0.75
					--idleAnimRotX = 0.75
					--idleAnimRotZ = -0
				elseif times == 4 then
					times = times + 1
					idleAnimRotX = 1
					idleAnimRotZ = 0
					--idleAnimRotX = 1
					--idleAnimRotZ = 0
				elseif times == 5 then
					times = times + 1
					idleAnimRotX = 0.75
					idleAnimRotZ = 0.75
				elseif times == 6 then
					times = times + 1
					idleAnimRotX = 0
					idleAnimRotZ = 1
				elseif times == 7 then
					times = 0
					idleAnimRotX = -0.75
					idleAnimRotZ = 0.75
				end
			end

			if hi == 1 then hi = 0 end
			
			local rotX = math.deg(math.atan2(humanoid.MoveDirection.Z, humanoid.MoveDirection.X)) + 90
			if humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
				--print(rotX)
				bodyRot = bodyRot:lerp(CFrame.Angles(0, -math.rad(rotX), 0), 0.125)
				humRootPart.CFrame = CFrame.new(humRootPart.CFrame.p.X, humRootPart.CFrame.p.Y, humRootPart.CFrame.p.Z) * bodyRot
			end
			local neckYRot = math.rad(camPart.Orientation.Y - torso.Orientation.Y)
			neck.C1 = CFrame.new(0, 0.975, 0) * CFrame.fromEulerAnglesXYZ(math.rad(sneaking*45), neckYRot, 0)
			neck.C0 = CFrame.new(0, -0.65, 0) * CFrame.Angles(-math.rad(camPart.Orientation.X - torso.Orientation.X - (sneaking*45)), 0, 0)	
			
			local oldTorsoOrientation = torso.Orientation
			if AngleDifference(camPart.Orientation, torso.Orientation).Y > 45 then
				humRootPart.CFrame = CFrame.new(humRootPart.CFrame.p.X, humRootPart.CFrame.p.Y, humRootPart.CFrame.p.Z) * CFrame.Angles(0, math.rad(head.Orientation.Y + 45), 0)
				bodyRot = CFrame.Angles(0, math.rad(head.Orientation.Y + 45), 0)
				--print("-45")
			elseif AngleDifference(camPart.Orientation, torso.Orientation).Y < -45 then
				humRootPart.CFrame = CFrame.new(humRootPart.CFrame.p.X, humRootPart.CFrame.p.Y, humRootPart.CFrame.p.Z) * CFrame.Angles(0, math.rad(head.Orientation.Y - 45), 0)
				bodyRot = CFrame.Angles(0, math.rad(head.Orientation.Y - 45), 0)
				--print("45")
			end		
			
			lastCamRot = camPart.Orientation
			neck.C1 = neck.C1 * CFrame.fromEulerAnglesXYZ(0, -math.rad(AngleDifference(oldTorsoOrientation, torso.Orientation).Y), 0)
			ticks = ticks + 1
		end
	end
end