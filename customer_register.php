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
				    <li class="breadcrumb-item" aria-current="page">Register</li>
				  </ol>
				</nav>
			</div>




			<div class="col-md-12 mb-4">
				<div class="card">
				  <div class="card-header text-center">
						<h5 class="mt-4">Register A New Account</h5>
				  </div>
				  <div class="card-body">
					  <?php
					  	if (isset($_POST['register'])) {

					  		$c_name = $_POST['c_name'];
					  		$c_email = $_POST['c_email'];
					  		$c_pass = $_POST['c_pass'];
					  		$c_country = $_POST['c_country'];
					  		$c_city = $_POST['c_city'];
					  		$c_contact = $_POST['c_mobile'];
					  		$c_address = $_POST['c_address'];

					  		$c_image = $_FILES['c_image']['name'];
					  		$c_image_tmp = $_FILES['c_image']['tmp_name'];

					  		$c_ip = $getFromU->getRealUserIp();

					  		$secret = '6LeQlHYUAAAAAINHxB4boa6a_oPbYhJeRBwyQ2Bu';
					  		$response = $_POST['g-recaptcha-response'];
					  		$remoteip = $_SERVER['REMOTE_ADDR'];
					  		$url = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$response&remoteip=$remoteip");
					  		$result = json_decode($url, true);

					  		if ($result['success'] == 1) {

					  			$check_customer = $getFromU->check_customer_by_email($c_email);

						  		if ($check_customer === true) {
						  			$error = "You are already Registered using this Email";

						  		}else{
						  			$customer_confirm_code = mt_rand();

						  			$message = '<h1 class="text-center">Email Confirmation From eCommerce Store</h1> ';
										$message .= '<h2 class="text-center">Dear '.$c_name.'</h2> ';
										$message .= '<h3 class="text-center"><a href="localhost/ecommerce/customer/my_account.php?confirm_code='.$customer_confirm_code.'">Click Here To Confirm Email</a></h3> ';

								    $subject = 'Confirm Email';
								    $message = $message;
								    $headers =  'MIME-Version: 1.0' . "\r\n";
								    $headers .= 'From: eCommerce Admin <info@address.com>' . "\r\n";
								    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

										if (mail($c_email, $subject, $message, $headers)) {
											$success_msg = "Your Confirmation Link has been Sent to your Email";
										}else{
											$error = "Email not Sent";
										}


						  			move_uploaded_file($c_image_tmp, "customer/assets/customer_images/$c_image");

						  			$add_customer = $getFromU->create("customers", array("customer_name" => $c_name, "customer_email" => $c_email, "customer_pass" => $c_pass, "customer_country" => $c_country, "customer_city" => $c_city, "customer_contact" => $c_contact, "customer_address" => $c_address, "customer_image" => $c_image, "customer_ip" => $c_ip, "customer_confirm_code" => $customer_confirm_code ));

						  			if ($add_customer) {
						  				$check_cart = $getFromU->count_product_by_ip($c_ip);

						  				if ($check_cart > 0) {
						  					$_SESSION['customer_email'] = $c_email;
						  					echo '<script>alert("You have successfully Registered")</script>';
						  					echo '<script>window.open("checkout.php", "_self")</script>';
						  				}else{
						  					echo '<script>alert("You have successfully Registered")</script>';
						  					echo '<script>window.open("index.php", "_self")</script>';
						  				}
						  			}
						  		}
					  		} else{
					  			echo '<script>alert("Please Select Re-Capcha")</script>';
					  		}

					  	}
					  ?>

						<?php if (isset($error)): ?>
							<div class="alert alert-warning text-center alert-dismissible fade show" role="alert">
							  <?php echo $error; ?>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>
						<?php endif ?>

						<?php if (isset($add_msg)): ?>
							<div class="alert alert-success text-center alert-dismissible fade show" role="alert">
							  <?php echo $add_msg; ?>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>
						<?php endif ?>


						<form method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_name">Customer Name</label>
						      <input type="text" name="c_name" class="form-control" id="c_name" value="<?php echo $c_name ?? ""; ?>" placeholder="Enter Your Name" required>
						      <div class="invalid-feedback">
						        Please provide a valid Name.
						      </div>
						    </div>
						  </div>
						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_email">Customer Email</label>
						      <input type="email" name="c_email" class="form-control" id="c_email" value="<?php echo $c_email ?? ""; ?>" placeholder="Enter Your Email" required>
						      <div class="invalid-feedback">
						        Please provide a valid Email Address.
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_password">Customer Password</label>
						      <div class="input-group">
						      	<input type="password" name="c_pass" class="form-control" id="c_password" value="<?php echo $c_pass ?? ""; ?>" placeholder="Enter Your Password" required>
						      	<div class="input-group-prepend">
						          <div class="input-group-text">
						          	<div id="meter_wrapper">
						          		<span id="pass_type"></span>
						          		<div id="meter"></div>
						          	</div>
						          </div>
						        </div>
						      </div>
						      <div class="invalid-feedback">
						        Please provide a Password
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="confirm_password">
						      	Confirm Password
						      	<span class="check_pass">
						      		<i class="fas fa-check tick2"></i>
						      		<i class="fas fa-times cross2"></i>
						      	</span>
						      </label>
						      <input type="password" class="form-control confirm" id="confirm_password" placeholder="Enter Confirm Password" required>
						      <div class="invalid-feedback">
						        Please Confirm Password
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_country">Customer Country</label>
						      <input type="text" name="c_country" class="form-control" id="c_country" value="<?php echo $c_country ?? ""; ?>" placeholder="Enter Your Country" required>
						      <div class="invalid-feedback">
						        Please provide a Country
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_city">Customer City</label>
						      <input type="text" name="c_city" class="form-control" id="c_city" value="<?php echo $c_city ?? ""; ?>" placeholder="Enter Your City" required>
						      <div class="invalid-feedback">
						        Please provide a City
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_mobile">Customer Contact No.</label>
						      <input type="tel" name="c_mobile" class="form-control" id="c_mobile" value="<?php echo $c_contact ?? ""; ?>" placeholder="Enter Your Mobile No" required>
						      <div class="invalid-feedback">
						        Please provide a Mobile No
						      </div>
						    </div>
						  </div>

						   <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_address">Customer Address</label>
						      <input type="text" name="c_address" class="form-control" id="c_address" value="<?php echo $c_address ?? ""; ?>" placeholder="Enter Your Address" required>
						      <div class="invalid-feedback">
						        Please provide Address.
						      </div>
						    </div>
						  </div>

						  <div class="form-row">
						    <div class="col-12 mb-3">
						      <label for="c_image">Customer Image</label>
						      <input type="file" name="c_image" class="form-control image_file" id="c_image" required>
						      <div class="invalid-feedback">
						        Please provide a Profile Image
						      </div>
						    </div>
						  </div>


						  <div class="form-group mt-3">
					    	<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="invalidCheck" required >
								  <label class="custom-control-label" for="invalidCheck">Subscribe to Newsletter</label>
								</div>
						  </div>

						  <div class="form-group mt-3">
					    	<div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="invalidCheck1" required >
								  <label class="custom-control-label" for="invalidCheck1">Agree to Terms &amp; Conditions</label>
								</div>
						  </div>

						  <div class="form-row">
						    <center>
						      <div class="g-recaptcha" data-sitekey="6LeQlHYUAAAAAI2t81Q3myw4fefWMyiPJ5PpY3q0"></div>
						    </center>
						  </div>

						  <div class="row">
						  	<div class="col-lg-4 offset-lg-4">
						  		<button class="btn btn-info form-control" name="register" type="submit"><i class="fas fa-user-plus"></i> Register</button>
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



			</div> <!-- col-md-9 End -->


		</div> <!-- Row End -->





	  </div> <!-- SINGLE PRODUCT ROW END -->

	</div>
