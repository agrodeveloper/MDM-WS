<?php
include 'config.php';

$link = mysql_connect('localhost', 'root', '');
if (!$link) {
    die('Not connected : ' . mysql_error());
}

// make seedbase the current db
$db_selected = mysql_select_db('seedbase', $link);
if (!$db_selected) {
    die ('Can\'t use foo : ' . mysql_error());
}

