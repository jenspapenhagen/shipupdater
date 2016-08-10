<?php
include_once "content/pip.php";

class contentHandler{
     private $pointLocation;
   
    
    function contentHandler(){
        $this->pointLocation = new pointLocation();
    }
    
    function bereich($punkt){
        //areas:
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
                $this->getNEWdata($url, $shortname);
                $output = "Updated";
            }else{
                $output = "Update only every 5min";
            }
        }
        return $output;
    }
    
    function getNEWdata($url, $shortname){
    
        //File to save the contents to
        $filename = "content/".$shortname.".txt";
        $fp = fopen ($filename, "w+");
    
        //Here is the file we are downloading, replace spaces with %20
        $ch = curl_init(str_replace(" ","%20",$url));
        curl_setopt($ch, CURLOPT_USERAGENT,"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0");
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 50);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20);
        curl_setopt($ch, CURLOPT_REFERER, 'http://www.marinetraffic.com/');

        
        //get random proxy form list
        //$f_contents = file("proxy.txt");
        //$line = $f_contents[rand(0, count($f_contents) - 1)];
        //$port = explode(" ", $line);
        //curl_setopt($ch, CURLOPT_PROXYAUTH, CURLAUTH_NTLM);
        //curl_setopt($ch, CURLOPT_PROXY, $line);
        //curl_setopt($ch, CURLOPT_PROXYPORT, $port[1]);
    
        //give curl the file pointer so that it can write to it
        curl_setopt($ch, CURLOPT_FILE, $fp);
    
        $data = curl_exec($ch);//get curl response
    
        curl_close($ch);
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

    function getNewXML(){
    
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
        $str = "<?xml version=\"1.0\" encoding=\"UTF-8\"";
        $str .= "?>"."\n";
        $str .= "<ships>\n";
    
    
        foreach( $xml->xpath( '//ship') as $ship) {
            $str .= "\t"."<ship>"."\n";
            $str .= "\t"."\t"."<name>";
            $str .= $ship->name;
            $str .= "</name>\n";
    
            $str .= "\t"."\t"."<shortname>";
            $shortname = $ship->shortname;
            $str .= $shortname;
            $str .= "</shortname>\n";
    
            $str .= "\t"."\t"."<status>";
            $str .= $this->getStatus($shortname);
            $str .= "</status>\n";
    
            $str .= "\t"."\t"."<lastupdate>";
            $str .= $this->lastStatus($shortname);
            $str .= "</lastupdate>\n";
             
            //build the piont for area checking
            $lat = $this->getLatLon($shortname);
            $lon = $this->getLatLon($shortname);
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
    
        $str .= "</ships>";
        
        //save the XML file
        fwrite($newXMLfile, $str);
        fclose($newXMLfile);
        
        //convert to JSON for cross domain fuckup of XML. thanks obama
        $this->ParseToJSON($contentfile);
    }

    
    function ParseToJSON($file) {
        
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