</div>




<?php require_once 'includes/footer.php'; ?>


<script>

	$(document).ready(function() {

		$('.confirm').keyup(function() {
			var password = $('#c_password').val();
			var confirm_password = $('#confirm_password').val();

			if (password == confirm_password) {
				$('.tick2').show();
				$('.cross2').hide();
				$('.check_pass i').css("color", 'green');
			}else{
				$('.tick2').hide();
				$('.cross2').show();
				$('.check_pass i').css("color", 'red');
			}

		});
	});

</script>


<script>

	$(document).ready(function(){

		$("#c_password").keyup(function(){

			check_pass();

		});

	});

	function check_pass() {
	 var val=document.getElementById("c_password").value;
	 var meter=document.getElementById("meter");
	 var no=0;
	 if(val!="")
	 {
	// If the password length is less than or equal to 6
	if(val.length<=6)no=1;

	 // If the password length is greater than 6 and contain any lowercase alphabet or any number or any special character
	  if(val.length>6 && (val.match(/[a-z]/) || val.match(/\d+/) || val.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)))no=2;

	  // If the password length is greater than 6 and contain alphabet,number,special character respectively
	  if(val.length>6 && ((val.match(/[a-z]/) && val.match(/\d+/)) || (val.match(/\d+/) && val.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) || (val.match(/[a-z]/) && val.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))))no=3;

	  // If the password length is greater than 6 and must contain alphabets,numbers and special characters
	  if(val.length>6 && val.match(/[a-z]/) && val.match(/\d+/) && val.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))no=4;

	  if(no==1)
	  {
	   $("#meter").animate({width:'50px'},300);
	   meter.style.backgroundColor="red";
	   document.getElementById("pass_type").innerHTML="Very Weak";
	  }

	  if(no==2)
	  {
	   $("#meter").animate({width:'100px'},300);
	   meter.style.backgroundColor="#F5BCA9";
	   document.getElementById("pass_type").innerHTML="Weak";
	  }

	  if(no==3)
	  {
	   $("#meter").animate({width:'150px'},300);
	   meter.style.backgroundColor="#FF8000";
	   document.getElementById("pass_type").innerHTML="Good";
	  }

	  if(no==4)
	  {
	   $("#meter").animate({width:'200px'},300);
	   meter.style.backgroundColor="#00FF40";
	   document.getElementById("pass_type").innerHTML="Strong";
	  }
	 }

	 else
	 {
	  meter.style.backgroundColor="";
	  document.getElementById("pass_type").innerHTML="";
	 }
	}

</script>