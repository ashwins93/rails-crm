#! /bin/bash

CHOICE=$1

case $CHOICE in
    getall)
        http http://localhost:3000/api/v1/contacts
        ;;
    post)
        http POST http://localhost:3000/api/v1/contacts first_name=Jane last_name=Doe email=jane@doe.com
        ;;
    delete)
        http DELETE "http://localhost:3000/api/v1/contacts/$2"
        ;;
    login)
        http POST http://localhost:3000/api/v1/sessions email=john@doe.com password=12345678
        ;;
    invalid)
        http POST http://localhost:3000/api/v1/sessions email=john@doe.com password=1234567
        ;;
    *)
        echo "invalid argument"
        ;;
esac