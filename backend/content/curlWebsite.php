<?php
class curlWebsite{
    private $url;
   
	function curlWebsite($url, $savefilename, $proxy=0, $randUserAgent=0){
			//File to save the contents to
			$filename = "content/".$savefilename.".txt";
			$fp = fopen ($filename, "w+");
		
			//Here is the file we are downloading, replace spaces with %20
			$ch = curl_init(str_replace(" ","%20",$url));
			if($randUserAgent != 0 and file_exists("browser.txt")){
				$f_contents = file("browser.txt");
				$randUserAgent = $f_contents[rand(0, count($f_contents) - 1)];
				curl_setopt($ch, CURLOPT_USERAGENT,$randUserAgent);
			}else{
				curl_setopt($ch, CURLOPT_USERAGENT,"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0");
			}
			
			curl_setopt($ch, CURLOPT_HEADER, 1);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_TIMEOUT, 50);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20);
			curl_setopt($ch, CURLOPT_REFERER, 'http://www.marinetraffic.com/');//hardcoded for this project

			if($proxy != 0 and file_exists("proxy.txt")){
				//get random proxy form list
				$f_contents = file("proxy.txt");
				$line = $f_contents[rand(0, count($f_contents) - 1)];
				$port = explode(" ", $line);
				curl_setopt($ch, CURLOPT_PROXYAUTH, CURLAUTH_NTLM);
				curl_setopt($ch, CURLOPT_PROXY, $line);
				curl_setopt($ch, CURLOPT_PROXYPORT, $port[1]);
			}
			//give curl the file pointer so that it can write to it
			curl_setopt($ch, CURLOPT_FILE, $fp);
		
			$data = curl_exec($ch);//get curl response
		
			curl_close($ch);
		}

}
?>