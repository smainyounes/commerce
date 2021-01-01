<?php 

	/**
	 * 
	 */
	class controller_ajax
	{
		
		function __construct()
		{
			# code...
		}

		public function Index()
		{
			header("Location: ".PUBLIC_URL."error");
		}

		public function Test($paramter)
		{
			echo "Parameter :".$paramter;
		}

	}


 ?>