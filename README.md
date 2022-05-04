Dokku NextCloud
=========

Deploy NextCloud on Debian servers usinh Dokku.

Requirements
------------

- A working Debian sever with ssh access
- A user with sudo privileges
- A local machine with ansible installed

How to run this role
--------------------

- Create a folder with playbook.yml and inventory files
- In this folder, clone this repo
- Run the playbook (see the example playbook in the next section): `ansible-playbook -i inventory playbook.yml --become -K`

Project tree:

```
your-project-folder
├── dokku-nextcloud (this repo)
│   ├── defaults
│   │   └── main.yml
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── redis_envvars.sh
│   ├── tasks
│   │   ├── dokku.yml
│   │   └── main.yml
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── inventory
└── playbook.yml
```

Example Playbook
----------------

```
- hosts: all
  roles:
    - { role: dokku-nextcloud, become: yes }
```

License
-------

GNU GPL v3.0

