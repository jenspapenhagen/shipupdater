<?php
include_once "content/pip.php";
include_once "content/curlWebsite.php";

class contentHandler{
    private $pointLocation;
    private $curlWebsite;
	
    //construct
    function contentHandler(){
        $this->pointLocation = new pointLocation();
		$this->curlWebsite = new curlWebsite();
    }
    
    function bereich($punkt){
        //areas of intesse:
        $SaureBeladestelle = array("53.50902 10.05783","53.50895 10.06067","53.50594 10.05642","53.50586 10.06028");
   
        $output = "";
        if($this->pointLocation->pointInPolygon($punkt, $SaureBeladestelle) == "inside"){
            $output = "SaeureBeladestelle";
        }
    
        return $output;
    }

    function UPDATE(){
        $xmlfile = "content/ships.xml";
        $xmlload = file_get_contents($xmlfile);
        $xml = simplexml_load_string($xmlload);

        foreach( $xml->xpath( '//ship') as $ship) {
            $url = $ship->url;
            $shortname = $ship->shortname;
            $delfile = "content/".$shortname.".txt";
            if(file_exists($delfile) and filemtime($delfile) < (time() - 300 ) ){
                unlink($delfile);
                $this->curlWebsite($url, $shortname);
                $output = "Updated";
            }else{
                $output = "Update only every 5min";
            }
        }
        return $output;
    }
    
    function get_linenumber_form_file($file, $search){
        $line_number = false;
    
        if ($handle = fopen($file, "r")) {
            $count = 0;
            while (($line = fgets($handle, 4096)) !== FALSE and !$line_number) {
                $count++;
                if(strpos($line, $search) !== FALSE){
                    $line_number = $count;
                }else{
                    $line_number = $line_number;
                }
            }
            fclose($handle);
        }
    
        return $line_number;
    }
    
    function after($da, $inthat){
        if (!is_bool(strpos($inthat, $da))){
            $output = substr($inthat, strpos($inthat,$da)+strlen($da));
        }
        return $output;
    }
    
    function before ($da, $inthat){
        $output = substr($inthat, 0, strpos($inthat, $da));
    
        return $output;
    }
    
    function getStatus($ship){
        $file = "content/".$ship.".txt";
        $statuslinenumber = $this->get_linenumber_form_file($file, "<span>Status:</span>");
        //file in to an array
        $lines = file($file);
        $output = $lines[$statuslinenumber];
        $output = strip_tags($output);//remove HTML crap
        $output = trim($output);
    
        return $output;
    }
    
    
    function lastStatus($ship){
        $file = "content/".$ship.".txt";
        $statuslinenumber = $this->get_linenumber_form_file($file, "<span>Information empfangen: </span>");
        if(empty($statuslinenumber)){
            $statuslinenumber = $this->get_linenumber_form_file($file, "<span>Info Received: </span>");
        }
        //file in to an array
        $lines = file($file);
        $output = $lines[$statuslinenumber];
        $output = strip_tags($output);//remove HTML crap
        $output = trim($output);
    
        return $output;
    }
    
    function getLatLon($ship){
        $file = "content/".$ship.".txt";
        $statuslinenumber = $this->get_linenumber_form_file($file, "<span>Breite/Länge: </span>");
        if(empty($statuslinenumber)){
            $statuslinenumber = $this->get_linenumber_form_file($file, "<span>Latitude / Longitude: </span>");
        }
        //file in to an array
        $lines = file($file);
        $output = $lines[$statuslinenumber];
    
        //get lat and lon
        $filter = $this->after("\">", $output);
        $filter = $this->before("&deg;</a>", $filter);
        (string) $filter = str_replace("&deg;","",$filter);
        $filter = explode(" / ", $filter);
    
        $filter['lat'] = $filter[0];
        $filter['lon'] = $filter[1];
    
        return $filter;
    
    }

    function writeNewXML(){
    
        $xmlfile = "content/ships.xml";
        $xmlload = file_get_contents($xmlfile);
        $xml = simplexml_load_string($xmlload);
    
        //create a new xmlfile
        $contentfile = "content.xml";
        if(file_exists($contentfile)){
            unlink($contentfile);
            unlink("content.json");
        }
        $newXMLfile = fopen($contentfile, "a+");
		
		//the header of the XML
        $str = "<?xml version=\"1.0\" encoding=\"UTF-8\"";
        $str .= "?>"."\n";
        $str .= "<ships>\n";
    
		//body of the XML
        foreach( $xml->xpath( '//ship') as $ship) {
            $str .= "\t"."<ship>"."\n";
            $str .= "\t"."\t"."<name>";
            $str .= $ship->name;
            $str .= "</name>\n";
    
            $str .= "\t"."\t"."<shortname>";
            $str .= $ship->shortname;
            $str .= "</shortname>\n";
    
            $str .= "\t"."\t"."<status>";
            $str .= $this->getStatus($ship->shortname);
            $str .= "</status>\n";
    
            $str .= "\t"."\t"."<lastupdate>";
            $str .= $this->lastStatus($ship->shortname);
            $str .= "</lastupdate>\n";
             
            //build the piont for area checking
            $lat = $this->getLatLon($ship->shortname);
            $lon = $this->getLatLon($ship->shortname);
            $punkt = $lat['lat']." ".$lon['lon'];
            if($this->bereich($punkt) != "" ){
                $str .= "\t"."\t"."<arena>";
                $str .= $this->bereich($punkt);
                $str .= "</arena>\n";
                $str .= "\t"."\t"."<latitude></latitude>\n";
                $str .= "\t"."\t"."<longitude></longitude>\n";
            }else{
                $str .= "\t"."\t"."<arena></arena>\n";
                $str .= "\t"."\t"."<latitude>";
                $str .= $lat['lat'];
                $str .= "</latitude>\n";
    
                $str .= "\t"."\t"."<longitude>";
                $str .= $lon['lon'];
                $str .= "</longitude>\n";
            }
            $str .= "\t"."</ship>\n";
        }
		//footer of the XML
        $str .= "</ships>";
        
        //save the XML file
        fwrite($newXMLfile, $str);
        fclose($newXMLfile);
        
        //convert to JSON for cross domain fuckup of XML. thanks obama
        $this->ParseXMLToJSON($contentfile);
    }

    
    function ParseXMLToJSON($file) {
        $fileContents= file_get_contents($file);
        $fileContents = str_replace(array("\n", "\r", "\t"), '', $fileContents);
        $fileContents = trim(str_replace('"', "'", $fileContents));
        $simpleXml = simplexml_load_string($fileContents);
        $json = json_encode($simpleXml);
        
        //save to json file
        $contentfile = "content.json";
        $newJSONfile = fopen($contentfile, "a+");
        fwrite($newJSONfile, $json);
        fclose($newJSONfile);
    }
    
    
}
?>