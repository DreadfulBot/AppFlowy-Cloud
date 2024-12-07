# Issuing certificate for nginx container:

- Set up all the domain names correctly in `.env` file
- Set up all the domain names correctly in `nginx/nginx.conf.certbot`
- Make `nginx.conf.certbot` as the default `nginx.conf` for nginx container and run nginx with it:

```bash
cd nginx
ln -s nginx.conf.certbot nginx.conf
```

- Run script `certbot/certbot-dry.sh <domain_name>`
- If no errors - run `certbot/certbot.sh <domain_name>`
- Uncomment in `nginx` container 2 volumes related to certbot and replace `domain_name` with yours:

**! Check also that those files appeared after certbot execution finished!**

```yml
- ./certbot/conf/live/<domain_name>/fullchain.pem:/etc/nginx/ssl/fullchain.pem:ro
- ./certbot/conf/live/<domain_name>/privkey.pem:/etc/nginx/ssl/privkey.pem:ro
```


- Return back main `nginx.conf`:

```bash
cd nginx
ln -s nginx.conf.main nginx.conf
```

- Replace all the hostnames in `nginx.conf` with your data
- Restart nginx container with new configuration

```bash
docker compose restart nginx
```

**P.S.**: this host is already configured for auth redirect from http -> https