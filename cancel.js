function validateForm() {
  let x = document.forms["myForm"]["PNR"].value;
  var len=x.length;
  if(len!=5)
  {
	/*alert("PNR must be a 5 digit number");*/
	document.getElementById("alert").innerHTML="*PNR must be a 5 digit number";
	return false;
}
else{
	document.getElementById("alert").innerHTML="";
	return true;
}

}