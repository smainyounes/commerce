<?php 

	/**
	 * 
	 */
	class controller_home
	{

		function __construct()
		{

		}

		public function Index()
		{

			// include header
			new view_navbar;

			// calling the content
			$view = new view_home();
			$view->Welcome();

			// include footer
			include BACKEND_URL."includes/footer.inc.php";
		}
	}

 ?>