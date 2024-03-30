<?php
session_start();
if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
    $login_username = $_SESSION['username'];
} else {
    echo "<script>location.href='../../login';</script>";
}
include ('header.php');

?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Department Master</h4>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href=""><i class="mdi mdi-home-outline"></i></a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">Department</li>
                                <li class="breadcrumb-item active" aria-current="page">Master</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main content -->
        <section class="content">
            <!-- Basic Forms -->
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col">
                            <form novalidate method="POST">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <h5>Department<span class="text-danger">*</span></h5>
                                            <input type="text" name="dept" placeholder="" class="form-control" required
                                                data-validation-required-message="This field is required">
                                        </div>
                                    </div>
                                </div>
                                <div class="text-xs-right">
                                    <button type="submit" class="btn btn-info" name="save">SAVE</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box -->
        </section>
        <!-- /.content -->

        <!-- upload CSV -->
        <section class="content">
            <!-- Basic Forms -->
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col">
                            <form novalidate method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <h5>Department (Upload CSV File)<span class="text-danger">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="upload/DepartmentFormat.csv" Download>
                                                <i class="fa-solid fa-download"></i> Download Format</a>
                                            </h5>
                                            <input type="file" name="dept" placeholder="Upload CSV File"
                                                class="form-control" required
                                                data-validation-required-message="This field is required">
                                        </div>
                                    </div>
                                </div>
                                <div class="text-xs-right">
                                    <button type="submit" class="btn btn-info" name="uploadCSV">SAVE</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box -->
        </section>
    </div>
</div>
<!-- /.content-wrapper -->


<?php
if (isset($_POST['save'])) {
    $dept = $_POST['dept'];
    $addedBy = $login_username;
    // Check if the department already exists
    $check_sql = "SELECT COUNT(*) AS count FROM deptmaster WHERE dept = '$dept'";
    $check_stmt = sqlsrv_query($conn, $check_sql);
    if ($check_stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }
    $row = sqlsrv_fetch_array($check_stmt, SQLSRV_FETCH_ASSOC);
    $dept_count = $row['count'];
    if ($dept_count > 0) {
        // Department already exists, display alert
        echo '<script>
                swal("Alert", "Department already exists!", "warning");
            </script>';
    } else {
        // Department does not exist, proceed with insertion
        $sql = "INSERT INTO deptmaster (dept, addedBy) VALUES ('$dept', '$addedBy')";
        $stmt = sqlsrv_query($conn, $sql);
        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        } else {
            echo '<script>
                    swal("Success!", "", "success");
                </script>';
        }
    }
}


// CSV Upload 
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["uploadCSV"])) {
    if (isset($_FILES["dept"]) && $_FILES["dept"]["error"] == UPLOAD_ERR_OK) {
        $csvFile = $_FILES["dept"]["tmp_name"];
        $fileHandle = fopen($csvFile, "r");
        fgetcsv($fileHandle);
        $sql = "INSERT INTO deptmaster (dept, addedBy) VALUES (?, ?)";
        $stmt = sqlsrv_prepare($conn, $sql, array(&$dept, &$addedBy));
        $addedBy = $login_username;
        while (($data = fgetcsv($fileHandle, 1000, ",")) !== false) {
            $dept = $data[0];
            if (!sqlsrv_execute($stmt)) {
                echo "Error inserting data.\n";
                die(print_r(sqlsrv_errors(), true));
            }
        }

        fclose($fileHandle);
        sqlsrv_close($conn);
        echo '<script>
                swal("Success!", "", "success");
            </script>';
    } else {
        echo '<script>
                swal("No file uploaded.!", "", "error");
            </script>';
    }

}

include ('footer.php');

?>