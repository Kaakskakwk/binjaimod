function onUpdatePost()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F1') then
		playSound('confirmMenu', 1);
		setPropertyFromClass('flixel.FlxG', 'save.data.enablehitsounds', true)
		debugPrint('Enabled Hitsounds.')
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F2') then
		playSound('confirmMenu', 1);
		setPropertyFromClass('flixel.FlxG', 'save.data.enablehitsounds', false)
		debugPrint('Unabled Hitsounds.')
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	
    if not isSustainNote and getPropertyFromClass('flixel.FlxG', 'save.data.enablehitsounds') == true then
        playSound('ChartingTick', 0.5)
    end
end