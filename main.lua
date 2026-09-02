-- HAWZHIR HUB
-- سکریپتی یاریە بە کوردی

function love.load()
    -- ویندۆکە
    love.window.setTitle("HAWZHIR HUB")
    love.window.setMode(600, 500)
    
    -- رەنگەکان
    رەنگی_سپی = {1, 1, 1}
    رەنگی_ڕەش = {0, 0, 0}
    رەنگی_شین = {0, 0.5, 1}
    رەنگی_سور = {1, 0, 0}
    رەنگی_زه‌رد = {1, 1, 0}
    
    -- فۆنت
    فۆنت = love.graphics.newFont(16)
    فۆنت_بچوک = love.graphics.newFont(12)
    
    -- دوگمەکان - چوار گۆشە
    دوگمەکان = {
        {ناو = "هیلکی یەکەم", x = 50, y = 50, width = 120, height = 80, دۆشالی = false},
        {ناو = "هیلکی دووەم", x = 430, y = 50, width = 120, height = 80, دۆشالی = false},
        {ناو = "هیلکی سێیەم", x = 50, y = 370, width = 120, height = 80, دۆشالی = false},
        {ناو = "هیلکی چوارەم", x = 430, y = 370, width = 120, height = 80, دۆشالی = false}
    }
    
    -- دوگمەی کارکردن
    دوگمەی_Go = {x = 250, y = 200, width = 100, height = 50, دەستی = false, ناو = "Go"}
    دوگمەی_Stop = {x = 250, y = 270, width = 100, height = 50, دەستی = false, ناو = "Stop"}
    دوگمەی_Close = {x = 550, y = 10, width = 40, height = 40, ناو = "×"}
    
    -- دۆخی یاریە
    کارەکتەر_ڕان = false
    هیلکەی_هۆڵا = nil
end

function love.update(dt)
    -- لۆجیکی یاریە
end

function love.draw()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
    
    -- سەرناوە
    love.graphics.setColor(رەنگی_شین)
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.print("HAWZHIR HUB", 200, 15)
    
    -- دوگمەی Close
    دوگمە_چووڵێنە(دوگمەی_Close, رەنگی_سور)
    love.graphics.setColor(رەنگی_سپی)
    love.graphics.setFont(فۆنت)
    love.graphics.print("×", دوگمەی_Close.x + 8, دوگمەی_Close.y + 5)
    
    -- دوگمەی چوار گۆشە (هیلکەکان)
    for i, دوگمە in ipairs(دوگمەکان) do
        if هیلکەی_هۆڵا == i then
            love.graphics.setColor(رەنگی_زه‌رد)
        else
            love.graphics.setColor(رەنگی_شین)
        end
        
        love.graphics.rectangle("fill", دوگمە.x, دوگمە.y, دوگمە.width, دوگمە.height)
        
        love.graphics.setColor(رەنگی_ڕەش)
        love.graphics.rectangle("line", دوگمە.x, دوگمە.y, دوگمە.width, دوگمە.height)
        
        love.graphics.setColor(رەنگی_سپی)
        love.graphics.setFont(فۆنت_بچوک)
        love.graphics.print(دوگمە.ناو, دوگمە.x + 10, دوگمە.y + 30)
    end
    
    -- دوگمەی Go
    if کارەکتەر_ڕان then
        love.graphics.setColor(رەنگی_زه‌رد)
    else
        love.graphics.setColor(رەنگی_سپی)
    end
    love.graphics.rectangle("fill", دوگمەی_Go.x, دوگمەی_Go.y, دوگمەی_Go.width, دوگمەی_Go.height)
    love.graphics.setColor(رەنگی_ڕەش)
    love.graphics.rectangle("line", دوگمەی_Go.x, دوگمەی_Go.y, دوگمەی_Go.width, دوگمەی_Go.height)
    love.graphics.setColor(رەنگی_ڕەش)
    love.graphics.setFont(فۆنت)
    love.graphics.print(دوگمەی_Go.ناو, دوگمەی_Go.x + 20, دوگمەی_Go.y + 10)
    
    -- دوگمەی Stop
    love.graphics.setColor(رەنگی_سور)
    love.graphics.rectangle("fill", دوگمەی_Stop.x, دوگمەی_Stop.y, دوگمەی_Stop.width, دوگمەی_Stop.height)
    love.graphics.setColor(رەنگی_ڕەش)
    love.graphics.rectangle("line", دوگمەی_Stop.x, دوگمەی_Stop.y, دوگمەی_Stop.width, دوگمەی_Stop.height)
    love.graphics.setColor(رەنگی_سپی)
    love.graphics.setFont(فۆنت)
    love.graphics.print(دوگمەی_Stop.ناو, دوگمەی_Stop.x + 15, دوگمەی_Stop.y + 10)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- دوگمەی Close
        if x >= دوگمەی_Close.x and x <= دوگمەی_Close.x + دوگمەی_Close.width and
           y >= دوگمەی_Close.y and y <= دوگمەی_Close.y + دوگمەی_Close.height then
            love.event.quit()
        end
        
        -- دوگمەی Go
        if x >= دوگمەی_Go.x and x <= دوگمەی_Go.x + دوگمەی_Go.width and
           y >= دوگمەی_Go.y and y <= دوگمەی_Go.y + دوگمەی_Go.height then
            کارەکتەر_ڕان = true
            print("🚀 کارەکتەرەکە ڕاق بووەوە!")
        end
        
        -- دوگمەی Stop
        if x >= دوگمەی_Stop.x and x <= دوگمەی_Stop.x + دوگمەی_Stop.width and
           y >= دوگمەی_Stop.y and y <= دوگمەی_Stop.y + دوگمەی_Stop.height then
            کارەکتەر_ڕان = false
            هیلکەی_هۆڵا = nil
            print("🛑 کارەکتەرەکە وەستا!")
        end
        
        -- دوگمەی هیلکەکان
        for i, دوگمە in ipairs(دوگمەکان) do
            if x >= دوگمە.x and x <= دوگمە.x + دوگمە.width and
               y >= دوگمە.y and y <= دوگمە.y + دوگمە.height then
                هیلکەی_هۆڵا = i
                print("✅ " .. دوگمە.ناو .. " هیلا کرا!")
            end
        end
    end
end

function دوگمە_چووڵێنە(دوگمە, رەنگ)
    love.graphics.setColor(رەنگ)
    love.graphics.rectangle("fill", دوگمە.x, دوگمە.y, دوگمە.width, دوگمە.height)
end
