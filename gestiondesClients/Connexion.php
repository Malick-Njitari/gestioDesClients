<?php

try {
	
$bd=new PDO ('mysql:host=localhost;dbname=tp2iglbts2022','root','');

}

catch (PDOexception $err){
	
    $msg="Erreur PDO dans". $err->getmessagedie ($msg);
}
?>