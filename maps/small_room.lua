function CreateMap1()
  return {
    version = "1.1",
    luaversion = "5.1",
    tiledversion = "1.2.3",
    orientation = "orthogonal",
    renderorder = "right-down",
    width = 12,
    height = 12,
    tilewidth = 16,
    tileheight = 16,
    nextlayerid = 3,
    nextobjectid = 1,
    properties = {},
    tilesets = {
      {
        name = "rpg_indoor",
        firstgid = 1,
        tilewidth = 16,
        tileheight = 16,
        spacing = 0,
        margin = 0,
        columns = 11,
        image = "rpg_indoor.png",
        imagewidth = 176,
        imageheight = 192,
        tileoffset = {
          x = 0,
          y = 0
        },
        grid = {
          orientation = "orthogonal",
          width = 16,
          height = 16
        },
        properties = {},
        terrains = {},
        tilecount = 132,
        tiles = {}
      },
      {
        name = "collision_graphic",
        firstgid = 133,
        filename = "collision_graphic.tsx",
        tilewidth = 16,
        tileheight = 16,
        spacing = 0,
        margin = 0,
        columns = 2,
        image = "collision_graphic.png",
        imagewidth = 32,
        imageheight = 32,
        tileoffset = {
          x = 0,
          y = 0
        },
        grid = {
          orientation = "orthogonal",
          width = 16,
          height = 16
        },
        properties = {},
        terrains = {},
        tilecount = 4,
        tiles = {}
      }
    },
    layers = {
      {
        type = "tilelayer",
        id = 1,
        name = "Tile Layer 1",
        x = 0,
        y = 0,
        width = 12,
        height = 12,
        visible = true,
        opacity = 1,
        offsetx = 0,
        offsety = 0,
        properties = {},
        encoding = "lua",
        data = {
          1, 2, 3, 4, 2, 2, 3, 4, 5, 6, 10, 11,
          12, 13, 14, 15, 13, 13, 14, 15, 16, 17, 21, 22,
          94, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 70,
          94, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 81,
          94, 73, 73, 73, 1, 48, 48, 11, 73, 73, 73, 70,
          94, 73, 73, 73, 23, 29, 29, 33, 73, 73, 73, 70,
          94, 73, 73, 73, 45, 48, 48, 55, 73, 73, 73, 70,
          94, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 70,
          94, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 70,
          94, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 70,
          45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 52, 55,
          56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 63, 66
        }
      },
      {
        type = "tilelayer",
        id = 2,
        name = "collision",
        x = 0,
        y = 0,
        width = 12,
        height = 12,
        visible = true,
        opacity = 0.3,
        offsetx = 0,
        offsety = 0,
        properties = {},
        encoding = "lua",
        data = {
          133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133,
          133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 0, 133,
          133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133,
          133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133,
          133, 0, 0, 0, 133, 133, 133, 133, 0, 0, 0, 133,
          133, 0, 0, 0, 133, 0, 0, 133, 0, 0, 0, 133,
          133, 0, 0, 0, 133, 133, 133, 133, 0, 0, 0, 133,
          133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133,
          133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133,
          133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133,
          133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133,
          133, 133, 133, 133, 133, 133, 133, 133, 133, 0, 133, 133
        }
      }
    }
}
end