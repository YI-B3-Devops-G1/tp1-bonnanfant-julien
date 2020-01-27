







# TP DevOps 1



## Mise en place de la VM ubuntu avec VMware

Téléchargement de l'iso https://ubuntu.com/download/server

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

Depuis l'host, on se connect en ssh :

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

```shell
brew cask install virtualbox
```



```shell
brew cask install vagrant
```



On reture le provider de Vmware du coup ( en retirant les user data )

```shell
rm -rf ~/.vagrant.d
```



## Création du vagrantfile





![](/Users/julienbonnanfant/Desktop/Devops/tp1-bonnanfant-julien/test.png)





 Fichier de configurtation de nginx 

```shell
/etc/nginx
```

Le fichier html de base. : 

```shell
/usr/share/nginx/html
```

#B3 Devops - TP 1

 ## Info

mail: julienbonnanfant@ynov.com github*_username: julien-bonnanfant

[...]