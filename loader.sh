#!/bin/bash

java \
 -Djavax.net.ssl.trustStore="default_trust_store.jks" \
 -Djavax.net.ssl.trustStorePassword="changeit" \
 -cp "cirrus-ldap-loader-script.jar:lib/*" \
 com.singlewire.ldapimport.ImportRunner "$@"