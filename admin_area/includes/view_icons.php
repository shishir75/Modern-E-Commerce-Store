<!-- START PAGE CONTENT-->
<div class="page-heading">
    <h1 class="page-title">View Icons</h1>
</div>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.php?dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
    <li class="breadcrumb-item active" aria-current="page">View Icons</li>
  </ol>
</nav>

<?php if (isset($_SESSION['insert_icon_msg'])): ?>
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="alert alert-success text-white text-center alert-dismissible fade show" role="alert">
              <?php echo $_SESSION['insert_icon_msg']; unset($_SESSION['insert_icon_msg']); ?>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
        </div>
    </div>
<?php endif ?>

<?php if (isset($_SESSION['update_icon_msg'])): ?>
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="alert alert-success text-white text-center alert-dismissible fade show" role="alert">
              <?php echo $_SESSION['update_icon_msg']; unset($_SESSION['update_icon_msg']); ?>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
        </div>
    </div>
<?php endif ?>


<?php if (isset($_SESSION['delete_icon_msg'])): ?>
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="alert alert-success text-white text-center alert-dismissible fade show" role="alert">
              <?php echo $_SESSION['delete_icon_msg']; unset($_SESSION['delete_icon_msg']); ?>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
        </div>
    </div>
<?php endif ?>






<div class="page-content fade-in-up">
    <div class="ibox rounded">
        <div class="ibox-head bg-light">
            <div class="ibox-title"><i class="fas fa-list-ul"></i> Icons List</div>
        </div>
        <div class="ibox-body">
            <table class="table table-bordered table-hover table-responsive-lg" id="example-table2" cellspacing="0" width="100%">
                <thead class="bg-light">
                    <tr>
                        <th>Icons ID</th>
                        <th>Icons Title</th>
                        <th>Icons Image</th>
                        <th>Icons Product Title</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tfoot><tr></tr></tfoot>
                <tbody>
                    <?php

                        $view_icons = $getFromU->viewAllFromTable('icons');

                        foreach ($view_icons as $view_icon) {
                            $icon_id = $view_icon->icon_id;
                            $icon_title = $view_icon->icon_title;
                            $icon_image = $view_icon->icon_image;
                            $icon_product = $view_icon->icon_product;

                            $view_product = $getFromU->view_Product_By_Product_ID($icon_product);
                            $product_title = $view_product->product_title;


                    ?>

                    <tr>
                        <td><?php echo $icon_id; ?></td>
                        <td><?php echo $icon_title; ?></td>
                        <td><img src="icon_images/<?php echo $icon_image; ?>" width="30" height="30"></td>
                        <td><?php echo $product_title; ?></td>
                        <td>
                            <a class="text-info" href="index.php?edit_icon=<?php echo $icon_id; ?>"><i class="fas fa-edit"></i> Edit</a>
                        </td>
                        <td>
                            <a class="text-danger" onclick="DeleteIcon('<?php echo $icon_id; ?>')"><i class="fas fa-trash-alt"></i> Delete</a>
                        </td>

                    </tr>

                    <?php } ?>

                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- CORE PLUGINS, Must Need-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- PAGE LEVEL SCRIPTS-->
<script>
    $(function() {
        $('#example-table2').DataTable({
            pageLength: 10,
        });
    });


</script>
