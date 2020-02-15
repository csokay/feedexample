//%attributes = {}
C_TEXT:C284($url;$httpResponse)
C_LONGINT:C283($httpCode)
C_OBJECT:C1216($feed)
$url:=Form:C1466.FeedURL

ON ERR CALL:C155("ErrorMethod")
$httpCode:=HTTP Get:C1157($url;$httpResponse)
ON ERR CALL:C155()
If ($httpCode=200)
	$feed:=ParseRSS ($httpResponse)
	
	Form:C1466.feedTitle:=$feed.title
	Form:C1466.feedItems:=$feed.feedItems
	
Else 
	ALERT:C41("Response with HTTP Code "+String:C10($httpCode))
	
End if 
