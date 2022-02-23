-- Idea by dk. 
-- Original code by Keoki
-- Made by Kevin Kuntz
local rando = math.random(0, 3)
function onCreate()
rando = math.random(0, 3)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Switcher' and not isSustainNote then
	rando = math.random(0, 3)
	end
end

function onUpdatePost(elapsed)
	for a = 0, getProperty('notes.length') - 1 do
		strumTime = getPropertyFromGroup('notes', a, 'strumTime');
		noteData = getPropertyFromGroup('notes', a, 'noteData');
		if getPropertyFromGroup('notes', a, 'noteType') == 'Switcher' then
			if (strumTime - getSongPosition()) < 250 then
				setPropertyFromGroup('notes', a, 'noteData', rando);
			
				if noteData == 0 then
				
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'angle', 180);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' then
					setPropertyFromGroup('notes', a, 'angle', 90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' then
					setPropertyFromGroup('notes', a, 'angle', -90);
					
					end
				elseif noteData == 3 then
					
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'angle', -180);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' then
					setPropertyFromGroup('notes', a, 'angle', -90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' then
					setPropertyFromGroup('notes', a, 'angle', 90);
					
					end
				elseif noteData == 1 then
				
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'angle', 90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'angle', -90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' and noteData ~= 1 then
					setPropertyFromGroup('notes', a, 'angle', -180);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' and noteData ~= 2 then
					setPropertyFromGroup('notes', a, 'angle', 180);
					end
				elseif noteData == 2 then
				
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'angle', -90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'angle', 90);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' and noteData ~= 1 then
					setPropertyFromGroup('notes', a, 'angle', 180);
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' and noteData ~= 2 then
					setPropertyFromGroup('notes', a, 'angle', -180);
					end
				end
			end
		end
	end
end