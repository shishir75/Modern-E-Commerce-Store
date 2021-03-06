<?php require_once 'includes/header.php'; ?>

<?php

	if (isset($_POST['add_icon'])) {
		$icon_products = $_POST['product_id'];
		$icon_title = $getFromU->checkInput($_POST['icon_title']);

		$icon_image = $_FILES['icon_image']['name'];
		$temp_name = $_FILES['icon_image']['tmp_name'];

		move_uploaded_file($temp_name, "icon_images/$icon_image");

		foreach ($icon_products as $icon_product) {
			$insert_icon = $getFromU->create("icons", array("icon_product" => $icon_product, "icon_title" => $icon_title, "icon_image" => $icon_image));
		}

		if ($insert_icon) {
			$_SESSION['insert_icon_msg'] = "Icon has been added Sucessfully";
			header('Location: index.php?view_icons');

		}else {
			echo '<script>alert("Icon has not been added")</script>';
		}


	}

?>



<nav aria-label="breadcrumb" class="my-4">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.php?dashboard">Dashboard</a></li>
		<li class="breadcrumb-item active" aria-current="page">Insert Icon</li>
	</ol>
</nav>



<div class="card rounded">
	<div class="card-header bg-light h5"><i class="fas fa-plus-square"></i> Insert Icon</div>
	<div class="card-body">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
					<div class="form-row mb-3">
				    <div class="col-3">
				      <label for="icon_title">Icon Title</label>
				    </div>
				    <div class="col-md-9">
				    	<input type="text" name="icon_title" class="form-control" id="icon_title" placeholder="Icon Title" required>
				      <div class="invalid-feedback">
				        Please provide a Icon Title.
				      </div>
				    </div>
				  </div>
					<div class="form-row mb-3">
				    <div class="col-3">
				      <label for="icon_product">Icon Product</label>
				    </div>
				    <div class="col-md-9">
				    	<div class="card">
				    		<div class="card-header">Select Products / Bundle</div>
				    		<div class="card-body pre-scrollable" style="height: 200px">
				    			<p class="font-weight-bold">---- Select Product ----</p>
				    			<?php
				    			$view_products = $getFromU->view_bundle_products('product');
				    			foreach ($view_products as $view_product) {
				    				$product_id = $view_product->product_id;
				    				$product_title = $view_product->product_title;
					    		?>
					    		<div class="custom-control custom-checkbox mb-1">
									  <input type="checkbox" name="product_id[]" value="<?php echo $product_id; ?>" id="<?php echo $product_id; ?>" class="custom-control-input">
									  <label class="custom-control-label" for="<?php echo $product_id; ?>"><?php echo $product_title; ?></label>
									</div>
					    		<?php } ?>
					    		<p class="mt-2 font-weight-bold">---- Select Bundle ----</p>
					    		<?php
				    			$view_products = $getFromU->view_bundle_products('bundle');
				    			foreach ($view_products as $view_product) {
				    				$product_id = $view_product->product_id;
				    				$product_title = $view_product->product_title;
					    		?>
					    		<div class="custom-control custom-checkbox mb-1">
									  <input type="checkbox" name="product_id[]" value="<?php echo $product_id; ?>" id="<?php echo $product_id; ?>" class="custom-control-input">
									  <label class="custom-control-label" for="<?php echo $product_id; ?>"><?php echo $product_title; ?></label>
									</div>
					    		<?php } ?>

				    		</div>
				    	</div>

				    </div>
				  </div>


				  <div class="form-row mb-3">
				    <div class="col-3">
				      <label for="icon_image">Icon Image</label>
				    </div>
				    <div class="col-md-9">
				    	<input type="file" name="icon_image" id="icon_image" required>
				      <div class="invalid-feedback">
				        Please provide a Icon Image.
				      </div>
				    </div>
				  </div>



				  <div class="row">
				  	<div class="col-12 mt-4">
				  		<button class="btn btn-info form-control" name="add_icon" type="submit"><i class="fas fa-plus-circle"></i> Insert Icon</button>
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

