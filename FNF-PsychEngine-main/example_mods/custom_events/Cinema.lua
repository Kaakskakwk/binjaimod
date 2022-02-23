local posS = {-100, 720}
local posV = {0, 620}
local on = false
function onCreate()
	for i=1,2 do
		makeLuaSprite('bar'..i, nil, 0, posS[i])
		makeGraphic('bar'..i, screenWidth, 100, '000000')
		setObjectCamera('bar'..i, 'other')
		addLuaSprite('bar'..i)
	end
end

function onUpdate(elapsed)
	if on then
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posV[i], elapsed))
		end
		setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.72, elapsed))
		setProperty('camGame.zoom', lerp(getProperty('camGame.zoom'), getProperty('defaultCamZoom') - 0.1, elapsed))
		setProperty('camZooming', false)
	else
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posS[i], elapsed))
		end
	end
end

function onChange()
	if on then on = false else on = true end
end

--taken from https://github.com/HaxeFlixel/flixel/blob/master/flixel/math/FlxMath.hx#L103
function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function onEvent(n)
	if n == 'Cinema' then onChange() end
end