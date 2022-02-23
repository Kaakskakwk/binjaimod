local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
local defaultNotePos = {}
local spin = 10 -- how much it moves before going the other direction
local defaultNotePos = {};
local nnn = true;
local arrowMoveX = 0;
local arrowMoveY = 14;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end
function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 60)
    if nnn == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
end

function onCreate()
    math.randomseed(os.clock() * 1000);
    
    --doTweenAlpha("gone","camHUD",0,0.01)
end
function onBeatHit()
    if curBeat == 2 then 
        y = defaultOpponentStrumY1;
        noteTweenAlpha("vanish0",0,0.5,crochet*0.004,"sineInOut")
        noteTweenAlpha("vanish1",1,0.5,crochet*0.0045,"sineInOut")
        noteTweenAlpha("vanish2",2,0.5,crochet*0.005,"sineInOut")
        noteTweenAlpha("vanish3",3,0.5,crochet*0.0055,"sineInOut")
    end
    if curBeat == 103 then
    turn = turn * 4
    end
    if curBeat % 2 == 0 and canBob then 
        turn2 = turn2 * -1
        for i = 0,7 do
            local uhhh = curBeat % 8 * (i + i)
            local swag = i % 4 * 2.5 - uhhh
            if i > 3 then
                x =  getPropertyFromGroup('opponentStrums', i-4, 'x');
            else
                x =  getPropertyFromGroup('playerStrums', i, 'x');
            end
            -- noteTweenY("wheeeup"..i,i,y + turn,crochet*0.002,"sineInOut")
            noteTweenX("wheeeleft"..i,i,x + turn2,crochet*0.002,"sineInOut")
        end
    end
end 

 function opponentNoteHit()
    health = getProperty('health')
 if getProperty('health') > 0.1 then
    setProperty('health', health- 0.1);
    end
end

 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 400 --How long it will take.
    
    if curStep >= 3 and curStep < 5000 then
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
    if curStep == 5000 then
        setProperty("camHUD.angle", 0)
    end
end

function onStepHit()
    if curStep == 4 then
        noteTweenAngle("NoteAngle1", 4, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle2", 5, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle3", 6, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle4", 7, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle9", 0, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle8", 1, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle7", 2, 90000, 160.4, cubeInOut)
        noteTweenAngle("NoteAngle6", 3, 90000, 160.4, cubeInOut)
    end
end

function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('potassiumending');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end