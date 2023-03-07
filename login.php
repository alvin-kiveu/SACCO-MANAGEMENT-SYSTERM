<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>SACCO APPLICATION</title>
  <?php include('./header.php'); ?>
  <?php include('./db_connect.php'); ?>
  <?php
  session_start();
  if (isset($_SESSION['login_id']))
    header("location:index.php?page=home");

  ?>
</head>
<style>
body {
  width: 100%;
  height: 100vh;
}

main#main {
  width: 100%;
  height: calc(100%);
  background-color: white;
  background-repeat: no-repeat;
  background-size: cover;

}

#login-right {
  position: absolute;
  left: 0;
  width: 30%;
  height: calc(100%);
  /*background:white;*/
  display: flex;
  align-items: center;
}



#login-right .card {
  margin: auto;
  z-index: 1
}

.logo {
  margin: auto;
  font-size: 8rem;
  background: white;
  /*padding: 0 0.7em;*/
  border-radius: 50% 50%;
  color: #000000b3;
  z-index: 10;
  text-align: center;
}

div#login-right::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: calc(100%);
  height: calc(100%);

}
</style>

<body>


  <main id="main" class=" bg-light">
    <div id="#" class="container h-100 w-50 d-flex align-items-center justify-content-center">
      <div class="card col-md-10">
        <div class="card-body">
          <div class="logo">
            <img src="assets/img/logo.png" style="border-radius:50%;" width="200px">
          </div>
          <hr/>
          <form id="login-form">
            <div class="form-group">
              <label for="username" class="control-label">Username</label>
              <input type="text" id="username" name="username" placeholder="Enter Username" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="password" class="control-label">Password</label>
              <input type="password" id="password" name="password" placeholder="Enter your password" class="form-control" required>
            </div>
            <center><button class="btn btn-wave col-md-12 btn-primary">Login</button></center>
            <br>

          </form>
        </div>
      </div>
    </div>

  </main>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>



</body>
<script>
$('#login-form').submit(function(e) {
  e.preventDefault()
  $('#login-form button[type="button"]').attr('disabled', true).html('Logging in...');
  if ($(this).find('.alert-danger').length > 0)
    $(this).find('.alert-danger').remove();
  $.ajax({
    url: 'ajax.php?action=login',
    method: 'POST',
    data: $(this).serialize(),
    error: err => {
      console.log(err)
      $('#login-form button[type="button"]').removeAttr('disabled').html('Login');

    },
    success: function(resp) {
      if (resp == 1) {
        location.href = 'index.php?page=home';
      } else if (resp == 2) {
        location.href = 'voting.php';
      } else {
        $('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
        $('#login-form button[type="button"]').removeAttr('disabled').html('Login');
      }
    }
  })
})
</script>

</html>