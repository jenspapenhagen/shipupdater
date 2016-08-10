<?php
//http://gpso.de/maps/
include_once "content/contentHandler.php";
$contentHandler = new contentHandler();
$contentHandler->getNewXML();

if(isset($_GET["update"]) and $_GET["update"] == 1){
    $contentHandler->UPDATE();
    $contentHandler->getNewXML();
    echo "Update done";
}
if(isset($_REQUEST['callback']) and $_REQUEST['callback'] == "?"){
		header('Content-Type: text/javascript');
		echo "callback (" ;
		include_once "content.json" 
		echo ");";
}else{
    echo "<a href=\"?update=1\">Update</a> ";
	die();
}

?>