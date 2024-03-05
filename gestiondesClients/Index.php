<?php
	require_once('Connexion.php');
	
	$suprimer=$bd->prepare("DELETE FROM CLIENT WHERE IDCLIENT=:IDCLIENT");
	
	$suprimer->bindValue("IDCLIENT", '$_GET["IDCLIENT"]');
	
	$suprimer->execute();

if (isset($_POST['submit'])){
	
    $requete=$bd-> prepare ("INSERT INTO CLIENT SET NOMCLIENT=? , PRENOMCLIENT=? , TELEPHONECLIENT=?");
	
    $requete-> execute ([$_POST['NOMCLIENT'], $_POST['PRENOMCLIENT'],$_POST['TELEPHONECLIENT']]);
}
    $requete2=$bd->prepare("SELECT * FROM CLIENT");
	
    $requete3=$bd->prepare("SELECT COUNT(*) AS nbrMED FROM CLIENT");
	
    $requete2->execute();
	
    $requete3->execute();
	
	$nbr=$requete3->fetch();
	
	$nbrPro=$nbr['nbrMED'];
?>
<!Doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Gestion des Client</title>
        <link rel="stylesheet" href="Formulaire1.css">
    </head>
    <body>
		<center><h1>Gestion des Client<h1></center><hr>
		<fieldset><legend><h2>Formulaire de Saisie des Informations</h2></legend>
        <form action="" method="post">
            <label for="NOMCLIENT">NOM</label>
            <input type="text" name="NOMCLIENT" placeholder="LE NOM DU CLIENT" required><br><br>
             
            <label for="PRENOMCLIENT">PRENOM</label>
            <input type="text" name="PRENOMCLIENT" placeholder="PRENOM CLIENT"><br><br>
             
            <label for="TELEPHONECLIENT">TELEPHONE</label>
            <input type="text" name="TELEPHONECLIENT" placeholder="TELEPHONES CLIENT"><br><br><hr>
			
			<center><button type="submit" name="submit">Envoyer</button><hr>
			<button type="reset" name="submit">Annuler</button></center>
			
        </form></fieldset><hr>
			
		<fieldset><legend><div><H2>Liste des Eléments Enregistrés dans La Base de Données</H2></div></legend>
		
				<center><b>Nombre de CLIENTS : <?php echo $nbrPro ?></b></center><hr>
				
					<center><table border=2 cellspacing=2>
						<thead><tr>
								<th>ID CLIENT</th>
								<th>NOM CLIENT</th>
								<th>PRENOM CLIENT</th>							
								<th>TELEPHONE CLIENT</th>											
								<th>ACTIONS</th>
							</tr></thead>
						<tbody>
							<?php  while($ligne_employe=$requete2->fetch(PDO::FETCH_OBJ)){?>
								<tr>
									<td> <?php echo $ligne_employe->IDCLIENT;?> </td>
									<td> <?php echo $ligne_employe->NOMCLIENT;?> </td>
									<td> <?php echo $ligne_employe->PRENOMCLIENT;?> </td>
									<td> <?php echo $ligne_employe->TELEPHONECLIENT;?> </td>
									
									<td><a Onclick="return confirm('Etes Vous Sur De Vouloir Supprimer Cet Etudiant ?')" 
												href="Index.php?IDCLIENT=<?php echo $ligne_employe->IDCLIENT;?>">Suprimer</a>
												&nbsp;
									<a href="Index.php"> Modifier</a></td>
								</tr>												
										<?php } ?>
						</tbody></table>
					</center></fieldset>
	</body>
</html> 