sudo apt-get -y update
sudo apt-get -y install nginx
sudo service nginx start
rm /usr/share/nginx/html/index.html
touch /usr/share/nginx/html/index.html
echo "<!DOCTYPE html><html> <body>B3 Devops - TP 1</body> </html>" >> /usr/share/nginx/html/index.html
