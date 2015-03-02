audio = document.getElementById("audio")

onKeyup = (e) ->
  if e.keyCode == 32
    audio.pause()
    audio.currentTime = 0
    document.removeEventListener "keyup", onKeyup
    document.addEventListener "keydown", onKeydown

onKeydown = (e) ->
  if e.keyCode == 32
    audio.play()
    document.removeEventListener "keydown", onKeydown
    document.addEventListener "keyup", onKeyup

document.addEventListener "keydown", onKeydown
