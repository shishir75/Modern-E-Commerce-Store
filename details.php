<?php require_once 'includes/header.php'; ?>

<?php
	if (isset($_POST['add_to_wishlist'])) {
		if (!isset($_SESSION['customer_email'])) {
			header('Location: checkout.php');
		}else {
			$customer_email = $_SESSION['customer_email'];

			$get_customer = $getFromU->view_customer_by_email($customer_email);

			$customer_id = $get_customer->customer_id;

			$product_id = $getFromU->checkInput($_GET['product_id']);

			$check_wishlist = $getFromU->check_wishlist_by_customer_id_and_product_id($customer_id, $product_id);

			if ($check_wishlist === true) {
				$error = "This Product is already in Wishlist";
			}else{
				$insert_wishlist = $getFromU->create('wishlist', array('customer_id' => $customer_id , 'product_id' => $product_id));
				if ($insert_wishlist) {
					$insert_wishlist_msg = "Product inserted successfully to wishlist";
				}
			}
		}
	}
?>

<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" id="navbar">
	<a class="navbar-brand home" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto text-uppercase">
			<li >
				<a href="index.php">Home</a>
			</li>
			<li>
				<a class="active" href="shop.php">Shop</a>
			</li>
			<?php if (!isset($_SESSION['customer_email'])): ?>
				<li><a href="checkout.php">My Account</a></li>
			<?php else: ?>
				<li><a href="customer/my_account.php?my_orders">My Account</a></li>
			<?php endif ?>
			<li>
				<a href="cart.php">Shopping Cart</a>
			</li>
			<li>
				<a href="contact.php">Contact Us</a>
			</li>
			<li>
        <a href="about.php">About Us</a>
      </li>
      <li>
        <a href="services.php">Services</a>
      </li>
		</ul>

			<a href="cart.php" class="btn btn-success mr-2"><i class="fas fa-shopping-cart"></i><span> <?php echo $getFromU->count_product_by_ip($ip_add); ?> items in Cart</span></a>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="user_query" required="1">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="search">Search</button>
		</form>
	</div>
</nav>


