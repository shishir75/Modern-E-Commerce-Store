<?php require_once(realpath($_SERVER["DOCUMENT_ROOT"]) .'/eCommerce/core/init.php'); ?>

<?php

	if (isset($_GET['icon_id'])) {
		$icon_id = $_GET['icon_id'];

    	$sql = "DELETE FROM icons WHERE icon_id = :icon_id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(":icon_id", $icon_id);
        if ($stmt->execute()) {
        	$_SESSION['delete_icon_msg'] = "Icon has been Deleted Successfully";
        	header('Location: ../index.php?view_icons');
        }

	}
?>