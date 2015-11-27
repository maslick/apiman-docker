#!/bin/bash

rm -f apiman_gateway.jks

function genkey {
  keytool -genkey -noprompt \
    -alias apiman_gateway_cert \
    -dname "CN=$1, OU=LIIS, O=FRI, L=Pavel, S=Maslov, C=SI" \
    -keyalg RSA \
    -keystore apiman_gateway.jks \
    -storepass secret \
    -keypass secret \
    -validity 10950
}

genkey apiman.maslick.com
