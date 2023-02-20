Config = {}

Config.Discord = {
    Webhook = '',
    Icon = 'https://avatars.cloudflare.steamstatic.com/0698ae9b5b24c98eebf677685eb0799ce24084d4_full.jpg',
    Logo = 'https://avatars.cloudflare.steamstatic.com/0698ae9b5b24c98eebf677685eb0799ce24084d4_full.jpg',
    Name = 'Source Webhook'
    
}


Config.Locations = {
    {
        type = 2, -- marker type / https://docs.fivem.net/docs/game-references/markers/
        name = "Crafting", -- Maker name must be unique
        coord = vector3(18.82, -1111.97, 29.8), --  coord
        job = 'all', --  if all everyone can access
        MarkerColor = {
            R = 220, -- Marker Color (R)
            G = 220,   -- Marker Color (G)
            B = 220,   -- Marker Color (B)
            A = 70,  -- Marker Color (A)
        },
        MarkerSize = {
            X = 0.3,  -- Marker Size (X)
            Y = 0.3,  -- Marker Size (Y)
            Z = 0.3,  -- Marker Size (Z)
        },
    },

}

Config.MenuHeader = {
    MenuHeader = 'Craft Menu',
    MenuAltText = 'Craft Items'
}

Config.Itemlist = {

    [1] = {
        ['label'] = "Pistol Ammo", 
        ['item'] = "pistol_ammo", 
        ['count'] = "5", 
        ['menutxt'] = '5x Stone',
        ['weapon'] = false        
    }, 
    [2] = {
        ['label'] = "Glock 19", 
        ['item'] = "weapon_pistol", 
        ['count'] = "1", 
        ['menutxt'] = '2x Water',
        ['weapon'] = true,
        
        
    }, 
    [3] = {
        ['label'] = "Heavy Armor", 
        ['item'] = "armor", 
        ['count'] = "5", 
        ['menutxt'] = '5x Iron',
        ['weapon'] = false
        
    }, 
    
}

Config.Recipes = { 
	['armor'] = {
		['materials'] = { 
			['iron'] = 5,
		   }
        },
    ['weapon_pistol'] = {
            ['materials'] = { 
                ['water'] = 2,		
               }
         },
    ['pistol_ammo'] = {
            ['materials'] = { 
                ['stone'] = 5,		
               }
         },    
    }

