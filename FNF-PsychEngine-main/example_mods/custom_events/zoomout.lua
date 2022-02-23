function onEvent(name)
	if name == "zoomout" then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
		doTweenZoom('c', 'camGame', getProperty('defaultCamZoom') - 0.01, 0.05, 'linear')
	end
end
