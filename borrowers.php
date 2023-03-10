<?php include 'db_connect.php' ?>

<div class="container-fluid">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header">
        <large class="card-title">
          <b>Borrower List</b>
        </large>
        <button class="btn btn-primary col-md-2 float-right" type="button" id="new_borrower"><i class="fa fa-plus"></i>
          New Borrower</button>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="borrower-list">
          <colgroup>
            <col width="10%">
            <col width="35%">
            <col width="30%">
            <col width="15%">
            <col width="10%">
          </colgroup>
          <thead>
            <tr>
              <th class="text-center">#</th>
              <th class="text-center">Name</th>
              <th class="text-center">Address</th>
              <th class="text-center">Contact</th>
              <th class="text-center">Email</th>
              <th class="text-center">Credit Score</th>
              <th class="text-center">Tax ID</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $i = 1;
            $qry = $conn->query("SELECT * FROM borrowers order by id desc");
            while ($row = $qry->fetch_assoc()) :

            ?>
              <tr>

                <td class="text-center"><?php echo $i++ ?></td>
                <td>
                  <p><b><?php echo ucwords($row['lastname'] . ", " . $row['firstname'] . ' ' . $row['middlename']) ?></b>
                  </p>
                </td>
                <td>
                  <p><b><?php echo $row['address'] ?></b></p>
                </td>
                <td>
                  <p><b><?php echo $row['contact_no'] ?></b></p>
                </td>
                <td>
                  <p><b><?php echo $row['email'] ?></b></p>
                </td>
                <td>
                  <p><b><?php
                        //COUNT NUMBER OF COMPLETE LOAN PAYMENT
                        $count = $conn->query("SELECT * FROM loan_list where borrower_id = " . $row['id'] . " and status = 3")->num_rows;
                        if ($count >= 0) {
                          $loanamountlimmt = 1000;
                        } elseif ($count >= 1) {
                          $loanamountlimmt = 2000;
                        } elseif ($count >= 2) {
                          $loanamountlimmt = 3000;
                        } elseif ($count >= 3) {
                          $loanamountlimmt = 4000;
                        } elseif ($count >= 4) {
                          $loanamountlimmt = 5000;
                        } elseif ($count >= 5) {
                          $loanamountlimmt = 6000;
                        } elseif ($count >= 6) {
                          $loanamountlimmt = 7000;
                        } elseif ($count >= 7) {
                          $loanamountlimmt = 8000;
                        } elseif ($count >= 8) {
                          $loanamountlimmt = 9000;
                        } elseif ($count >= 9) {
                          $loanamountlimmt = 10000;
                        } elseif ($count >= 10) {
                          $loanamountlimmt = 11000;
                        } elseif ($count >= 11) {
                          $loanamountlimmt = 12000;
                        } else {
                          $loanamountlimmt = 50000;
                        }
                        echo  $loanamountlimmt;
                        ?></b></p>
                </td>
                <td>
                  <p><b><?php echo $row['tax_id'] ?></b></p>
                </td>
                <td class="text-center">
                  <button class="btn btn-primary edit_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
                  <button class="btn btn-danger delete_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></button>
                </td>

              </tr>

            <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<style>
  td p {
    margin: unset;
  }

  td img {
    width: 8vw;
    height: 12vh;
  }

  td {
    vertical-align: middle !important;
  }
</style>
<script>
  $('#borrower-list').dataTable()
  $('#new_borrower').click(function() {
    uni_modal("New borrower", "manage_borrower.php", 'mid-large')
  })
  $('.edit_borrower').click(function() {
    uni_modal("Edit borrower", "manage_borrower.php?id=" + $(this).attr('data-id'), 'mid-large')
  })
  $('.delete_borrower').click(function() {
    _conf("Are you sure to delete this borrower?", "delete_borrower", [$(this).attr('data-id')])
  })

  function delete_borrower($id) {
    start_load()
    $.ajax({
      url: 'ajax.php?action=delete_borrower',
      method: 'POST',
      data: {
        id: $id
      },
      success: function(resp) {
        if (resp == 1) {
          alert_toast("borrower successfully deleted", 'success')
          setTimeout(function() {
            location.reload()
          }, 1500)

        }
      }
    })
  }
</script>