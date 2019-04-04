LoadLibrary("Renderer")
LoadLibrary("Sprite")
LoadLibrary("System")
LoadLibrary("Texture")
LoadLibrary("Asset")
LoadLibrary("Keyboard")
LoadLibrary("Vector")

Asset.Run("Util.lua")
Asset.Run("Tween.lua")
Asset.Run("Panel.lua")
Asset.Run("Textbox.lua")
Asset.Run("Selection.lua")
Asset.Run("ProgressBar.lua")
Asset.Run("Scrollbar.lua")

function CreateFixed(renderer, x, y, width, height, text, params)
    params = params or {}
    local avatar = params.avatar
    local title = params.title
    local choices = params.choices

    local padding = 10
    local textScale = 1.5
    local panelTileSize = 3

    local wrap = width - padding
    local boundsTop = padding
    local boundsLeft = padding
    local boundsBottom = padding

    local children = {}

    if avatar then
        boundsLeft = avatar:GetWidth() + padding * 2
        wrap = width - (boundsLeft) - padding
        local sprite = Sprite.Create()
        sprite:SetTexture(avatar)
        table.insert(children,
        {
            type = "sprite",
            sprite = sprite,
            x = avatar:GetWidth() / 2 + padding,
            y = -avatar:GetHeight() / 2

        })
    end

    local selectionMenu = nil
    if choices then
        -- options and callback
        selectionMenu = Selection:Create
        {
            data = choices.options,
            OnSelect = choices.OnSelection,
        }
        boundsBottom = boundsBottom - padding * 0.5
    end

    if title then
        -- Adjust the top
        local size = renderer:MeasureText(title, wrap)
        boundsTop = size:Y() + padding * 2

        table.insert(children,
        {
            type = "text",
            text = title,
            x = 0,
            y = size:Y() + padding * 0.5
        })
    end

    renderer:ScaleText(textScale)
    --
    -- Section text into box-sized chunks.
    --
    local faceHeight = math.ceil(renderer:MeasureText(text):Y())
    local start, finish = gRenderer:NextLine(text, 1, wrap)

    local boundsHeight = height - (boundsTop + boundsBottom)
    local currentHeight = faceHeight

    local chunks = {{string.sub(text, start, finish)}}
    while finish < #text do
        start, finish = gRenderer:NextLine(text, finish, wrap)

        -- If we're going to overflow
        if (currentHeight + faceHeight) > boundsHeight then
            -- make a new entry
            currentHeight = 0
            table.insert(chunks, {string.sub(text, start, finish)})
        else
            table.insert(chunks[#chunks], string.sub(text, start, finish))
        end
        currentHeight = currentHeight + faceHeight
    end

    for k, v in ipairs(chunks) do
        chunks[k] = table.concat(v)
    end

    return Textbox:Create
    {
        text = chunks,
        textScale = textScale,
        size =
        {
            left    = x - width / 2,
            right   = x + width / 2,
            top     = y + height / 2,
            bottom  = y - height / 2
        },
        textbounds =
        {
            left = boundsLeft,
            right = -padding,
            top = -boundsTop,
            bottom = padding
        },
        panelArgs =
        {
            texture = Texture.Find("gradient_panel.png"),
            size = panelTileSize
        },
        children = children,
        wrap = wrap,
        selectionMenu = selectionMenu
    }
end

function CreateFitted(renderer, x, y, text, wrap, params)
    local params = params or {}
    local choices = params.choices
    local title = params.title
    local avatar = params.avatar

    local padding = 10
    local panelTileSize = 3
    local textScale = 1.5

    renderer:ScaleText(textScale, textScale)

    local size = renderer:MeasureText(text, wrap)
    local width = size:X() + padding * 2
    local height = size:Y() + padding * 2

    if choices then
        -- options and callback
        local selectionMenu = Selection:Create
        {
            data = choices.options,
            displayrows = #choices.options,
            columns = 1,
        }
        height = height + selectionMenu:GetHeight() + padding * 4
        width = math.max(width, selectionMenu:GetWidth() + padding * 2)
    end

    if title then
        local size = renderer:MeasureText(title, wrap)
        height = height + size:Y() + padding
        width = math.max(width, size:X() + padding * 2)
    end

    if avatar then
        local avatarWidth = avatar:GetWidth()
        local avatarHeight = avatar:GetHeight()
        width = width + avatarWidth + padding
        height = math.max(height, avatarHeight + padding)
    end

    return CreateFixed(renderer, x, y, width, height, text, params)
end


gRenderer = Renderer.Create()

local bar1 = Scrollbar:Create(Texture.Find("scrollbar.png"), 100)
local bar2 = Scrollbar:Create(Texture.Find("scrollbar.png"), 200)
local bar3 = Scrollbar:Create(Texture.Find("scrollbar.png"), 75)

bar1:SetScrollCaretScale(0.5)
bar1:SetNormalValue(0.5)
bar1:SetPosition(-50, 10)

bar2:SetScrollCaretScale(0.3)
bar2:SetNormalValue(0)
bar2:SetPosition(0, 0)

bar3:SetScrollCaretScale(0.1)
bar3:SetNormalValue(1)
bar3:SetPosition(50, -10)

function update()
    bar1:Render(gRenderer)
    bar2:Render(gRenderer)
    bar3:Render(gRenderer)
end