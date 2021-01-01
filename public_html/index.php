<?php 
	
	// include autoloader
	include '../backend/includes/autoloader.inc.php';

	// init lang
	new lib_lang();

	// checking language
	if ($_SERVER['REQUEST_METHOD'] === 'GET') {
		if (isset($_GET['lang'])) {
			new lib_lang($_GET['lang']);
		}
	}

	// init core class
	new lib_core;

 ?>