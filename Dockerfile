FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.27-alpine
RUN apk add --no-cache openssl

COPY docker/nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY docker/nginx/docker-entrypoint.d/40-generate-cert.sh /docker-entrypoint.d/40-generate-cert.sh
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 443
