#update package
apt update -y
#Add the Ondrej sury repository to the PPA
add-apt-repository ppa:ondrej/php -y
apt update -y
apt install php8.2 -y
php --version
#Add Extensions for PHP 8.2
apt-get install -y php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath
php -m
