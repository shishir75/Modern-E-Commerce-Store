<?php require_once 'includes/header.php'; ?>

<?php
	if (isset($_POST['forget_password_link'])) {
		$customer_email = $_POST['c_email'];

		$check_customer = $getFromU->check_customer_by_email($customer_email);

		if ($check_customer == true) {

			$view_customer = $getFromU->view_customer_by_email($customer_email);
			$customer_name = $view_customer->customer_name;
			$customer_pass = $view_customer->customer_pass;


			$message = '<h1 class="text-center">Your Password has been sent to you</h1> ';
			$message .= '<h2 class="text-center">Dear '.$customer_name.'</h2> ';
			$message .= '<h3 class="text-center">Your Password is <span><b> '.$customer_pass.' </b></span> </h3> ';
			$message .= '<h3 class="text-center"><a href="localhost/ecommerce/checkout.php">Click Here To Login Your Account</a></h3> ';

	    $subject = 'Password Reset';
	    $message = $message;
	    $headers =  'MIME-Version: 1.0' . "\r\n";
	    $headers .= 'From: eCommerce Admin <info@address.com>' . "\r\n";
	    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

			if (mail($customer_email, $subject, $message, $headers)) {
				$success_msg = "Your Password has been Sent to your Email";
			}else{
				$error = "Email not Sent";
			}

		}else{
			$error = "This is an Invalid Email Address";
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
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
				    <li class="breadcrumb-item" aria-current="page">Forgot Password</li>
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

			<?php if (isset($success_msg)): ?>
				<div class="col-md-12">
					<div class="alert alert-success text-center alert-dismissible fade show" role="alert">
					  <?php echo $success_msg; ?>
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				</div>
			<?php endif ?>


			<div class="col-md-12 mb-5">

				<div class="card">
					<div class="card-header">
						<h6 class="text-center">Enter Your Email, We will saend you the Password Reset Link</h6>
					</div>
					<div class="card-body">
						<form method="post" class="needs-validation" novalidate>
						  <div class="form-row">
						    <div class="col-6 offset-md-3 mb-3">
						      <input type="email" name="c_email" class="form-control" id="email" placeholder="Enter Your Email" required>
						      <div class="invalid-feedback">
						        Please provide a valid Email Address.
						      </div>
						    </div>
						  </div>

						  <div class="row">
						  	<div class="col-lg-4 offset-lg-4">
						  		<button class="btn btn-info form-control" name="forget_password_link" type="submit"><i class="fas fa-sign-in-alt"></i> Send Link</button>
						  	</div>
						  </div>
						</form>


						<script>
							// Example starter JavaScript for disabling form submissions if there are invalid fields
							(function() {
							  'use strict';
							  window.addEventListener('load', function() {
							    // Fetch all the forms we want to apply custom Bootstrap validation styles to
							    var forms = document.getElementsByClassName('needs-validation');
							    // Loop over them and prevent submission
							    var validation = Array.prototype.filter.call(forms, function(form) {
							      form.addEventListener('submit', function(event) {
							        if (form.checkValidity() === false) {
							          event.preventDefault();
							          event.stopPropagation();
							        }
							        form.classList.add('was-validated');
							      }, false);
							    });
							  }, false);
							})();
						</script>
					</div>
				</div>

			</div> <!-- col-md-12 End -->



		</div> <!-- Row End -->





	  </div> <!-- SINGLE PRODUCT ROW END -->

	</div>
</div>




<?php require_once 'includes/footer.php'; ?>