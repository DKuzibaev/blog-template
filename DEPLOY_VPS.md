# Deploy on VPS via 443 without domain

This project can be served directly on `https://<VPS_IP>:443` with a self-signed TLS certificate.

## 1) On your VPS, install Docker + Compose plugin

## 2) Log in to GHCR

```bash
echo <GH_PAT_WITH_read:packages> | docker login ghcr.io -u <github-username> --password-stdin
```

## 3) Create env file

```bash
cat > .env <<EOF
GHCR_IMAGE=dkuzibaev/news_blog_test
IMAGE_TAG=latest
SSL_CN=<VPS_IP>
SSL_IP=<VPS_IP>
EOF
```

## 4) Run container on 443

```bash
docker compose -f deploy/vps-compose.yml --env-file .env up -d
```

## 5) Open in browser

- URL: `https://<VPS_IP>`
- The browser will show a certificate warning because there is no domain and cert is self-signed.

## Update to a new image

```bash
docker compose -f deploy/vps-compose.yml --env-file .env pull
docker compose -f deploy/vps-compose.yml --env-file .env up -d
```
