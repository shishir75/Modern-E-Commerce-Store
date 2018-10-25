<?php require_once 'includes/header.php'; ?>

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
				<a href="shop.php">Shop</a>
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
        <a class="active" href="services.php">Services</a>
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
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
				    <li class="breadcrumb-item" aria-current="page">Services</li>
				  </ol>
				</nav>
			</div>

			<div class="col-md-12 mb-4">
				<div class="card-deck">
					<?php
						$get_services = $getFromU->viewAllFromTable('services');
						foreach ($get_services as $get_service) {
							$service_id = $get_service->service_id;
							$service_title = $get_service->service_title;
							$service_image = $get_service->service_image;
							$service_desc = $get_service->service_desc;
							$service_button = $get_service->service_button;
							$service_url = $get_service->service_url;
					?>


				  <div class="card text-justify">
				    <img class="card-img-top" height="200px" src="admin_area/services_images/<?php echo $service_image; ?>" alt="<?php echo $service_title; ?>">
				    <div class="card-body">
				      <h4 class="card-title"><?php echo $service_title; ?></h4>
				      <p class="card-text"><?php echo $service_desc; ?></p>
				    </div>
				    <div class="card-footer">
				      <center class="text-muted"><a href="<?php echo $service_url; ?>" class="btn btn-sm btn-info text-center"><?php echo $service_button; ?></a></center>
				    </div>
				  </div>
					<?php } ?>

				</div>



			</div> <!-- col-md-9 End -->


		</div> <!-- Row End -->





	  </div> <!-- SINGLE PRODUCT ROW END -->

	</div>
</div>




<?php require_once 'includes/footer.php'; ?>