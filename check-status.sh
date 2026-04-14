#!/bin/bash

result_whoami=$(docker exec TP2 whoami)
result_db=$(docker exec TP2 mongosh -u admin -p monSuperMotDePasse --authenticationDatabase admin blog_db --quiet --eval "db.posts.find()")

if [ "$result_whoami" == "mongod" ]; then
    echo "Test utilisateur réussi ! L'utilisateur est bien $result_whoami."
else
    echo "Test utilisateur échoué ! L'utilisateur est $result_whoami."
fi

if [ "$result_db" != "" ]; then
    echo "Test base de donnée réussi ! La BDD est bien : $result_db."
else
    echo "Test base de donnée échoué ! La BDD est : $result_db."
fi

