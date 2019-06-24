<?php
  require_once('requires/config.php');?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Scott Test :: User's Teams Data</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="vendor/twbs/bootstrap/dist/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <h1>Scott Test / User's Teams Data</h1>
<?php

  $query = "SELECT `users`.`id`, concat(`users`.`first_name`, ' ', `users`.`last_name`) AS `user`, group_concat(' ', `teams`.`name`) AS `teams`
            FROM `users`
            JOIN `teams_users` ON `users`.`id` = `teams_users`.`user_id`
            JOIN `teams` ON `teams`.`id` = `teams_users`.`team_id`
            GROUP BY `users`.`id`
            ORDER BY `users`.`id`, `teams`.`name` ASC ";

  $result = $con->query($query);

  if ($result->num_rows) {?>
    <table id="users-teams" class="table table-striped table-bordered" style="width:100%">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Teams</th>
        </tr>
      </thead>
      <tbody>
<?php
    while ($row = $result->fetch_assoc()) {?>
        <tr>
          <td><?php echo $row["id"];?></td>
          <td><?php echo $row["user"];?></td>
          <td><?php echo $row["teams"];?></td>
        </tr>
<?php
      }

      $result->free();?>
      </tbody>
    </table>
<?php
  } else {?>
    <div class="alert alert-danger" role="alert">Ops, no data found!</div>
<?php
  }?>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="vendor/twbs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/JavaScript">
      $(document).ready(function() {
        $('#users-teams').DataTable();
      } );
    </script>
  </body>
</html>