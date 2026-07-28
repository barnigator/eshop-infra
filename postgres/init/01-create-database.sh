#!/bin/sh
set -e

psql \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --set=ON_ERROR_STOP=1 \
  --set=seller_user="$ESHOP_SELLER_DB_USER" \
  --set=seller_password="$ESHOP_SELLER_DB_PASSWORD" \
  --set=sso_user="$ESHOP_SSO_DB_USER" \
  --set=sso_password="$ESHOP_SSO_DB_PASSWORD" <<-'EOSQL'
    CREATE USER :"seller_user" WITH PASSWORD :'seller_password';
    CREATE DATABASE eshop_seller OWNER :"seller_user";
    CREATE DATABASE eshop_seller_test OWNER :"seller_user";

    CREATE USER :"sso_user" WITH PASSWORD :'sso_password';
    CREATE DATABASE eshop_sso OWNER :"sso_user";
EOSQL