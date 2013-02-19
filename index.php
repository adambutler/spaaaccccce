<!DOCTYPE html>
<html>
  <head>
    <title>Personality Core 01 - URL Lengthener</title>
    <meta name="robots" content="noindex, nofollow">
    <style type="text/css">
      body {
        background-color: #000;
        background-image: url('img/space.jpg');
        background-position: center;
        color: #fff;
        text-align: center;
        font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
        text-transform: uppercase;
        padding-bottom: 50px;
      }

      h1 {
        font-weight: normal;
        background: #00BBF2;
        background: rgba(0, 187, 242, 0.8);
        padding: 5px 10px;
        display: inline-block;

      }

      h1.result {
        font-size: 20px;
        background: rgba(241, 146, 0, 0.8);
        text-transform: none;
        max-width: 80%;
        word-wrap: break-word;
      }

      p {
        position: fixed;
        bottom: 0;
        left: 50%;
        margin-left: -93px;
        padding: 3px 5px;
        background: rgba(255,255,255,0.2);
      }

      a {
        color: #0095C3;
        text-decoration: none;s
      }

      form {
        padding-top: 20px;
      }

      label {
        display: block;
        margin-bottom: 20px;
        background: #000;
      }

      img {
        transition: all 240s linear;
        -o-transition: all 240s linear;
        -ms-transition: all 240s linear;
        -moz-transition: all 240s linear;
        -webkit-transition: all 240s linear;
      }

      input {
        display: inline-block;
        clear: both;
        font-size: 20px;
        padding: 10px;
        background: rgba(255,255,255,0.8);
        border: 0;
        margin: 0;
      }

      input[type="text"] {
        width: 350px;
        color: #0080A6;
      }

      input[type=submit] {
        margin: 0;
        background: rgba(0, 187, 242, 0.8);
        color: #fff;
      }

    </style>
  </head>
  <body>
    <img src="img/space-core.png"/>
    <form method="post" action="lengthen.php" id="lengthener">
      <div><h1>Personality Core 01 - URL Lengthener</h1></div>
      <input type="text" name="longurl" id="longurl">
      <input type="submit" value="Lengthen">
    </form>
    <h1 class="result">Enter URL Above</h1>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js?v=1"></script>
    <p>Built by <a href="http://github.com/adambutler">Adam Butler</a></p>
    <audio>
     <source src="mp3/space.mp3" type='audio/mpeg; codecs="mp3"'>
    </audio>
  </body>
</html>
