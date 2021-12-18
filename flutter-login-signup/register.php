<?php
$db = mysqli_connect('localhost', 'root', '', 'db_muon');

if (!$db) {
  echo "Database Connection failed";
}

$fullname = $_POST['fullname'];
$email = $_POST['email'];
$password = $_POST['password'];
$password2 = $_POST['password2'];

if ($password != $password2) {
  echo json_encode("No Match");
  return false;
}

$sql = "SELECT * FROM tb_users WHERE fullname = '" . $fullname . "' AND email = '" . $email . "'";

$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
  echo json_encode("Error");
} else {
  $insert = "INSERT INTO tb_users(fullname,email,password)VALUE('" . $fullname . "', '" . $email . "','" . $password . "')";
  $query = mysqli_query($db, $insert);
  if ($query) {
    echo json_encode("success");
  }
}
