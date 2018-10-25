<?php

	// / getProducts function Code Starts ///

	$aWhere = array();

	// / Manufacturers Code Starts ///

	if (isset($_REQUEST['man']) && is_array($_REQUEST['man']))
		{
		foreach($_REQUEST['man'] as $sKey => $sVal)
			{
			if ((int)$sVal != 0)
				{
				$aWhere[] = 'manufacturer_id=' . (int)$sVal;
				}
			}
		}

	// / Manufacturers Code Ends ///
	// / Products Categories Code Starts ///

	if (isset($_REQUEST['p_cat']) && is_array($_REQUEST['p_cat']))
		{
		foreach($_REQUEST['p_cat'] as $sKey => $sVal)
			{
			if ((int)$sVal != 0)
				{
				$aWhere[] = 'p_cat_id=' . (int)$sVal;
				}
			}
		}

	// / Products Categories Code Ends ///
	// / Categories Code Starts ///

	if (isset($_REQUEST['cat']) && is_array($_REQUEST['cat']))
		{
		foreach($_REQUEST['cat'] as $sKey => $sVal)
			{
			if ((int)$sVal != 0)
				{
				$aWhere[] = 'cat_id=' . (int)$sVal;
				}
			}
		}

	// / Categories Code Ends ///

	$per_page = 6;

	if (isset($_GET['page'])){

		$page = $_GET['page'];

	} else {
		$page = 1;
	}

	$start_from = ($page - 1) * $per_page;
	$sLimit = " order by 1 DESC LIMIT $start_from,$per_page";
	$sWhere = (count($aWhere) > 0 ? ' WHERE ' . implode(' or ', $aWhere) : '') . $sLimit;

	$get_products = $getFromU->selectAllProducts($sWhere);

	foreach ($get_products as $get_product) {
		$product_id = $get_product->product_id;
		$product_title = $get_product->product_title;
		$product_price = $get_product->product_price;
		$product_img1 = $get_product->product_img1;
		$product_label   = $get_product->product_label;
		$manufacturer_id = $get_product->manufacturer_id;
		$product_psp_price = $get_product->product_psp_price;

		$view_manufacturer = $getFromU->selectManufacturerByManufacturerID($manufacturer_id);
		$manufacturer_title = $view_manufacturer->manufacturer_title;

		if ($product_label == "Sale" || $product_label == "Gift") {
			$product_price = "<del>$$product_price</del>";
			$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
		}else{
			$product_price = "$$product_price";
			$product_psp_price = "";
		}

		?>


	<div class="col-sm-6 col-md-4 justify-content-center single">
		<div class="product mb-4">
			<div class="card">
				<a href="details.php?product_id=<?php echo $product_id; ?>"><img class="card-img-top img-fluid p-3" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="Card image cap"></a>
				<div class="card-body text-center pt-0">
					<p class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $manufacturer_title; ?></p><hr>
					<h6 class="card-title"><a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a></h6>
					<p class="card-text"><?php echo $product_price; ?> <?php echo $product_psp_price; ?></p>
					<div class="row">
						<div class="col-md-6  pr-1 pb-2">
							<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-outline-info form-control">Details</a>
						</div>
						<div class="col-md-6 pr-lg-3 pr-1">
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

<?php  } // / getProducts function Code Ends /// ?>




