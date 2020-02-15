//%attributes = {}
C_OBJECT:C1216($feed;$0;$item)
C_TEXT:C284($1;$httpResponse;$value;$cdata;$xmlContent;$xmlTitle;$xmlDate)
C_LONGINT:C283($count;$i)
C_COLLECTION:C1488($feedItems)

$httpResponse:=$1

$feed:=New object:C1471("error";0)

$xmlRoot:=DOM Parse XML variable:C720($httpResponse)


$xmlTitle:=DOM Get XML element:C725($xmlRoot;"title";1;$value)
$feed.title:=$value

$feedItems:=New collection:C1472

$count:=DOM Count XML elements:C726($xmlRoot;"entry")

For ($i;1;$count)
	$xmlEntry:=DOM Get XML element:C725($xmlRoot;"entry";$i;$value)
	$item:=New object:C1471()
	$xmlTitle:=DOM Get XML element:C725($xmlEntry;"title";1;$value)
	$item.Title:=$value
	$xmlDate:=DOM Get XML element:C725($xmlEntry;"published";1;$value)
	$datum:=Date:C102($value)
	$item.Date:=$datum
	
	$xmlContent:=DOM Get XML element:C725($xmlEntry;"content";1;$value)
	DOM GET XML ELEMENT VALUE:C731($xmlContent;$value;$cdata)
	$item.Content:=$cdata
	
	
	$feedItems.push($item)
End for 


$feed.feedItems:=$feedItems

$0:=$feed