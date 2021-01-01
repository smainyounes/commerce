<?php 

	/**
	 * 
	 */
	class view_navbar
	{
		
		private $text;
		function __construct()
		{
			$this->text = $this->Text();
			$this->Head();
		}

		private function Text()
		{
			switch ($_SESSION['lang']) {
				case 'fr':
					return array('home' => "Accueil",
					 "categories" => "Catégories",
					 "contact" => "Contact",
					 "login" => "Identifier",
					 "all" => "Tout",
					 "lang" => "Langue",
					 "search" => "Chercher");
					break;
				
				case 'ar':
					return array('home' => "الصفحة الرئيسية",
					 "categories" => "اصناف",
					 "contact" => "اتصل",
					 "login" => "دخول",
					 "all" => "الكل",
					 "lang" => "لغة",
					 "search" => "بحث");
					break;

			}
		}

		private function Head()
		{
			?>

			<!doctype html>
			<html lang="<?php echo($_SESSION['lang']) ?>">
			  <head>
			    <!-- Required meta tags -->
			    <meta charset="utf-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			    <!-- logo icon -->
			    <link rel="icon" type="image/png" href="<?php echo(PUBLIC_URL.'img/logo.png') ?>" />

			    <!-- Bootstrap CSS -->
			    <link rel="stylesheet" href="<?php echo(PUBLIC_URL) ?>vendor/bootstrap/css/bootstrap.min.css">

			    <!-- animate css -->
			    <link rel="stylesheet" type="text/css" href="<?php echo(PUBLIC_URL) ?>vendor/animatecss/animate.css">

			    <!-- custom css -->
			    <link rel="stylesheet" href="<?php echo(PUBLIC_URL) ?>css/custom.css">
			    

			    <!-- Optional JavaScript -->
			    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
			    <script src="<?php echo(PUBLIC_URL) ?>vendor/jquery/jquery.min.js"></script>
			    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
			    <script src="<?php echo(PUBLIC_URL) ?>vendor/bootstrap/js/bootstrap.min.js"></script>

			    <title>Framework</title>
			  </head>
			  <body>
			  	
			<?php
		}

	}

 ?>