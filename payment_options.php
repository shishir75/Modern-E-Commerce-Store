<?php
	$session_email = $_SESSION['customer_email'];

	$select_customer = $getFromU->view_customer_by_email($session_email);

	$customer_id = $select_customer->customer_id;

?>



<div class="card">
  <div class="card-body text-center">
    <h5 class="card-title">Payment Options For Yoy</h5>
    <p class="card-text mb-5">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="order.php?c_id=<?php echo $customer_id; ?>" class="btn btn-info text-white"><i class="fas fa-hand-holding-usd"></i> Pay Offline</a>


    <center>
      <form method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
        <input type="hidden" name="business" value="shishir.dev18@gmail.com">
        <input type="hidden" name="cmd" value="_cart">
        <input type="hidden" name="upload" value="1">
        <input type="hidden" name="currency_code" value="USD">
        <input type="hidden" name="return" value="http://localhost/ecommerce/paypal_order.php?c_id=<?php echo $customer_id; ?>">
        <input type="hidden" name="cancel_return" value="http://localhost/ecommerce/">

        <?php
          $i = 0;
          $ip_add = $getFromU->getRealUserIp();
          $get_carts = $getFromU->select_products_by_ip($ip_add);
          foreach ($get_carts as $get_cart) {
            $product_id = $get_cart->p_id;
            $product_qty = $get_cart->qty;
            $product_price = $get_cart->product_price;

            $get_product = $getFromU->view_Product_By_Product_ID($product_id);
            $product_title = $get_product->product_title;
            $i++;
        ?>

        <input type="hidden" name="item_name_<?php echo $i; ?>" value="<?php echo $product_title; ?>">
        <input type="hidden" name="item_number_<?php echo $i; ?>" value="<?php echo $i; ?>">
        <input type="hidden" name="amount_<?php echo $i; ?>" value="<?php echo $product_price; ?>">
        <input type="hidden" name="quantity_<?php echo $i; ?>" value="<?php echo $product_qty; ?>">

        <?php } ?>

        <input type="image" name="submit" width="500" height="270" src="assets/images/PayPal.png">

      </form>
    </center>



  </div>
</div>