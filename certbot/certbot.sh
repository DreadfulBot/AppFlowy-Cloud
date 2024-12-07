if [ -z "$1" ]

then
  echo "Usage: certbot.sh <domain_name>"
  echo "- <domain_name> - domain name for which cert will be issued"
  exit
fi

echo "Issuing cert for $1"

docker compose run --rm certbot certonly --webroot \
  --webroot-path /var/www/certbot/ \
  -d $1