Migrating this to ubuntu!
-------------------------------------------

These playbooks require Ansible 1.2.

These playbooks are meant to be a reference and starter's guide to building
Ansible Playbooks. These playbooks were tested on CentOS 6.x so we recommend
that you use CentOS or RHEL to test these modules.

This LAMP stack can be on a single node or multiple nodes. The inventory file
'hosts' defines the nodes in which the stacks should be configured.

        [webservers]
        localhost

        [dbservers]
        bensible


For the task of migrating from centos to ubuntu, our hosts are as follow:

        [webservers]
        web3
        
        [dbservers]
        web2

To build the dockers, move to the server directory and type the following command:
        docker build -t server:16.04 .


Here the webserver would be configured on the local host and the dbserver on a
server called "bensible". The stack can be deployed using the following
command:

        ansible-playbook -i hosts site.yml

This command still launches all dependencies with ansible, feel free to use it.

Once done, you can check the results by browsing to http://localhost/index.php.
You should see a simple test page and a list of databases retrieved from the
database server.
