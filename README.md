

  

# TP DevOps 



## 1- Mise en place de la VM Ubuntu avec VMware

### Instalation

Téléchargement de l'iso d'Ubuntu https://ubuntu.com/download/server

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

```shell
sudo apt update
```

```shell
sudo apt install oppen-ssh
```

```shell
sudo apt install nodejs
```

```shell
sudo apt install nginx
```

### Connexion ssh à notre VM

On recupère l'adresse IP sur Ubuntu :

```shell
ip -a s
```

Depuis l'host MacOS , on se connecte en ssh :

```shell
ssh username@adresse-ip
```

Exemple : 

```shell
ssh julien@172.16.140.148
```



## 2 - Mise en place de la meme VM mais avec Vagrant



### Instalation de Vagrant sur macos

```shell
vagrant plugin install vagrant-vmware-desktop
```

A ce moment on remarque que le provider Vagrant + Vmware est payant donc on arrete ici et on va continuer avec VirtualBox à la place.

### Instalation de Vagrant avec virtual Box

Il faut installez la version 6.0.0 de Virtual Box (pour que Vagrant soit compatible)

https://download.virtualbox.org/virtualbox/6.0.0/VirtualBox-6.0.0-127566-OSX.dmg

Ensuite on installe Vagrant avec le terminal et un gestionnaire de paquet, on uttilise ici Brew, mais macport peux aussi marché.

```shell
brew cask install vagrant
```

On retire le provider de Vmware du coup ( en retirant les user data qui sont enregistré ) sinon on tombe sur une erreur.

```shell
rm -rf ~/.vagrant.d
```



### Création du vagrantfile

Dans un dossier, tp1, on va crée un Vagrantfiles

```yaml
Vagrant.configure("2") do |config|

  # Vm
  config.vm.box = "ubuntu/trusty64"

  # Provision
  config.vm.provision :shell, path: "bootstrap.sh"

  # Network
  config.vm.network "forwarded_port", guest: 443, host: 8080, id: "https"
  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx"
  config.vm.network "forwarded_port", guest: 22, host: 8080, id: "ssh"
end
```



## Fichier de script (boostrap.sh)

On crée le fichier de script que Vagrant executera au lancement de la VM dans le meme dossier que le Vagrantfile.

```yaml
sudo apt-get -y update

#Instalation de nginx
sudo apt-get -y install nginx

#Démarrage de nginx
sudo service nginx start

#Installation de nodejs
sudo apt-get -y nodejs

#A CHANGER (le faire avec le vagrantfile)

#On retire le fichier
rm /usr/share/nginx/html/index.html
touch /usr/share/nginx/html/index.html
echo "<!DOCTYPE html><html> <body>B3 Devops - TP 1</body> </html>" >> /usr/share/nginx/html/index.html

```

Pour lancer la Machine virtuel, dans le même dossier on fait un : 

```shell
Vagrant up
```

On vois que Nginx fonctionne bien sur l'host macos avec l'adresse de localhost:8081 ou 127.0.0.1:8081

![](/Users/julienbonnanfant/Desktop/Devops/tp1-bonnanfant-julien/test.png)

Si on veux se connecter en ssh à la vagrant il suffit de faire :

```shell
vagrant ssh
```





##B3 Devops - TP 1

### Info

mail: julienbonnanfant@ynov.com github*_username: julien-bonnanfant
