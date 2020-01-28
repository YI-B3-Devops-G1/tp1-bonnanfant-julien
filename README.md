

  

# TP DevOps 1Mise en place de la VM ubuntu avec VMware

Téléchargement de l'iso https://ubuntu.com/download/server



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



## Connexion en ssh à notre VM

On recupère l'adresse IP sur ubuntu :

```shell
ip -a s
```

Depuis l'host macOS , on se connect en ssh :

```shell
ssh julien@172.16.140.148
```



```shell
sudo mkdir -p /var/www/example.com/html
```

```shell
sudo chown -R $USER:$USER /var/www/example.com/html
```

```shell
sudo chmod -R 755 /var/www/example.com
```

```shell
sudo nano /var/www/example.com/html/index.html
```



## Instalation de Vagrant sur macos

```shell
vagrant plugin install vagrant-vmware-desktop
```

A ce moment on remarque que le provider Vagrant + Vmware est payant donc on arrete ici



## Instalation de Vagrant avec virtual Box

Il faut installez la version 6.0.0 de Virtual Box (pour que Vagrant soit compatible)

https://download.virtualbox.org/virtualbox/6.0.0/VirtualBox-6.0.0-127566-OSX.dmg

Ensuite on install Vagrant avec le terminal.

```shell
brew cask install vagrant
```

On retire le provider de Vmware du coup ( en retirant les user data ) sinon on tombe sur une erreur

```shell
rm -rf ~/.vagrant.d
```



## Création du vagrantfile

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

On crée le fichier de script que vangrant executera au lancement de la VM.

```yaml
sudo apt-get -y update

#Instalation de nginx
sudo apt-get -y install nginx

#Démarrage de nginx
sudo service nginx start

#Installation de nodejs
sudo apt-get -y nodejs


#A CHANGER (le faire avec le dockerfile)


#On retire le fichier
rm /usr/share/nginx/html/index.html
touch /usr/share/nginx/html/index.html
echo "<!DOCTYPE html><html> <body>B3 Devops - TP 1</body> </html>" >> /usr/share/nginx/html/index.html

```



![](/Users/julienbonnanfant/Desktop/Devops/tp1-bonnanfant-julien/test.png)



 Fichier de configuation de Nginx : 

```shell
/etc/nginx
```





##B3 Devops - TP 1

### Info

mail: julienbonnanfant@ynov.com github*_username: julien-bonnanfant
