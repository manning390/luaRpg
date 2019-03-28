LoadLibrary("Renderer")
LoadLibrary("Sprite")
LoadLibrary("System")
LoadLibrary("Texture")
LoadLibrary("Asset")

Asset.Run("Map.lua")
Asset.Run("larger_map.lua")

function GenerateUVs(tileWidth, tileHeight, texture)
    local uvs = {}

    local textureWidth = texture:GetWidth()
    local textureHeight = texture:GetHeight()
    local width = tileWidth / textureWidth
    local height = tileHeight / textureHeight
    local cols = textureWidth / tileWidth
    local rows = textureHeight / tileHeight

    local ux = 0
    local uy = 0
    local vx = width
    local vy = height

    for j = 0, rows - 1 do
        for i = 0, cols - 1 do
            table.insert(uvs, {ux, uy, vx, vy})
            ux = ux + width
            vx = vx + width
        end
        ux = 0
        vx = width
        uy = uy + height
        vy = vy + height
    end
    return uvs
end

local gMap = Map:Create(CreateMap1())
gRenderer = Renderer:Create()

function update()
    gMap:Render(gRenderer)
end
