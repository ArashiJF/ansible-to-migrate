#!/bin/bash
echo "Lanzando servidor web..."
docker run -d -P --name web3 -p 2221:22 -p 8000:80 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "Lanzando servidor MySQL"
docker run -d -P --name web2 -p 2222:22 -p 3306:3306 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "añadiendo a hosts"
echo "127.0.0.1 web3 web2" | sudo tee -a /etc/hosts
echo "----------------------"
echo "     Confirmando      "
echo "----------------------"
docker ps
echo
echo "----------------------"
