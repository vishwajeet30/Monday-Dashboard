<%@ page language = "java" import = "java.sql.*, java.io.IOException, java.lang.*,java.text.*,java.util.*,java.awt.*,javax.naming.*,javax.sql.*"%>

<html>
<head>
	<title>Database</title>
	<!--loader-->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
			 #loading {
				 position: fixed;
				 display: block;
				 width: 100%;
				 height: 100%;	
				 }
	</style>
 <style type="text/css">
/* ------------- CSS Popup Image ------------- */
#thumbwrap {
width:100px;
height:100px;
}
.thumb {
float:left; /* must be floated for same cross browser position of larger image */
position:absolute;
margin:3px;
}
.thumb img {
border:1px solid #000;
vertical-align: text-top;
}
.thumb:hover {
border:0; /* IE6 needs this to show large image */
z-index:1;
}
.thumb span {
position:absolute;
visibility:hidden;
}
.thumb:hover span {
visibility:visible;
top:37px;
left:37px;
bottom: 300px;
}
</style> 
</head>
<script>
var prev_image = "";
    function image2(flighttest) 
    {   
        /*var values = str.split("-");
        if(values[1].length < 3)
        {
            if(values[1].length == 1)
                values[1] = "00" + values[1];
            if(values[1].length == 2)
                values[1] = "0" + values[1];
            str = values[0] + "-" + values[1];
        }*/
        
        if(prev_image != "")    {document.getElementById(prev_image).src = '';  document.getElementById(prev_image).alt='';}
        prev_image = flighttest;
        //alert('http://172.16.1.59:8888/Imm/apis_manifest/international_flights_jpeg/'+str+ '.jpg');
        ///usr/local/tomcat/webapps/Imm/misc_functionality_help/international_flights_jpeg
        //http://172.16.1.59:8888/Imm/apis_manifest/im_apis_status_html.jsp
        document.getElementById(flighttest).src='http://192.168.62.201:8889/Imm/vishwajeet/flight_pic.jpg';
        prev_image = flighttest;
        
    }
</script>
<script>

        
	function closeWindow() 
	{  
  		window.close();  
	}  
	function reset_Values() 
	{
		document.Departure_form.flight_number.value = "";
		document.Departure_form.source_port1.value = "";
		document.Departure_form.source_country1.value = "";
		document.Departure_form.dest_port1.value = "";
		document.Departure_form.dest_country1.value = "";

		document.Departure_form.source_port.value = "";
		document.Departure_form.source_country.value = "";	
		document.Departure_form.dest_port.value = "";	
		document.Departure_form.dest_country.value = "";	
	
		document.Departure_form.action = "im_flight_routes_dashboard_02_dep.jsp";
		document.Departure_form.submit();	
	}

	function letternumber(e, str)
		{
			var key;
			var keychar;
			if (window.event)
			   key = window.event.keyCode;
			else if (e)
			   key = e.which;
			else
			   return true;
			keychar = String.fromCharCode(key);
			keychar = keychar.toLowerCase();
			// control keys
			if ((key==null) || (key==0) || (key==8) || 
				(key==9) || (key==13) || (key==27) )
			   return true;
			// alphas and numbers
			else if ((str.indexOf(keychar) > -1))
			   return true;
			else
			   return false;
		}

		function filtery(pattern, list){
         
		  /*

		  if the dropdown list passed in hasn't

		  already been backed up, we'll do that now

		  */

		  if (!list.bak){

			/*

			We're going to attach an array to the select object

			where we'll keep a backup of the original dropdown list

			*/

			list.bak = new Array();

			for (n=0;n<list.length;n++){

			  list.bak[list.bak.length] = new Array(list[n].value, list[n].text);

			}

		  }

		  /*

		  We're going to iterate through the backed up dropdown

		  list. If an item matches, it is added to the list of

		  matches. If not, then it is added to the list of non matches.

		  */

		  match = new Array();

		  nomatch = new Array();

		  for (n=0;n<list.bak.length;n++){

			if(list.bak[n][1].toLowerCase().indexOf(pattern.toLowerCase())!=-1){

			  match[match.length] = new Array(list.bak[n][0], list.bak[n][1]);//value found
			}else{

			  nomatch[nomatch.length] = new Array(list.bak[n][0], list.bak[n][1]);

			}

		  }

		  /*

		  Now we completely rewrite the dropdown list.

		  First we write in the matches, then we write

		  in the non matches

		  */

		  for (n=0;n<match.length;n++){

			list[n].value = match[n][0];

			list[n].text = match[n][1];

		  }

		  for (n=0;n<nomatch.length;n++){

			list[n+match.length].value = nomatch[n][0];

			list[n+match.length].text = nomatch[n][1];

		  }

		  /*

		  Finally, we make the 1st item selected - this

		  makes sure that the matching options are

		  immediately apparent

		  */

		  list.selectedIndex=0;

		}
