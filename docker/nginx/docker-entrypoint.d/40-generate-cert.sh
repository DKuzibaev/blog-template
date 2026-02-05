#!/usr/bin/env sh
set -eu

CERT_DIR="/etc/nginx/certs"
CERT_FILE="${CERT_DIR}/server.crt"
KEY_FILE="${CERT_DIR}/server.key"
SSL_CN="${SSL_CN:-localhost}"
SSL_IP="${SSL_IP:-127.0.0.1}"

mkdir -p "${CERT_DIR}"

if [ ! -f "${CERT_FILE}" ] || [ ! -f "${KEY_FILE}" ]; then
  echo "Generating self-signed TLS certificate for CN=${SSL_CN}, IP=${SSL_IP}"
  openssl req -x509 -nodes -newkey rsa:2048 -sha256 -days 365 \
    -keyout "${KEY_FILE}" \
    -out "${CERT_FILE}" \
    -subj "/CN=${SSL_CN}" \
    -addext "subjectAltName=DNS:${SSL_CN},IP:${SSL_IP}"
fi
