<?php
/*
 * First authored by Brian Cray
 * License: http://creativecommons.org/licenses/by/3.0/
 * Contact the author at http://briancray.com/
 */

ini_set('display_errors', 0);

require('config.php');

$long_url = file_get_contents(CACHE_DIR . $shortened_id);

echo $long_url;

if(empty($long_url) || !preg_match('|^https?://|', $long_url))
{
	$long_url = mysql_result(mysql_query('SELECT long_url FROM ' . DB_TABLE . ' WHERE local_url="' . $_GET['url'] . '"'), 0, 0);
	@mkdir(CACHE_DIR, 0777);
	$handle = fopen(CACHE_DIR . $shortened_id, 'w+');
	fwrite($handle, $long_url);
	fclose($handle);
}

if(TRACK)
{
	mysql_query('UPDATE ' . DB_TABLE . ' SET referrals=referrals+1 WHERE id="' . mysql_real_escape_string($shortened_id) . '"');
}

echo "long url = ";
echo $long_url;
echo "";

header('HTTP/1.1 301 Moved Permanently');
header('Location: ' .  $long_url);
exit;