</script>

<script>

////////////////////////////////////////////////// Cursor Code ////////////////////////////////////////////////////////////////////////////

function SetCursor()
		{
			var tDate = new Date(); 
			var yy1 = tDate.getFullYear();
			var mm1 = tDate.getMonth();
			var dd1 = tDate.getDate();
			var hh1 = tDate.getHours();
			var hh2 = tDate.getHours();
			var mm2 = tDate.getMinutes();
			var ss1 = tDate.getSeconds();
			var nDate = new Date(yy1, mm1, dd1, hh1, mm2,ss1); 
			var sDate = new Date(yy1, mm1, dd1-7, hh1, mm2,ss1); 

			tDate =  ('0' + tDate.getDate()).substring(('0' + tDate.getDate()).length-2) + "/" +  ('0' + (tDate.getMonth()+1)).substring(('0' + (tDate.getMonth()+1)).length-2) + "/" + tDate.getFullYear();

			nDate =  ('0' + nDate.getDate()).substring(('0' + nDate.getDate()).length-2) + "/" +  ('0' + (nDate.getMonth()+1)).substring(('0' + (nDate.getMonth()+1)).length-2) + "/" + nDate.getFullYear();

			sDate =  ('0' + sDate.getDate()).substring(('0' + sDate.getDate()).length-2) + "/" +  ('0' + (sDate.getMonth()+1)).substring(('0' + (sDate.getMonth()+1)).length-2) + "/" + sDate.getFullYear(); //one week before date
	
			
		}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////// Below are the list of the Function requred to enable the loading division and the timer... /////////////////////////////////////////////////

	function parent_disable(){
		if(window && !window.closed)
			window.focus();
	}
	


/////////////// Below are the list of the Function requred to enable the loading division and the timer/////////////////////////////////////////////////

	function enableTimer()
	{
			document.getElementById("loading").style.display='none';
			document.clkfrm.stop_timer.value = "0";
			SetCursor();
	}
			
	var TotalSeconds;
	function CreateTimer(Time) 
	{
		TotalSeconds = Time;
		UpdateTimer();
		window.setTimeout("Tick()", 1000);
	}

	function Tick() 
	{
		if(document.clkfrm.stop_timer.value == "0") return;
		TotalSeconds += 1;
		UpdateTimer();
		window.setTimeout("Tick()", 1000);
	}

	function LeadingZero(Time) 
	{
		return (Time < 10) ? "0" + Time : + Time;
	}

	function UpdateTimer() 
	{
		
		var Seconds = TotalSeconds;
		var Days = Math.floor(Seconds / 86400);
		Seconds -= Days * 86400;

		var Hours = Math.floor(Seconds / 3600);
		Seconds -= Hours * (3600);

		var Minutes = Math.floor(Seconds / 60);
		Seconds -= Minutes * (60);

		var TimeStr = ((Days > 0) ? Days + " days " : "") + LeadingZero(Hours) + ":" + LeadingZero(Minutes) + ":" + LeadingZero(Seconds)

		digclock = "<font face='Verdana' size='2' color='#FF0000'><b>Timer :- " + TimeStr + "</b></font>";
      Clock.innerHTML = digclock;
			
			
		/*if (document.layers)
		{	
			document.layers.Clock.document.write(digclock);
			document.layers.Clock.document.close();
		}
		else if (document.all) {	
			
			Clock.innerHTML = digclock;
		}*/
	}
