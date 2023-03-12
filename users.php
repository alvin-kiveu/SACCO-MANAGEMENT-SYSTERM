<div class="container-fluid">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header">
        <large class="card-title">
          <b>Users</b>
        </large>
        <button class="btn btn-primary float-right" id="new_user"><i class="fa fa-plus"></i> New user</button>
      </div>
      <div class="card-body">
        <table class="table-striped table-bordered col-md-12">
          <thead>
            <tr>
              <th class="text-center">#</th>
              <th class="text-center">Name</th>
              <th class="text-center">Username</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
						include 'db_connect.php';
						$users = $conn->query("SELECT * FROM users order by name asc");
						$i = 1;
						while ($row = $users->fetch_assoc()) :
						?>
            <tr>
              <td>
                <?php echo $i++ ?>
              </td>
              <td>
                <?php echo $row['name'] ?>
              </td>
              <td>
                <?php echo $row['username'] ?>
              </td>
              <td class='d-flex justify-content-center'>
                      <a style='color:green; font-weight: 600;' class="dropdown-item edit_user" href="javascript:void(0)"
                        data-id='<?php echo $row['id'] ?>'>Edit</a> 
                      <a style='color:red; font-weight: 600;' class="dropdown-item delete_user" href="javascript:void(0)"
                        data-id='<?php echo $row['id'] ?>'>Delete</a>
              </td>
            </tr>
            <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>
<script>
$('#new_user').click(function() {
  uni_modal('New User', 'manage_user.php')
})
$('.edit_user').click(function() {
  uni_modal('Edit User', 'manage_user.php?id=' + $(this).attr('data-id'))
})
$('.delete_user').click(function() {
  _conf("Are you sure to delete this user?", "delete_user", [$(this).attr('data-id')])
})

function delete_user($id) {
  start_load()
  $.ajax({
    url: 'ajax.php?action=delete_user',
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