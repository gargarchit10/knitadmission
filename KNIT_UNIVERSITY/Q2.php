<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Branch','% of students opted'],
          ['CSE', 95],
          ['Electrical', 5]]);
          
        var options = {
          title: 'Past Students Admission Decisions according to your score',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
	  
	  google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart1);
      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['Branch','% of students opted'],
          ['CSE', 76],
          ['Electrical', 24]]);
          
        var options = {
          title: 'Past Students Admission Decisions according to your score',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div1'));
        chart.draw(data, options);
      }
	  
	  google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Branch','% of students opted'],
          ['CSE', 27],
          ['Electrical', 73]]);
          
        var options = {
          title: 'Past Students Admission Decisions according to your score',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
	  
	  google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart3);
      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['Branch','% of students opted'],
          ['CSE', 5],
          ['Electrical', 95]]);
          
        var options = {
          title: 'Past Students Admission Decisions according to your score',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div3'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    

<?php


		
	if($_SERVER["REQUEST_METHOD"]=="POST")
	{	

		$x=$_POST['na'];
		$y=$_POST['JEE'];
		$z=$_POST['twelth'];
	
		$servername="sql205.epizy.com";
		$username="epiz_21457989";
		$password="dakkoo97";
		$dbname="epiz_21457989_Student";

		$conn=mysqli_connect($servername,$username,$password,$dbname);

		
		if($y>=150 && $z>=85)
		{
			?>
			
<div id="chart_div" style="width: 900px; height: 500px;"></div>

<?php 
		}
		else if($y>=150 && $z<85)
		{
			?>
			
<div id="chart_div1" style="width: 900px; height: 500px;"></div>
<?php
			
		}
		else if($y<150 && $z>=85)
		{
			?>
			<div id="chart_div2" style="width: 900px; height: 500px;"></div>
<?php
		}
		else if($y<150 && $z<85)
		{
			?>
			
			<div id="chart_div3" style="width: 900px; height: 500px;"></div>
<?php
		}

		$sql="INSERT INTO admission VALUES('$x',$y,$z)";
		$res=mysqli_query($conn,$sql);
		

}
?>

</body> 
</html>
