return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 24,
  height = 200,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 182,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 9,
      image = "../../../graphics/tileset.png",
      imagewidth = 144,
      imageheight = 64,
      objectalignment = "unspecified",
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
      tilecount = 36,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 24,
      height = 200,
      id = 2,
      name = "ground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 17, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 6, 0, 0, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 5, 5, 5, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 14, 17, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 5, 5, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 6, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 18, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4, 5, 5, 5, 18, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 17, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14, 14, 17, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 5, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 5, 0, 4, 18, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 5, 0, 0, 0, 5, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 0, 0, 5, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
        14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "entity",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "Player",
          type = "player",
          shape = "rectangle",
          x = 128,
          y = 3152,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 178,
          name = "Ice Goblin",
          type = "iceGoblin",
          shape = "rectangle",
          x = 48,
          y = 2096,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 179,
          name = "Ice Goblin",
          type = "iceGoblin",
          shape = "rectangle",
          x = 64,
          y = 3040,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "powerup",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "object",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 139,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 720,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 140,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 704,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 141,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 704,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 142,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 640,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 143,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272.5,
          y = 640,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 144,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 624,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 149,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 560,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 150,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 544,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 151,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 544,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 153,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 480,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 154,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 480,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 155,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 464,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 157,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 400,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 384,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 384,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 161,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 320,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 162,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 320,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 163,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 304,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 164,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 208,
          y = 240,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 165,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 224,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 166,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 224,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 336,
          y = 160,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 168,
          name = "Breakable",
          type = "breakable",
          shape = "rectangle",
          x = 272,
          y = 160,
          width = 16,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 175,
          name = "Flag",
          type = "flag",
          shape = "rectangle",
          x = 336,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 177,
          name = "Enemy Collider",
          type = "collider",
          shape = "rectangle",
          x = 112,
          y = 2096,
          width = 1,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 180,
          name = "Enemy Collider",
          type = "collider",
          shape = "rectangle",
          x = 128,
          y = 3038,
          width = 1,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 181,
          name = "Enemy Collider",
          type = "collider",
          shape = "rectangle",
          x = 32,
          y = 3040,
          width = 1,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "solid",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 3168,
          width = 384,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 3136,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 3120,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 3104,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 3088,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 3056,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 3024,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2992,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 2992,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2992,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2960,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 2960,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 2960,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 2912,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 2928,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2928,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2912,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2880,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2864,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2848,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2832,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2816,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2800,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2784,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2768,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2704,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2720,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2736,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2752,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2688,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2672,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2656,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2640,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2624,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2608,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2592,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2576,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2560,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2544,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2528,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2512,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2496,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2480,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2464,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2448,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2432,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2416,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2400,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2384,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2368,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2352,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2336,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 54,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2320,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2304,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2288,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2272,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2256,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2240,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2224,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2208,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 2176,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 2160,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2144,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2128,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 2112,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 2080,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 2064,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 2048,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 2032,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 2000,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 73,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1984,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 74,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1968,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 75,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1952,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 76,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 1936,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 77,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 1920,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 78,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 1920,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 79,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1904,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 80,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 1888,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 81,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1856,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 1840,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1840,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 84,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1824,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 85,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1808,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 86,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 1776,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 87,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 1760,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1744,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 1728,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1696,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1680,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 92,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1664,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1648,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 1616,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1616,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 1600,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1568,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1552,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1536,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 100,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1520,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 101,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1504,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 1472,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 103,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1456,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1456,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 105,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 1440,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 106,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 1408,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 107,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 1376,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 108,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1344,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 109,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 1312,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 110,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 1280,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 111,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 1248,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 112,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 1216,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 113,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1184,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 114,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 1152,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 115,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 1120,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 116,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1104,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 117,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1072,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 118,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 1072,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 119,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 1040,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 120,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 1024,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 121,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 992,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 122,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 976,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 123,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 976,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 124,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 960,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 125,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 944,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 126,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 928,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 127,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 912,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 128,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 896,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 129,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 880,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 130,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 864,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 131,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 848,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 132,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 832,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 133,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 816,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 134,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 800,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 135,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 784,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 136,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 768,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 137,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 752,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 138,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 736,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 145,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 672,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 146,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 0,
          width = 1,
          height = 3168,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 147,
          name = "",
          type = "",
          shape = "rectangle",
          x = -1,
          y = 0,
          width = 1,
          height = 3168,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 148,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 592,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 152,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 512,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 156,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 160,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 169,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 96,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 170,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 171,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 172,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 128,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 173,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 112,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 174,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 80,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        }
      }
    }
  }
}
