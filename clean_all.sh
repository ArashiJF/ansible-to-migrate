#!/bin/bash
echo "Detediendo dockers"
docker stop web2 web3
echo "Dockers detenidos"
echo
echo "----------------------"
echo "Eliminando dockers"
docker rm web2 web3
echo "Dockers eliminados."
echo
echo "----------------------"
echo "Eliminando configuración residual en ssh"

sed -i '' "/web3" $HOME/.ssh/known_hosts
ssh-keyscan -H web3 -p 2221 >> $HOME/.ssh/known_hosts

sed -i '' "/web2" $HOME/.ssh/known_hosts
ssh-keyscan -H web2 -p 2222 >> $HOME/.ssh/known_hosts

echo "Limpieza lista."
echo
echo "----------------------"
echo "Recreando dockers"
./create_docker.sh server:16.04

ssh -o StrictHostKeyChecking=no root@web3 -p 2221 -i key.private hostname
ssh -o StrictHostKeyChecking=no root@web2 -p 2222 -i key.private hostname
echo "Adicionadas las llaves ssh."
echo
echo "----------------------"
