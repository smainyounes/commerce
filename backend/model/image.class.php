<?php 

	/**
	 * 
	 */
	class model_image extends lib_database
	{
		
		function __construct()
		{
			parent::__construct();
		}


		/*Getters*/

		public function GetImages($id_produit)
		{
			$this->query("SELECT * FROM img_produit WHERE id_produit = :id");
			$this->bind(":id", $id_produit);

			return $this->resultSet();
		}

		public function GetImgLink($id_img)
		{
			$this->query("SELECT link FROM img_produit WHERE id_img = :id");
			$this->bind(":id", $id_img);

			$res = $this->single();
			return $res->link;
		}

		public function CheckImg($id_produit, $id_img)
		{
			$this->query("SELECT id_img FROM img_produit WHERE id_img = :id_img AND id_produit = :id_produit");

			$this->bind(":id_img", $id_img);
			$this->bind(":id_produit", $id_produit);

			$res = $this->single();

			if ($res) {
				return true;
			}else{
				return false;
			}
		}


		// Setters 

		public function AddImg($id_produit, $img_name)
		{
			$this->query("INSERT INTO img_produit(id_produit, link) VALUES(:id, :link)");
			$this->bind(":id", $id_produit);
			$this->bind(":link", $img_name);

			try {
				$this->execute();
				return array('state' => 'success', 'data' => ['filename' => PUBLIC_URL.'img/'.$img_name, 'id_img' => $this->LastId()]);
				
			} catch (Exception $e) {
				return array('state' => 'error', 'data' => ['msg' => 'img was not inserted in the database']);
			}
		}


		public function DeleteImg($id_img)
		{
			$this->query("DELETE FROM img_produit WHERE id_img = :id");
			$this->bind(":id", $id_img);

			try {
				$this->execute();
				return true;
			} catch (Exception $e) {
				return false;
			}
		}


		public function DeleteAllImgProduit($id_produit)
		{
			$this->query("DELETE FROM img_produit WHERE id_produit = :id");
			$this->bind(":id", $id_produit);

			try {
				$this->execute();
				return true;
			} catch (Exception $e) {
				return false;
			}
		}

		public function SelectMain($id_produit, $id_img)
		{
			if (!$this->CheckImg($id_produit, $id_img)) {
				return false;
			}

			$this->ResetMain($id_produit);

			$this->query("UPDATE img_produit SET main = 1 WHERE id_img = :id");

			$this->bind(":id", $id_img);

			try {
				$this->execute();
				return true;
			} catch (Exception $e) {
				return false;
			}
		}



	}

 ?>