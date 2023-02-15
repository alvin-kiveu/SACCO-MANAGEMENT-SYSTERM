<?php include('db_connect.php'); ?>

<div class="container-fluid">

  <div class="col-lg-12">
    <div class="row">
      <!-- FORM Panel -->
      <div class="col-md-4">
        <form action="" id="manage-loan-type">
          <div class="card">
            <div class="card-header">
              Loan Type Form
            </div>
            <div class="card-body">
              <input type="hidden" name="id">
              <div class="form-group">
                <label class="control-label">Type</label>
                <textarea name="type_name" id="" cols="30" rows="2" class="form-control"></textarea>
              </div>
              <div class="form-group">
                <label class="control-label">Description</label>
                <textarea name="description" id="" cols="30" rows="2" class="form-control"></textarea>
              </div>



            </div>

            <div class="card-footer">
              <div class="row">
                <div class="col-md-12">
                  <button class="btn btn-primary col-sm-4"> Save</button>
                  <button class="btn btn-default col-sm-4" type="button" onclick="_reset()"> Cancel</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="col-md-8">
        <div class="card">
          <div class="card-body">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th class="text-center">Loan Type</th>
                  <th class="text-center">Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
								$i = 1;
								$types = $conn->query("SELECT * FROM loan_types order by id asc");
								while ($row = $types->fetch_assoc()) :
								?>
                <tr>
                  <td class="text-center"><?php echo $i++ ?></td>

                  <td class="">
                    <p>Type Name: <b><?php echo $row['type_name'] ?></b></p>
                    <p>Description: <b><?php echo $row['description'] ?></b></p>
                  </td>
                  <td class="text-center">
                    <button class="btn btn-primary edit_ltype" type="button" data-id="<?php echo $row['id'] ?>"
                      data-type_name="<?php echo $row['type_name'] ?>"
                      data-description="<?php echo $row['description'] ?>"><i class="fa fa-edit"></i></button>
                    <button class="btn  btn-danger delete_ltype" type="button" data-id="<?php echo $row['id'] ?>"><i
                        class="fa fa-trash"></i></button>
                  </td>
                </tr>
                <?php endwhile; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- Table Panel -->
    </div>
  </div>

</div>
<style>
td {
  vertical-align: middle !important;
}

td p {
  margin: unset
}
</style>
<script>
function _reset() {
  $('[name="id"]').val('');
  $('#manage-loan-type').get(0).reset();
}

$('#manage-loan-type').submit(function(e) {
  e.preventDefault()
  start_load()
  $.ajax({
    url: 'ajax.php?action=save_loan_type',
    data: new FormData($(this)[0]),
    cache: false,
    contentType: false,
    processData: false,
    method: 'POST',
    type: 'POST',
    success: function(resp) {
      if (resp == 1) {
        alert_toast("Data successfully added", 'success')
        setTimeout(function() {
          location.reload()
        }, 1500)

      } else if (resp == 2) {
        alert_toast("Data successfully updated", 'success')
        setTimeout(function() {
          location.reload()
        }, 1500)

      }
    }
  })
})
$('.edit_ltype').click(function() {
  start_load()
  var cat = $('#manage-loan-type')
  cat.get(0).reset()
  cat.find("[name='id']").val($(this).attr('data-id'))
  cat.find("[name='type_name']").val($(this).attr('data-type_name'))
  cat.find("[name='description']").val($(this).attr('data-description'))
  end_load()
})
$('.delete_ltype').click(function() {
  _conf("Are you sure to delete this Loan Type?", "delete_ltype", [$(this).attr('data-id')])
})

function displayImg(input, _this) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#cimg').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function delete_ltype($id) {
  start_load()
  $.ajax({
    url: 'ajax.php?action=delete_loan-type',
    method: 'POST',
    data: {
      id: $id
    },
    success: function(resp) {
      if (resp == 1) {
        alert_toast("Data successfully deleted", 'success')
        setTimeout(function() {
          location.reload()
        }, 1500)

      }
    }
  })
}
</script>