<div id="content">
	<div class="container">
		<div class="row">

		<?php
			if (isset($_GET['product_id'])) {
				$the_product_id = $_GET['product_id'];

				$get_products = $getFromU->viewProductByProductID($the_product_id);
				//var_dump($get_products);

				foreach ($get_products as $get_product) {
					$p_cat_id          = $get_product->p_cat_id;
					$product_title     = $get_product->product_title;
					$product_price     = $get_product->product_price;
					$product_desc      = $get_product->product_desc;
					$product_img1      = $get_product->product_img1;
					$product_img2 		 = $get_product->product_img2;
					$product_img3      = $get_product->product_img3;
					$product_label     = $get_product->product_label;
					$manufacturer_id   = $get_product->manufacturer_id;
					$product_psp_price = $get_product->product_psp_price;
					$product_features  = $get_product->product_features;
					$product_video     = $get_product->product_video;
					$status            = $get_product->status;

					$view_manufacturer = $getFromU->selectManufacturerByManufacturerID($manufacturer_id);
					$manufacturer_title= $view_manufacturer->manufacturer_title;

					if ($status == "product") {
						$title = "Product";
					}elseif ($status == "bundle") {
						$title = "Bundle";
					}

					if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle") {
						$product_price = "<del>$$product_price</del>";
						$product_psp_price = "$$product_psp_price";
					}else{
						$product_price = "$$product_price";
						$product_psp_price = "";
					}

					$get_p_cats = $getFromU->viewAllByCatID($p_cat_id);
					foreach ($get_p_cats as $get_p_cat) {
						$p_cat_title = $get_p_cat->p_cat_title;
						$p_cat_id = $get_p_cat->p_cat_id;

		?>




			<div class="col-md-12">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
				    <li class="breadcrumb-item"><a href="shop.php">Shop</a></li>
				    <li class="breadcrumb-item" aria-current="page"><?php echo $product_title; ?></li>
				  </ol>
				</nav>
			</div>


			<?php if (isset($error)): ?>
				<div class="col-md-12">
					<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
					  <?php echo $error; ?>
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				</div>
			<?php endif ?>

			<?php if (isset($insert_wishlist_msg)): ?>
				<div class="col-md-12">
					<div class="alert alert-success text-center alert-dismissible fade show" role="alert">
					  <?php echo $insert_wishlist_msg; ?>
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				</div>
			<?php endif ?>


			<div class="col-md-12">
				<div class="row" id="productMain">
					<div class="col-sm-6">
						<div id="mainImage">
							<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							  <ol class="carousel-indicators">
							    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							  </ol>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img class="d-block w-100 img-fluid" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="First slide">
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100 img-fluid" src="admin_area/product_images/<?php echo $product_img2; ?>" alt="Second slide">
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100 img-fluid" src="admin_area/product_images/<?php echo $product_img3; ?>" alt="Third slide">
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						<?php if (!empty($product_label)): ?>
							<a class="label sale" style="color: black">
								<div class="thelabel"><?php echo $product_label; ?></div>
								<div class="label-background"></div>
							</a>
						<?php endif ?>
					</div>

					<div class="col-sm-6">
						<div class="card text-center mb-3">
						  <div class="card-body">
						    <h4 class="card-title mb-4"><?php echo $product_title; ?></h4>
						    <?php

						    	if (isset($_POST['add_to_cart'])) {
						    		$p_id = $_POST['product_id'];
						    		$ip_add = $getFromU->getRealUserIp();
						    		$product_qty = $_POST['product_qty'];
						    		$product_size = $_POST['product_size'];

						    		$get_product = $getFromU->view_Product_By_Product_ID($p_id);
						    		$product_price = $get_product->product_price;
						    		$product_psp_price = $get_product->product_psp_price;
						    		$product_label = $get_product->product_label;

						    		$check_product_by_ip_id = $getFromU->check_product_by_ip_id($ip_add, $p_id);

						    		if ($check_product_by_ip_id === true) {
						    			echo '<script>alert("This product is already added in cart")</script>';
						    		}else{

						    			if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle") {
						    				$product_price = $product_psp_price;
						    			}else {
						    				$product_price = $product_price;
						    			}

						    			$insert_cart = $getFromU->create("cart", array("p_id" => $p_id, "ip_add" => $ip_add, "qty" =>$product_qty, "product_price" =>$product_price, "size" =>$product_size));
						    			echo '<script>alert("This product added successfully in cart")</script>';
						    			header('Location: shop.php');

						    		}

						    	}


						    ?>
								<form method="post">
									<div class="form-group row">
								    <label for="product_qty" class="col-sm-5 col-form-label-sm text-xl-right"><?php echo $title; ?> Quantity</label>
								    <div class="col-sm-7">
								      <select name="product_qty" id="product_qty" class="form-control">
								      	<option value="1">1</option>
								      	<option value="2">2</option>
								      	<option value="3">3</option>
								      	<option value="4">4</option>
								      	<option value="5">5</option>
								      	<option value="6">6</option>
								      </select>
								    </div>
								  </div>

								  <div class="form-group row">
								    <label for="product_size" class="col-sm-5 col-form-label-sm text-xl-right"><?php echo $title; ?> Size</label>
								    <div class="col-sm-7">
								      <select name="product_size" id="product_size" class="form-control" required>
								      	<option value="">--- Select a Size ---</option>
								      	<option value="small">Small</option>
								      	<option value="medium">Medium</option>
								      	<option value="large">Large</option>
								      	<option value="extra large">Extra Large</option>
								      </select>
								    </div>
								  </div>

								  <div class="form-group row mb-0">
								    <div class="col-sm-7">
								      <input type="hidden" name="product_id" value="<?php echo $the_product_id; ?>">
								    </div>
								  </div>

								  <center class='mb-3'>
								  	<?php
								  		$view_icons = $getFromU->viewIconsByProductID($the_product_id);
								  		foreach ($view_icons as $view_icon) {
								  			$icon_image =$view_icon->icon_image;
								  	?>
								  	<img src="admin_area/icon_images/<?php echo $icon_image; ?>" width="45" height="45">
								  	<?php } ?>

								  </center>

								  <p class="btn btn-sm btn-info mb-0">Manufacturer : <?php echo $manufacturer_title; ?></p>

								  <h6 class="card-text mt-4">Price : <?php echo $product_price; ?></h6>
								  <?php if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle"): ?>
								  	<h6 class="card-text ">Discount Price : <?php echo $product_psp_price; ?></h6>
								  <?php endif ?>

								  <button type="submit" name="add_to_cart" class="card-link btn btn-outline-info mt-3 px-4"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
								  <button type="submit" name="add_to_wishlist" class="card-link btn btn-outline-danger mt-3 px-4"><i class="fas fa-heart"></i> Add to Wishlist</button>

								</form>


						  </div>
						</div>


						<div class="row" id="thumbs">
							<div class="col-4">
								<a href="#" class="thumb"><img class="img-fluid img-thumbnail" src="admin_area/product_images/<?php echo $product_img1; ?>"></a>
							</div>
							<div class="col-4">
								<a href="#" class="thumb"><img class="img-fluid img-thumbnail" src="admin_area/product_images/<?php echo $product_img2; ?>"></a>
							</div>
							<div class="col-4">
								<a href="#" class="thumb"><img class="img-fluid img-thumbnail" src="admin_area/product_images/<?php echo $product_img3; ?>"></a>
							</div>
						</div>

					</div>

				</div>

				<div class="row my-4">
					<div class="col-12">
						<div class="card">
						  <div class="card-body">

								<ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
								  <li class="nav-item">
								    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><?php echo $title; ?> Description</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><?php echo $title; ?> Fearures</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false"><?php echo $title; ?> Video</a>
								  </li>
								</ul>
								<div class="tab-content" id="myTabContent">
								  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
										<h5 class="card-title"><?php echo $title; ?> Details</h5>
								    <p class="card-text"><?php echo $product_desc; ?></p>
								    <h5 class="card-title">Size &amp Fit</h5>
								    <ul>
								    	<li>Small</li>
								    	<li>Medium</li>
								    	<li>Large</li>
								    	<li>Extra Large</li>
								    </ul>
								  </div>
								  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
								  	<h5 class="card-title"><?php echo $title; ?> Fearures</h5>
								    <p class="card-text"><?php echo $product_features; ?></p>
								  </div>
								  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
								  	<h5 class="card-title"><?php echo $title; ?> Video</h5>
								    <p class="card-text text-center"><?php echo $product_video; ?></p>
								  </div>
								</div>



						  </div>
						</div>
				 	</div>
			  </div>


			</div> <!-- col-md-9 END --3 -->
		<?php } } } ?>
		</div> <!-- Row end -->

		<?php if ($status == "product"): ?>

			<div class="row suggestion_heading">
				<div class="col-md-12 ">
					<div class="text-center">
						<h2 class="">You may also Like this</h2>
					</div>
				</div>
			</div>

		  <div class="row">
		  	<?php
		  		//var_dump($p_cat_id);
		  		$view_products = $getFromU->viewProductByProductID($the_product_id);
		  		//var_dump($products);
		  		foreach ($view_products as $view_product) {
		  			$p_cat_id = $view_product->p_cat_id;
		  			//var_dump($p_cat_id);
		  			$products = $getFromU->viewProductByCatID($p_cat_id);
		  			foreach ($products as $product) {
			  			$product_id = $product->product_id;
			  			$product_title = $product->product_title;
			  			$product_price = $product->product_price;
			  			$product_img1 = $product->product_img1;
			  			$product_label   = $product->product_label;
							$manufacturer_id = $product->manufacturer_id;
							$product_psp_price = $product->product_psp_price;

							$view_manufacturer = $getFromU->selectManufacturerByManufacturerID($manufacturer_id);
							$manufacturer_title = $view_manufacturer->manufacturer_title;

							if ($product_label == "Sale" || $product_label == "Gift") {
								$product_price = "<del>$$product_price</del>";
								$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
							}else{
								$product_price = "$$product_price";
								$product_psp_price = "";
							}

			  			if ($product_id == $the_product_id) {
			  				continue;
			  			}
		  	?>

		  	<div class="col-sm-6 col-md-3 justify-content-center single">
					<div class="product mb-4">
						<div class="card">
						  <a href="details.php?product_id=<?php echo $product_id; ?>"><img class="card-img-top img-fluid p-3" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="Card image cap"></a>
						  <div class="card-body text-center">
						  	<p class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $manufacturer_title; ?></p><hr>
						    <h6 class="card-title"><a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a></h6>
						    <p class="card-text"><?php echo $product_price; ?> <?php echo $product_psp_price; ?></p>
						    <div class="row">
									<div class="col-md-6  pr-1 pb-2">
										<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-outline-info form-control">Details</a>
									</div>
									<div class="col-md-6  pr-lg-3 pr-1">
										<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-success form-control"><i class="fas fa-shopping-cart"></i> Add</a>
									</div>
								</div>
						  </div>
						</div>
					</div>
					<?php if (!empty($product_label)): ?>
						<a class="label sale" style="color: black">
							<div class="thelabel"><?php echo $product_label; ?></div>
							<div class="label-background"></div>
						</a>
					<?php endif ?>
				</div> <!-- SINGLE PRODUCT END -->

				<?php  } } ?>
		  </div> <!-- SINGLE PRODUCT ROW END -->

	  <?php else: ?>

	  	<div class="row suggestion_heading">
				<div class="col-md-12 ">
					<div class="text-center">
						<h2 class="">Bundle Product</h2>
					</div>
				</div>
			</div>

		  <div class="row">
		  	<?php

		  		$get_bundle_product_relations = $getFromU->viewAllFromBundleByBundleID($the_product_id);

		  		foreach ($get_bundle_product_relations as $get_bundle_product_relation) {
		  			$bundle_product_relation_product_id = $get_bundle_product_relation->product_id;

		  			$product = $getFromU->viewFromTableByProductID("products", $bundle_product_relation_product_id);

	  				$product_id = $product->product_id;
		  			$product_title = $product->product_title;
		  			$product_price = $product->product_price;
		  			$product_img1 = $product->product_img1;
		  			$product_label   = $product->product_label;
						$manufacturer_id = $product->manufacturer_id;
						$product_psp_price = $product->product_psp_price;

						$view_manufacturer = $getFromU->selectManufacturerByManufacturerID($manufacturer_id);
						$manufacturer_title = $view_manufacturer->manufacturer_title;

						if ($product_label == "Sale" || $product_label == "Gift") {
							$product_price = "<del>$$product_price</del>";
							$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
						}else{
							$product_price = "$$product_price";
							$product_psp_price = "";
						}

		  			if ($product_id == $the_product_id) {
		  				continue;
		  			}
		  	?>

		  	<div class="col-sm-6 col-md-3 justify-content-center single">
					<div class="product mb-4">
						<div class="card">
						  <a href="details.php?product_id=<?php echo $product_id; ?>"><img class="card-img-top img-fluid p-3" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="Card image cap"></a>
						  <div class="card-body text-center">
						  	<p class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $manufacturer_title; ?></p><hr>
						    <h6 class="card-title"><a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a></h6>
						    <p class="card-text"><?php echo $product_price; ?> <?php echo $product_psp_price; ?></p>
						    <div class="row">
									<div class="col-md-6  pr-1 pb-2">
										<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-outline-info form-control">Details</a>
									</div>
									<div class="col-md-6  pr-lg-3 pr-1">
										<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-success form-control"><i class="fas fa-shopping-cart"></i> Add</a>
									</div>
								</div>
						  </div>
						</div>
					</div>
					<?php if (!empty($product_label)): ?>
						<a class="label sale" style="color: black">
							<div class="thelabel"><?php echo $product_label; ?></div>
							<div class="label-background"></div>
						</a>
					<?php endif ?>
				</div> <!-- SINGLE PRODUCT END -->

				<?php  } ?>
		  </div> <!-- SINGLE PRODUCT ROW END -->

	  <?php endif ?>


	</div>
</div>


<?php require_once 'includes/footer.php'; ?>