<?php require_once 'includes/header.php'; ?>

<?php

	if (isset($_GET['edit_icon'])) {
		$icon_id = $getFromU->checkInput($_GET['edit_icon']);

		$view_icon = $getFromU->view_icon_by_id($icon_id);

		$icon_title = $view_icon->icon_title;
		$icon_image = $view_icon->icon_image;
		$icon_product = $view_icon->icon_product;

		$view_product =$getFromU->view_Product_By_Product_ID($icon_product);
		$the_product_title = $view_product->product_title;
	}
?>



<?php

	if (isset($_POST['edit_icon'])) {
		$icon_product = $getFromU->checkInput($_POST['product_id']);
		$icon_title = $getFromU->checkInput($_POST['icon_title']);
		$icon_id = $getFromU->checkInput($_POST['icon_id']);

		$icon_image = $_FILES['icon_image']['name'];
		$temp_name = $_FILES['icon_image']['tmp_name'];

		move_uploaded_file($temp_name, "icon_images/$icon_image");


		$update_icon = $getFromU->update_icon("icons", $icon_id, array("icon_product" => $icon_product, "icon_title" => $icon_title, "icon_image" => $icon_image));


		if ($update_icon) {
			$_SESSION['update_icon_msg'] = "Icon has been Updated Sucessfully";
			header('Location: index.php?view_icons');

		}else {
			echo '<script>alert("Icon has not been Updated")</script>';
		}


	}

?>



<nav aria-label="breadcrumb" class="my-4">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.php?dashboard">Dashboard</a></li>
		<li class="breadcrumb-item active" aria-current="page">Update Icon</li>
	</ol>
</nav>



<div class="card rounded">
	<div class="card-header bg-light h5"><i class="fas fa-edit"></i> Update Icon</div>
	<div class="card-body">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
					<div class="form-row mb-3">

				    <div class="col-md-9">
				    	<input type="hidden" name="icon_id" value="<?php echo $icon_id; ?>" required>

				    </div>
				  </div>

				  <div class="form-row mb-3">
				    <div class="col-3">
				      <label for="icon_title">Icon Title</label>
				    </div>
				    <div class="col-md-9">
				    	<input type="text" name="icon_title" value="<?php echo $icon_title; ?>" class="form-control" id="icon_title" placeholder="Icon Title" required>
				      <div class="invalid-feedback">
				        Please provide a Icon Title.
				      </div>
				    </div>
				  </div>


				  <div class="form-row mb-3">
						<div class="col-3">
							<label for="product_id">Coupon Product / Bundle</label>
						</div>
						<div class="col-md-9">
							<select name="product_id" id="product_id" class="form-control" required>
								<option value="<?php echo $product_id; ?>"><?php echo $the_product_title; ?></option>
								<?php
									$products = $getFromU->view_bundle_products('product');
									foreach ($products as $product) {
										$product_id = $product->product_id;
										$product_title = $product->product_title;
										if ($product_title == $the_product_title) {
											continue;
										}
								?>
								<option value="<?php echo $product_id; ?>"><?php echo $product_title; ?></option>
								<?php } ?>
								<option value="" disabled>----- Select a Bundle -----</option>
								<?php
									$products = $getFromU->view_bundle_products('bundle');
									foreach ($products as $product) {
										$product_id = $product->product_id;
										$product_title = $product->product_title;
										if ($product_title == $the_product_title) {
											continue;
										}
								?>
								<option value="<?php echo $product_id; ?>"><?php echo $product_title; ?></option>
								<?php } ?>
							</select>
							<div class="invalid-feedback">
								Please select a Coupon Product.
							</div>
						</div>
					</div>


				  <div class="form-row mb-3">
				    <div class="col-3">
				      <label for="icon_image">Icon Image</label>
				    </div>
				    <div class="col-md-9">
				    	<input type="file" name="icon_image" id="icon_image" required>
				    	<span><img src="icon_images/<?php echo $icon_image; ?>" height="45" width="45"></span>
				      <div class="invalid-feedback">
				        Please provide a Icon Image.
				      </div>
				    </div>
				  </div>



				  <div class="row">
				  	<div class="col-12 mt-4">
				  		<button class="btn btn-info form-control" name="edit_icon" type="submit"><i class="fas fa-edit"></i> Update Icon</button>
				  	</div>
				  </div>
				</form>
			</div>
		</div>

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





<?php require_once 'includes/footer.php'; ?>

