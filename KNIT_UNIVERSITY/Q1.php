<html>
<body>

<?php
		
	if($_SERVER["REQUEST_METHOD"]=="POST")
	{	

		$x=$_POST['one'];
		$y=$_POST['two'];
	
		$servername="sql205.epizy.com";
		$username="epiz_21457989";
		$password="dakkoo97";
		$dbname="epiz_21457989_Student";

		$conn=mysqli_connect($servername,$username,$password,$dbname);

		if(!$conn)
		{
			echo "error";
		}
		else
		{
		$sql="SELECT * FROM admin WHERE id='$x' AND password='$y' ";
		$res=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($res);
		if($rowcount>0)
		{
			$sql1="SELECT * FROM admission WHERE Jeescore>=150 AND 12th>=85";
			$sql2="SELECT * FROM admission WHERE Jeescore>=150 AND 12th<85";
			$sql3="SELECT * FROM admission WHERE Jeescore<150 AND 12th>=85";
			$sql4="SELECT * FROM admission WHERE Jeescore<150 AND 12th<85";
			
			$res1=mysqli_query($conn,$sql1);
			$rowcount1=mysqli_num_rows($res1);
			$res2=mysqli_query($conn,$sql2);
			$rowcount2=mysqli_num_rows($res2);
			
			$res3=mysqli_query($conn,$sql3);
			$rowcount3=mysqli_num_rows($res3);
			$res4=mysqli_query($conn,$sql4);
			$rowcount4=mysqli_num_rows($res4);
			$pr=($rowcount1*0.95)+($rowcount2*0.76)+($rowcount3*0.27)+($rowcount4*0.05);
			$pr1=($rowcount3*0.73)+($rowcount4*0.95)+($rowcount1*0.05)+($rowcount2*0.24);
			?>
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
			<script type="text/javascript">
			google.charts.load("current", {packages:["corechart"]});
			google.charts.setOnLoadCallback(drawChart4);
			function drawChart4() {
			var data = google.visualization.arrayToDataTable([
			['Branch','Min seats'],
			['CSE',<?=(int)$pr?>],
			['Electrical',<?=(int)$pr1?>]]);
          
			var options = {
			title: 'Seats College Must Have',
			legend: { position: 'none' },
			};

			var chart = new google.visualization.Histogram(document.getElementById('chart_div4'));
			chart.draw(data, options);
			}
			</script>
			
			<div id="chart_div4" style="width: 900px; height: 500px;"></div>
			<?php
		}
		else
		{
			echo "Invalid Login details";
		}
		}
		
	}

?>



</body>
</html>