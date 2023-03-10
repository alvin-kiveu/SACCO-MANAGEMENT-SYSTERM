<?php 

$conn= new mysqli('localhost','root','','newsacco')or die("Could not connect to mysql".mysqli_error($con));
//CONNECT TO DATABASE
$db = mysqli_connect('localhost','root','','newsacco') or die("Could not connect to database");