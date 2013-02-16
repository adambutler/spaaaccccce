$ ->

  getURL = (s) ->
    s = "http://" + s  if s.substr(0, 7) isnt "http://" and s.substr(0, 8) isnt "https://"
    return s

  validateURL = (s) ->
    
    urlregex = new RegExp("^(http|https|ftp)://([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&amp;%$-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]).(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0).(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0).(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9-]+.)*[a-zA-Z0-9-]+.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(:[0-9]+)*(/($|[a-zA-Z0-9.,?'\\+&amp;%$#=~_-]+))*$")
    urlregex.test s

  sendRequest = (url) ->
    console.log 'sending request'
    $.ajax
        data:
          longurl: url
        url: "lengthen.php"
        complete: (XMLHttpRequest, textStatus) ->
          console.log XMLHttpRequest.responseText
          $(".result").html XMLHttpRequest.responseText


  $('form').submit (e) ->
    e.preventDefault()
    url = getURL($("#longurl").val())

    if validateURL(url)
      sendRequest(url)
    else
      alert 'Error: Invalid URL'