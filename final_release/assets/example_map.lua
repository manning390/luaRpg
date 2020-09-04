function CreateMap1()
return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.3",
  orientation = "orthogonal",
  renderorder = "left-down",
  width = 8,
  height = 7,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "atlas",
      firstgid = 1,
      filename = "atlas.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "atlas.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 256,
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
      width = 8,
      height = 7,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 5, 7, 1, 1, 1,
        1, 1, 1, 5, 7, 1, 2, 3,
        1, 1, 1, 5, 7, 1, 5, 6,
        1, 1, 1, 5, 7, 1, 5, 6,
        1, 1, 2, 11, 7, 1, 5, 6,
        1, 1, 5, 6, 7, 1, 8, 9,
        1, 1, 5, 6, 7, 1, 1, 1
      }
    }
  }
}
end