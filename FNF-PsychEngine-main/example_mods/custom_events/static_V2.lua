function onCreate()
    makeLuaSprite('Static', 'TrickyStatic', -580, -90);
    scaleLuaSprite('Static', 10, 10);
    addLuaSprite('Static', true)
    setPropertyLuaSprite('Static', 'alpha', 0)
end

function onEvent()
    runTimer('static', 0, 1)
    runTimer('TrickyAlpha', 0.1, 1)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    runTimer('TrickyAlpha', 0.05, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'TrickyAlpha' then
        setPropertyLuaSprite('Static', 'alpha', 0)
    end

    if tag == 'static' then
        playSound('staticSound')
        setPropertyLuaSprite('Static', 'alpha', 0.2)
    end

    if tag == 'startCount' then
        --removeLuaSprite('Black')
        --setProperty('dad.alpha', 1)
        startCountdown()
    end

end