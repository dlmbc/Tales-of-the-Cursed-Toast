function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

function GenerateQuadsKey(atlas, tilewidth, tileheight)
    local x = 0
    local y = 0

    love.graphics.newQuad(x, y, 16, 16, atlas:getDimensions())
end

function GenerateQuadsLock(atlas)
    local x = 0
    local y = 16

    love.graphics.newQuad(x, y, 16, 16, atlas:getDimensions())
end