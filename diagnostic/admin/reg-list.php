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
                    <h4 class="page-title">OPD Registration List</h4>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                <li class="breadcrumb-item" aria-current="page">OPD</li>
                                <li class="breadcrumb-item active" aria-current="page">Registration List</li>
                            </ol>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
        <section class="content">
            <div class="row">
                <div class="box">
                    <div class="box-body">
                        <div class="table-responsive">
                            <table id="example" class="table table-hover display nowrap margin-top-10 w-p100">
                                <thead>
                                    <tr>
                                        <th>Reg. No.</th>
                                        <!-- <th>OP Id</th> -->
                                        <th>Bill No</th>
                                        <th>Bill Date</th>
                                        <th>Name </th>
                                        <th>Gender </th>
                                        <th>Test</th>
                                        <th>Rate</th>
                                        <th>Doctor</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $sql = "SELECT b.id, b.rno, b.opid, b.billdate, b.billno, b.pname, b.uname, b.servname, b.servrate, r.rsex, r.rage, r.rdoc
                                    FROM billing AS b
                                    INNER JOIN registration AS r ON b.rno = r.rno
                                    INNER JOIN servmaster AS s ON b.servname = s.servname 
                                    WHERE s.dept = 'PATHOLOGY'
                                    ORDER BY b.billno DESC";
                                    $stmt = sqlsrv_query($conn, $sql);
                                    if ($stmt === false) {
                                        die(print_r(sqlsrv_errors(), true));
                                    }
                                    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                        $id = $row['id'];
                                        $rno = $row['rno'];
                                        $opid = $row['opid'];
                                        $pname = $row['pname'];
                                        $billdate = $row['billdate'];
                                        $billno = $row['billno'];
                                        $servname = $row['servname'];
                                        $servrate = $row['servrate'];
                                        $addedBy = $row['uname'];
                                        $rsex = $row['rsex'];
                                        $rage = $row['rage'];
                                        $rdoc = $row['rdoc'];
                                        ?>
                                        <tr>
                                            <td>
                                                <?php echo $rno; ?>
                                            </td>
                                            <td>
                                                <?php echo $billno; ?>
                                            </td>
                                            <td>
                                                <?php echo $billdate; ?>
                                            </td>
                                            <td>
                                                <?php echo $pname; ?> (<?php echo $rage; ?>)
                                            </td>
                                            <td>
                                                <?php echo $rsex; ?>
                                            </td>
                                            <td>
                                                <?php echo $servname; ?>
                                            </td>
                                            <td>
                                                <?php echo $servrate; ?>
                                            </td>
                                            <td>
                                                <?php echo $rdoc; ?>
                                            </td>
                                            <td class="text-center">
                                                <div class="list-icons d-inline-flex">
                                                    <div class="list-icons-item dropdown">
                                                        <a href="#" class="list-icons-item dropdown-toggle"
                                                            data-bs-toggle="dropdown" aria-expanded="false"><i
                                                                class="fa fa-file-text"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-end">
                                                            <a href="#" class="dropdown-item"><i class="fa fa-print"></i>
                                                                Print</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="update-reg?id=<?php echo $id; ?>&rno=<?php echo $rno; ?>"
                                                                class="dropdown-item"><i class="fa fa-pencil"></i> Edit</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="visit-doctor?id=<?php echo $id; ?>&rno=<?php echo $rno; ?>"
                                                                class="dropdown-item"><i
                                                                    class="fa-solid fa-user-doctor"></i> Visit Doctor</a>
                                                            <a href="opd-billing?id=<?php echo $id; ?>&rno=<?php echo $rno; ?>"
                                                                class="dropdown-item"> OPD Billing</a>
                                                            <a href="#" class="dropdown-item"> IPD Admisstion</a>
                                                        </div>
                                                    </div>
                                                </div>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <!-- /.col -->
    </div>
    <!-- /.row -->
    </section>
    <!-- /.content -->

</div>
</div>

<?php
include ('footer.php');

?>