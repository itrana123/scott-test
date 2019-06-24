<?php

define('HOST', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', '');
define('DATABASE', 'scott-test');

$con 	= new mysqli(HOST, USERNAME, PASSWORD, DATABASE);

if ($con->connect_error) {
	die("ERROR: Unable to connect: " . $con->connect_error);
}