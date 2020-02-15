Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		$content:="<html><body>"+Form:C1466.item.Content+"</body></html>"
		WA SET PAGE CONTENT:C1037(*;"oWebArea";$content;"")
		
End case 