///////////////////////////////////////////////////////////////////////////////////////////////////



</script>


<!--http://192.168.62.201:8889/Imm/vishwajeet/im_flight_routes_dashboard_00.jsp-->
<body onload="enableTimer();" onclick = "parent_disable();" onFocus = "parent_disable();" style="background-color:#f5f9ff;">
<!--20/09/2022 use for loader-->
<form name="clkfrm" method="post">
	<input type="hidden" name="stop_timer" value="1">
	<SPAN id="Clock" style="position:absolute;left:15px;top:5px;width:250px;height:50px;"></span>
</form>

<script>
	CreateTimer(0);
</script>
<% String heading = "International Flights Departing from India"; %>
<br>
<div id="loading" name="loading/" style="background-color: #f5f9ff; ">
	<br><br>
	<br><br><CENTER><font face="verdana" color="blue" size="3"><b><%=heading%></b></font></CENTER><br>
	<CENTER><IMG SRC="loading5.gif" HSPACE="0" VSPACE="0" BORDER="0" NAME="ProgBar" ALT="Generating Results, Please Wait...">
	</CENTER><BR><BR><br>
	<CENTER><font face="verdana" color="DarkGreen"><H2 ><i>Generating Results, Please Wait......</i></H2></font></CENTER><br><br>
</div>
<!--<body style="background-color: #e5f6ff; "> -->	
			
<h1 style="font-family: Arial;background-color: #D0DDEA; color: #347FAA; "><center>International Flights Departing from India</center></h1><br>
<%


String flight_no = request.getParameter("flight_number") == null ? "" : request.getParameter("flight_number");
String from_carrier_pg = request.getParameter("from_carrier_pg") == null ? "N" : request.getParameter("from_carrier_pg");
String source_port = request.getParameter("source_port") == null ? "" : request.getParameter("source_port");
String dest_port = request.getParameter("dest_port") == null ? "" : request.getParameter("dest_port");
String source_country = request.getParameter("source_country") == null ? "" : request.getParameter("source_country");
String dest_country = request.getParameter("dest_country") == null ? "" : request.getParameter("dest_country");
	
	Context ctx = null;
	Connection con = null;

	ctx = new InitialContext();
	Context envCtx = (Context)ctx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/im_pax_flights");
	con = ds.getConnection();

			PreparedStatement psTemp = null;
			PreparedStatement psMain = null;
			ResultSet rsMain = null;
			ResultSet rsTemp = null;

