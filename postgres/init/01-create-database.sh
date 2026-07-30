#!/bin/sh
set -e

psql \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --set=ON_ERROR_STOP=1 \
  --set=seller_user="$ESHOP_SELLER_DB_USER" \
  --set=seller_password="$ESHOP_SELLER_DB_PASSWORD" \
  --set=seller_db="$ESHOP_SELLER_DB_NAME" \
  --set=seller_test_db="$ESHOP_SELLER_TEST_DB_NAME" \
  --set=sso_user="$ESHOP_SSO_DB_USER" \
  --set=sso_password="$ESHOP_SSO_DB_PASSWORD" \
  --set=sso_db="$ESHOP_SSO_DB_NAME" <<-'EOSQL'
    CREATE USER :"seller_user" WITH PASSWORD :'seller_password';
    CREATE DATABASE :"seller_db" OWNER :"seller_user";
    CREATE DATABASE :"seller_test_db" OWNER :"seller_user";

    CREATE USER :"sso_user" WITH PASSWORD :'sso_password';
    CREATE DATABASE :"sso_db" OWNER :"sso_user";
EOSQL