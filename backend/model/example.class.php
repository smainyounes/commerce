<?php 

	/**
	 * 
	 */
	class model_example extends lib_database
	{
		
		function __construct()
		{
			parent::__construct();
		}

		/**
		 * Getters
		 */

		public function GetAll()
		{
			/**
			 * $this->query("SELECT * FROM table");
			 * return $this->resultSet();
			 */
		}

		public function Detail($id)
		{
			/**
			 * $this->query("SELECT * FROM table WHERE id = :id");
			 * $this->bind(":id", $id);
			 * return $this->single();
			 */
		}

		/**
		 * Setters
		 */

		public function Add()
		{
			/**
			 * $this->query("INSERT INTO table(name) VALUES(:name)");
			 * $this->bind(":name", strip_tags($_POST['name']));
			 *
			 * try {
			 * 	$this->execute();
			 *	return true;
			 * } catch (Exception $e) {
			 * 	return false;
			 * }
			 */
			
		}
	}

 ?>