# src/mysql.php
<?php
$hostname	= "mysql";
$dbname		= "helloworld";
$username	= "root";
$password	= "admin";

try {

	// $conn = new PDO( "mysql:host=$hostname;dbname=$dbname", $username, $password );

	// Configure PDO error mode
	// $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$conn = new mysqli($hostname, $username, $password, $dbname);

	if ($conn -> connect_errno) {
		echo "Failed to connect to MySQL" . $conn -> connect_error;
	}
	else{
		echo "SQL DB Connected successfully";

		$sql = "INSERT INTO myguest (firstname) VALUES ('devi')";

		if ($conn -> query($sql) === TRUE) {
  			echo "New record created successfully";
		} else {
  			echo "Error: " . $sql . "<br>" . $conn->error;
		}

		$conn->close();

	}

}
catch( PDOException $e ) {

	echo "Failed to connect: " . $e->getMessage();
}

// Perform database operations

// Close the connection
$conn = null;
