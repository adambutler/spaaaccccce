$ ->
  audio = document.getElementById("audio")
  core = document.getElementById("core")

  onKeyup = (e) ->
    e.preventDefault()
    if e.keyCode == 32 || e.touches?
      audio.pause()
      audio.currentTime = 0
      document.removeEventListener "keyup", onKeyup
      core.removeEventListener "touchend", onKeyup
      document.addEventListener "keydown", onKeydown
      core.addEventListener "touchstart", onKeydown

  onKeydown = (e) ->
    e.preventDefault()
    if e.keyCode == 32 || e.touches?
      audio.play()
      document.removeEventListener "keydown", onKeydown
      core.removeEventListener "touchstart", onKeydown
      document.addEventListener "keyup", onKeyup
      core.addEventListener "touchend", onKeyup

  document.addEventListener "keydown", onKeydown
  core.addEventListener "touchstart", onKeydown
