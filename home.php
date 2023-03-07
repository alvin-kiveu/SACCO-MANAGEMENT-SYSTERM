<?php include 'db_connect.php' ?>
<style>

</style>

<div class="container-fluid" >


  <div class="col-lg-12" >
    <div class="card dashboard">
      <div class="card-body">
       
      </div>

      <hr>
      <div class="row ml-2 mr-2">
        <div class="col-md-4" >
          <div class="card bg-primary text-white mb-3">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div class="mr-3">
                  <div class="text-white-75" style="color:white">Payments Today</div>
                  <div class="text-lg font-weight-bold" style="color:white">
                    <?php
                    $payments = $conn->query("SELECT sum(amount) as total FROM payments where date(date_created) = '" . date("Y-m-d") . "'");
                    echo "Ksh ".$payments->num_rows > 0 ? number_format($payments->fetch_array()['total'], 2) : "Ksh 0.00";
                    ?>

                  </div>
                </div>

              </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
              <a class=" text-white stretched-link" href="index.php?page=payments">View Payments</a>
              <div class=" text-white">

              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card bg-success text-white mb-3">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div class="mr-3">
                  <div class="text-white-75" style="color:white">Borrowers</div>
                  <div class="text-lg font-weight-bold" style="color:white">
                    <?php
                    $borrowers = $conn->query("SELECT * FROM borrowers");
                    echo $borrowers->num_rows > 0 ? $borrowers->num_rows : "0";
                    ?>

                  </div>
                </div>

              </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
              <a class=" text-white stretched-link" href="index.php?page=borrowers">View Borrowers</a>
              <div class=" text-white">

              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card bg-warning text-white mb-3">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div class="mr-3">
                  <div class="text-white-75" style="color:white">Active Loans</div>
                  <div class="text-lg font-weight-bold" style="color:white">
                    <?php
                    $loans = $conn->query("SELECT * FROM loan_list where status = 2");
                    echo $loans->num_rows > 0 ? $loans->num_rows : "0";
                    ?>

                  </div>
                </div>

              </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
              <a class="text-white stretched-link" href="index.php?page=loans">View Loan List</a>
              <div class=" text-white">

              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card bg-info text-white mb-3">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div class="mr-3">
                  <div class="text-white-75 " style="color:white">Total Receivable</div>
                  <div class="text-lg font-weight-bold" style="color:white">
                    <?php
                    $payments = $conn->query("SELECT sum(amount - penalty_amount) as total FROM payments where date(date_created) = '" . date("Y-m-d") . "'");
                    $loans = $conn->query("SELECT sum(l.amount + (l.amount * (p.interest_percentage/100))) as total FROM loan_list l inner join loan_plan p on p.id = l.plan_id where l.status = 2");
                    $loans =  $loans->num_rows > 0 ? $loans->fetch_array()['total'] : "0";
                    $payments =  $payments->num_rows > 0 ? $payments->fetch_array()['total'] : "0";
                    echo "Ksh ".number_format($loans - $payments, 2);
                    ?>

                  </div>
                </div>

              </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
              <a class="text-white stretched-link" href="index.php?page=loans">View Loan List</a>
              <div class="text-white">

              </div>
            </div>
          </div>
        </div>

      </div>

      <div class="row ml-2 mr-2">

        <div class="card-body ">
          <div class="mt-5 mb-3 ">
            <b class="display-6">Payment List</b>
          </div>
          <table class="table table-bordered" id="loan-list">
            <colgroup>
              <col width="10%">
              <col width="25%">
              <col width="25%">
              <col width="20%">
              <col width="10%">
              <col width="10%">
            </colgroup>
            <thead>
              <tr>
                <th class="text-center">#</th>
                <th class="text-center">Loan Reference No</th>
                <th class="text-center">Payee</th>
                <th class="text-center">Amount</th>
                <th class="text-center">Penalty</th>
                <th class="text-center">Action</th>
              </tr>
            </thead>
            <tbody>
              <?php

              $i = 1;

              $qry = $conn->query("SELECT p.*,l.ref_no,concat(b.lastname,', ',b.firstname,' ',b.middlename)as name, b.contact_no, b.address from payments p inner join loan_list l on l.id = p.loan_id inner join borrowers b on b.id = l.borrower_id  order by p.id asc");
              while ($row = $qry->fetch_assoc()) :


              ?>
              <tr>

                <td class="text-center"><?php echo $i++ ?></td>
                <td>
                  <?php echo $row['ref_no'] ?>
                </td>
                <td>
                  <?php echo $row['payee'] ?>

                </td>
                <td>
                  <?php echo number_format($row['amount'], 2) ?>

                </td>
                <td class="text-center">
                  <?php echo number_format($row['penalty_amount'], 2) ?>
                </td>
                <td class="text-center">
                  <button class="btn btn-primary edit_payment" type="button" data-id="<?php echo $row['id'] ?>"><i
                      class="fa fa-edit"></i></button>
                  <button class="btn btn-danger delete_payment" type="button" data-id="<?php echo $row['id'] ?>"><i
                      class="fa fa-trash"></i></button>
                </td>

              </tr>

              <?php endwhile; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>

</div>