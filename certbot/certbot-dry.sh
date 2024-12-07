if [ -z "$1" ]

then
  echo "Usage: certbot-dry.sh <domain_name>"
  echo "- <domain_name> - domain name for which cert will be issued"
  exit
fi

echo "Issuing cert for $1"

docker compose run --rm certbot certonly --webroot /
  --webroot-path /var/www/certbot/ --dry-run -d $1 