%>
<form action="" method="post" name="Departure_form">
<table align="center" width="100%" border="0" cellspacing="0" cellpadding="2" bordercolorlight="#FF99CC" 
	bodercolordark="#FF99CC" bodercolor="#FF99CC" style="border-collapse: collapse;background-color: #067c94; font-family: verdana;font-size: 10pt; font-weight: bold;color:white;">
	<tr>
		<td>Flight No.</td><td>Source Port</td><td>Source Country</td><td>Destination Port</td><td colspan="2">Destination Country</td>
	</tr>						
	<tr>
		<td>
			<input height="40" type="text" size="10" value="<%=flight_no%>" maxlength="10" name="flight_number" style="font-weight:bold; height: 22px; font-size=12pt;text-transform:uppercase;font-family:Verdana"  onKeyDown="if(event.keyCode==13) event.keyCode=9;if (event.keyCode==8) event.keyCode=37+46;" onKeyPress="return letternumber(event, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-0123456789')"/>
		</td>
				
		<td>
			<input type="text" style="color:white;background-color: #007d79;font-weight:bold;height: 22px;font-size=12pt;text-transform:uppercase;font-family:Verdana" size="3" maxlength="10" name="source_port1" onkeyup="filtery(this.value,this.form.source_port)" onchange="filtery(this.value,this.form.source_port)" onKeyDown="if(event.keyCode==13) event.keyCode=9;if (event.keyCode==8) event.keyCode=37+46;" onKeyPress="return letternumber(event, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')">

		<select name="source_port" style="width:100px;font-family: courier;font-size: 14px;color: blue; font-weight:bold;">
		<option value="" selected>Select</option>
   	    <% 
	 try
		{				
			 psTemp = con.prepareStatement("select port_code,port_desc from im_apis_airports where country_srno = '60' order by port_desc");
	         rsTemp = psTemp.executeQuery(); 
			 while(rsTemp.next())
			 {
			
				%>
			 <option value="<%=rsTemp.getString("port_code")%>" <%if(source_port.equals(rsTemp.getString("port_code"))){%>selected<%}%> ><%=rsTemp.getString("port_code")+" - "+rsTemp.getString("port_desc")%></option>
			 <%
			
			 }
			 rsTemp.close();
			 psTemp.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		 %>
 		</select>
		</td>

	<td>
		<input type="text" style="color:white;background-color: #007d79;height: 22px;font-weight:bold;font-size=12pt;text-transform:uppercase;font-family:Verdana" size="3" maxlength="10" name="source_country1" onkeyup="filtery(this.value,this.form.source_country)" onchange="filtery(this.value,this.form.source_country)" onKeyDown="if(event.keyCode==13) event.keyCode=9;if (event.keyCode==8) event.keyCode=37+46;" onKeyPress="return letternumber(event, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')">

		<select name="source_country" style="width:100px;font-family: courier;font-size: 14px;color: blue; font-weight:bold;">

		<option value="" selected>Select</option>
	    <% 

	 try
		{				 
		 psTemp = con.prepareStatement("select COUNTRY_CODE,COUNTRY_DESC from IM_COUNTRY where COUNTRY_CODE = 'IND'order by COUNTRY_CODE asc");
	     rsTemp = psTemp.executeQuery(); 
		 while(rsTemp.next())
		 {				
			%>
		 <option value="<%=rsTemp.getString("COUNTRY_CODE")%>" <%if(source_country.equals(rsTemp.getString("COUNTRY_CODE"))){%>selected<%}%> ><%=rsTemp.getString("COUNTRY_CODE")+" - "+rsTemp.getString("COUNTRY_DESC")%></option>
		 <%				
		 }
		 rsTemp.close();
		 psTemp.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		 %>
	 </select>
	</td>



	<td>
		<input type="text" style="color:white;background-color: #007d79;height: 22px;font-weight:bold;font-size=12pt;text-transform:uppercase;font-family:Verdana" size="3" maxlength="10" name="dest_port1" onkeyup="filtery(this.value,this.form.dest_port)" onchange="filtery(this.value,this.form.dest_port)" onKeyDown="if(event.keyCode==13) event.keyCode=9;if (event.keyCode==8) event.keyCode=37+46;" onKeyPress="return letternumber(event, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')">
		<select name="dest_port" style="width:100px;font-family: courier;font-size: 14px;color: blue; font-weight:bold;">
   		<option value="" selected>Select</option>
   	    <% 
	 try
		{				
		 
		 psTemp = con.prepareStatement("select port_code,port_desc from im_apis_airports where country_srno <> '60' order by port_desc");
         rsTemp = psTemp.executeQuery(); 
		 while(rsTemp.next())
		 {		
			%>
		 <option value="<%=rsTemp.getString("port_code")%>" <%if(dest_port.equals(rsTemp.getString("port_code"))){%>selected<%}%> ><%=rsTemp.getString("port_code")+" - "+rsTemp.getString("port_desc")%></option>
		 <%		
		 }
		 rsTemp.close();
		 psTemp.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		 %>
		 </select>
	</td>
	<td>
		<input type="text" style="color:white;background-color: #007d79;height: 22px;font-weight:bold;font-size=12pt;text-transform:uppercase;font-family:Verdana" size="3" maxlength="10" name="dest_country1" onkeyup="filtery(this.value,this.form.dest_country)" onchange="filtery(this.value,this.form.dest_country)" onKeyDown="if(event.keyCode==13) event.keyCode=9;if (event.keyCode==8) event.keyCode=37+46;" onKeyPress="return letternumber(event, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')">
		<select name="dest_country" style="width:100px;font-family: courier;font-size: 14px;color: blue; font-weight:bold;">
		 <option value="" selected>Select</option>
		 <%
			
		try
		{			 
			 psTemp = con.prepareStatement("select COUNTRY_CODE,COUNTRY_DESC from IM_COUNTRY order by COUNTRY_CODE asc");
             rsTemp = psTemp.executeQuery(); 
			 while(rsTemp.next())
			 {
			
			 %>
			 <option value="<%=rsTemp.getString("COUNTRY_CODE")%>" <%if(dest_country.equals(rsTemp.getString("COUNTRY_CODE"))){%>selected<%}%> ><%=rsTemp.getString("COUNTRY_CODE")+" - "+rsTemp.getString("COUNTRY_DESC")%></option>
			 <%
			 }
			 rsTemp.close();
			 psTemp.close();
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			 %>
			</select>
		</td>
		<td>
			<button type="submit" value="Submit" style="background-color: #004144;color: white;border: none;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;font-weight: bold; font-size: 14px; margin: 4px 2px; cursor: pointer;">Submit</button>

			 <button type="reset" value="reset" onclick="reset_Values();" style="background-color: #004144;color: white;font-weight: bold;font-size: 14px;
			   border: none;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;
			   font-size: 14px;margin: 4px 2px;cursor: pointer;">Reset</button>

			   <button type="close" value="close" onclick="closeWindow();" style="background-color: #004144;color: white;font-weight: bold;font-size: 14px;
			   border: none;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;
			   font-size: 14px;margin: 4px 2px;cursor: pointer;">Close</button> 
		</td>
	</tr>
	</table><br><br>		
		<%	
			////////////////////////////////////////////////////////// 	  	 Departure Arrival Main Table 		//////////////////////////////////////////////////////
			

StringBuilder selectQuery = new StringBuilder("");
String flightNumber1 = ""; String  sourcePort1 = "" ; String  destinationPort1 = "" ; String sourceCountryCode1 = ""; String  destinationCountryCode1 = "" ;
String flightNumber2 = ""; String  sourcePort2 = "" ; String  destinationPort2 = "" ; String sourceCountryCode2 = "";
String destinationCountryCode2 = "" ;

String dep_flt_no = "";
			
String selectSummary = "";
String total_Flights_By_Digits = "";
String bothIndiaFlights = "";

int arr_dep_matched_flts2 = 0;
int arr_dep_not_matched_flts2 = 0;
int arr_dep_not_defined_matched_flts2 = 0;

String QueryCount = "";

String totalflights= ""; String arrflights = ""; String depflights = ""; String neitherFlights = "";
String lblQuery = "";

	String sourcePortDesc1 = "";
	String destPortDesc1 = "";
	String sourceCountryDesc1 = "";
	String destCountryDesc1 = "";

	String sourcePortDesc2 = "";
	String destPortDesc2 = "";
	String sourceCountryDesc2 = "";
	String destCountryDesc2 = "";

try{

	selectQuery.append("SELECT * FROM IM_FLIGHT_ROUTES where SRC_COUNTRY_CODE = 'IND' and  DEST_COUNTRY_CODE <> 'IND'");
	if(!flight_no.equals("") && from_carrier_pg.equals("N")){
		selectQuery.append(" and FLIGHT_NO like '%"+flight_no.toUpperCase()+"%'");
		lblQuery = lblQuery + ", Flight No. = " + flight_no.toUpperCase();
	}
	if(from_carrier_pg.equals("Y")){
		selectQuery.append(" and FLIGHT_NO like '"+flight_no.toUpperCase()+"%'");
		lblQuery = lblQuery + ", Flight No. = " + flight_no.toUpperCase();
	}

	if(!source_port.equals("")){
		selectQuery.append(" and SRC_PORT_CODE = '"+source_port+"'");
		lblQuery = lblQuery + ", Source Port = " + source_port.toUpperCase();
	}
	if(!dest_port.equals("")){
		selectQuery.append(" and DEST_PORT_CODE = '"+dest_port+"'");
		lblQuery = lblQuery + ", Destination Port = " + dest_port.toUpperCase();
	}
	if(!source_country.equals("")){
		selectQuery.append(" and SRC_COUNTRY_CODE = '"+source_country+"'");
		lblQuery = lblQuery + ", Source Country = " + source_country.toUpperCase();
	}
	if(!dest_country.equals("")){
		selectQuery.append(" and DEST_COUNTRY_CODE = '"+dest_country+"'");
		lblQuery = lblQuery + ", Destination Country = " + dest_country.toUpperCase();
	}
	selectQuery.append(" order by FLIGHT_NO");

	if(lblQuery.length()>5) lblQuery = lblQuery.substring(2,lblQuery.length());

		lblQuery = "You queried for :  " + lblQuery;
		if(lblQuery.equals("You queried for :  ")) lblQuery = "";
	//out.println(lblQuery);

%><h3 style="font-family: Arial; color: #fa4d56; text-align: left;font-size: 12pt; background-color: #d0e2ff;"><%=lblQuery%></h3><%	

	psMain = con.prepareStatement(selectQuery.toString());	
	rsMain = psMain.executeQuery();		
		try
		{
			String CountQuery = "select count(1) from ("+ selectQuery.toString() +")";//out.println("<br>" + CountQuery);
			psTemp = con.prepareStatement(CountQuery);			
			rsTemp = psTemp.executeQuery();

			while(rsTemp.next())
			{
				QueryCount = rsTemp.getString(1);
			}
			rsTemp.close();
			psTemp.close();
			%><h3 style="font-family: Arial; color: darkgreen; text-align: right;font-size: 8pt;">Your Query yields <%=QueryCount%> Record(s)</h3><%
		}
		catch(Exception e){
			System.out.println("e.printStackTrace");
		}
		%>
			<table align="center" width="100%" border="1" cellspacing="0" cellpadding="8" bordercolorlight="#FF99CC" 
			bodercolordark="#FF99CC" bodercolor="#FF99CC" style="border-collapse: collapse;background-color: #FFFFFF; font-family: verdana;font-size: 8pt;text-align: left; border-color:#e5f6ff;">
				<tr style=" background-color: #78a9ff;font-family: Verdana; font-size: 15px; color:white;font-weight: bold;">
					<td rowspan="2" align="center" bgcolor="#0072c3"><center>S.No.</center></td>
					<td colspan="3" bgcolor="#a2191f"><center>Departure Flights</center></td>
					<td colspan="3" bgcolor="#005d5d"><center>Arrival Flights</center></td>
				</tr>
				<tr style=" background-color: #E6E6EA;font-family: Verdana; font-size: 15px; color:white;font-weight: bold;">					
					<th align="center" bgcolor="#da1e28">Flight No.</th>
					<th align="center" bgcolor="#da1e28">Source Port</th>
					<th align="center" bgcolor="#da1e28">Destination Port</th>
					<th align="center" bgcolor="#007d79">Flight No.</th>
					<th align="center" bgcolor="#007d79">Source Port</th>
					<th align="center" bgcolor="#007d79">Destination Port</th>
				</tr>
				<%
			int counter=0;
			arr_dep_matched_flts2 = 0;
			arr_dep_not_matched_flts2 = 0;
			arr_dep_not_defined_matched_flts2=0;
			while(rsMain.next())
			{
				flightNumber1 = rsMain.getString("FLIGHT_NO");
				sourcePort1 = rsMain.getString("SRC_PORT_CODE");
				destinationPort1 = rsMain.getString("DEST_PORT_CODE");
				sourceCountryCode1 = rsMain.getString("SRC_COUNTRY_CODE"); 
				destinationCountryCode1 = rsMain.getString("DEST_COUNTRY_CODE"); 
				//out.println("While 1");
				sourcePortDesc1 = rsMain.getString("SRC_PORT_DESC");
				sourceCountryDesc1 = rsMain.getString("SRC_COUNTRY_DESC");
				destPortDesc1 = rsMain.getString("DEST_PORT_DESC");
				destCountryDesc1 = rsMain.getString("DEST_COUNTRY_DESC");

		  %><tr>
				<td align= "center" bgcolor="#82cfff"><%=++counter%></td>
				<td align= "center" bgcolor="#ff8389"><a class="thumb" style="text-decoration:none" onmouseover='image2("<%=flightNumber1%>");' href="#">
				<span><img id="<%=flightNumber1%>"  style="float:left" alt="" src=""></span><%=flightNumber1%></a></td>
				<td align= "center" bgcolor="#ffb3b8"><%=sourcePort1%> (<%=sourceCountryCode1%>) - <%=sourcePortDesc1%> (<%=sourceCountryDesc1%>)</td>
				<td align= "center" bgcolor="#ffd7d9"><%=destinationPort1%> (<%=destinationCountryCode1%>) - <%=destPortDesc1%> (<%=destCountryDesc1%>)</td>											
			<%							
				String selectRevQuery = "";	
				//out.println("selectRevQuery11");
				//if(flightNumber1.contains("-") && flightNumber1.split("-")[1].contains("[0-9]+"))
				if(flightNumber1.contains("-"))
				if(!flightNumber1.split("-")[1].matches("[0-9]+"))
					{	
			%>	
				<td align= "center" bgcolor="#08bdba">##</td>
				<td align= "center" bgcolor="#3ddbd9">##</td>
				<td align= "center" bgcolor="#9ef0f0">##</td>
			</tr>	
			<%
					++arr_dep_not_defined_matched_flts2;
					continue;
					}

				if(flightNumber1.length() == 6)
					dep_flt_no = flightNumber1.substring(0,3) + String.valueOf(Integer.parseInt(flightNumber1.substring(3,6)) + 1);
				else if(flightNumber1.length() == 7)
					dep_flt_no = flightNumber1.substring(0,3) + String.valueOf(Integer.parseInt(flightNumber1.substring(3,7)) + 1);
				else
					dep_flt_no = "Error";
				//out.println(flightNumber1 + "    " + dep_flt_no + "<BR>");

/*Note*/		selectRevQuery = "SELECT * FROM IM_FLIGHT_ROUTES WHERE FLIGHT_NO = '" + dep_flt_no + "' and SRC_COUNTRY_CODE <>'IND'";
				//out.println("selectRevQuery22 Done");									
				psTemp = con.prepareStatement(selectRevQuery);					
				rsTemp = psTemp.executeQuery();
				//out.println("selectRevQuery");

				if(rsTemp.next())  
					{
						++arr_dep_matched_flts2;										

						flightNumber2 = rsTemp.getString("FLIGHT_NO") == null ? "" : rsTemp.getString("FLIGHT_NO");
						destinationPort2 = rsTemp.getString("DEST_PORT_CODE") == null ? "" : rsTemp.getString("DEST_PORT_CODE");
						sourcePort2 = rsTemp.getString("SRC_PORT_CODE")== null ? "" : rsTemp.getString("SRC_PORT_CODE");
						sourceCountryCode2 = rsTemp.getString("SRC_COUNTRY_CODE")== null ? "" : rsTemp.getString("SRC_COUNTRY_CODE");
						destinationCountryCode2 = rsTemp.getString("DEST_COUNTRY_CODE")== null ? "" : rsTemp.getString("DEST_COUNTRY_CODE");
						//out.println("While 2");
						sourcePortDesc2 = rsTemp.getString("SRC_PORT_DESC");
					sourceCountryDesc2 = rsTemp.getString("SRC_COUNTRY_DESC");
					destPortDesc2 = rsTemp.getString("DEST_PORT_DESC");
					destCountryDesc2 = rsTemp.getString("DEST_COUNTRY_DESC");
						%>	
							<td align= "center" bgcolor="#08bdba"><a class="thumb" style="text-decoration:none" onmouseover='image2("<%=flightNumber2%>");' href="#">
				<span><img id="<%=flightNumber2%>"  style="float:left" alt="" src=""></span><%=flightNumber2%></a></td>
							<td align= "center" bgcolor="#3ddbd9"><%=sourcePort2%> (<%=sourceCountryCode2%>) - <%=sourcePortDesc2%> (<%=sourceCountryDesc2%>)</td>
							<td align= "center" bgcolor="#9ef0f0"><%=destinationPort2%> (<%=destinationCountryCode2%>) -  <%=destPortDesc2%> (<%=destCountryDesc2%>)</td>
						</tr>
						<%
					}
					else
					{
						++arr_dep_not_matched_flts2;
					%>	
						<td align= "center" bgcolor="#08bdba">&nbsp;</td>
						<td align= "center" bgcolor="#3ddbd9">&nbsp;</td>
						<td align= "center" bgcolor="#9ef0f0">&nbsp;</td>
					</tr>
				   <%
					}		
					rsTemp.close();
					psTemp.close();						
				}	
					rsMain.close();
					psMain.close();

			if(counter == 0)
				{
					%>
					<tr  style="background-color: #f6f2ff; font-family: Verdana; font-size: 25px; color:#a2191f;font-weight: bold;">
						<td colspan="7" align="center"><br><br><p>!!! Your search returns no result !!!<br><br><br><br><p></td>	
					</tr>
					
					<%
				}
			}
				catch(Exception e)
				{
					System.out.println("Main Table Exception");
				}

	finally
	{
		try
		{
			if(con != null)
			{
				con.close();
			}
			if(ctx != null)
			{
				ctx.close();
			}
		}
		catch(Exception e)
		{
			//out.println(e.getMessage());
		}
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////						
					%>
				<tr style=" background-color: #78a9ff;font-family: Verdana; font-size: 12px; color:white;font-weight: bold;">								
							<td colspan="8" bgcolor="#a2191f"><center>End Of Report</center></td>								
				</tr>
			</table><br><p>
			<table align="center" width="70%" border="1" cellspacing="0" cellpadding="8" bordercolorlight="#FF99CC" bodercolordark="#FF99CC" bodercolor="#FF99CC" style="border-collapse: collapse;background-color: #FFFFFF; font-family: verdana;font-size: 8pt;text-align: left; border-color:#e5f6ff;">
				<tr style=" background-color: #E6E6EA;font-family: Verdana; font-size: 15px; color:white;font-weight: bold;">					
					<td bgcolor="#df979e"><center>Matching Departure and Arrival</font></center></td>
					<td bgcolor="#d7658b"><center>Matching Arrival not available</center></td>
					<td bgcolor="#c80064"><center>Not Defined Arrival and Departure</center></td>
				</tr>
				<tr style="font-family: Verdana; font-size: 10pt; color:white;font-weight: bold">
					<td bgcolor="#df979e"><center><%=arr_dep_matched_flts2%></center></td>
					<td bgcolor="#d7658b"><center><%=arr_dep_not_matched_flts2%></center></td>
					<td bgcolor="#c80064"><center><%=arr_dep_not_defined_matched_flts2%></center></td>					
				</tr>
			</table><br><p><p>
		</form>										
</body>

</html>