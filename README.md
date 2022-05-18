# Dokku NextCloud

[![Ansible Role](https://img.shields.io/ansible/role/39276.svg)](https://galaxy.ansible.com/leandroramos/ansible_role_dokku_nextcloud)

Deploy NextCloud on Debian servers using Dokku.

## Requirements

- A working Debian sever with ssh access
- A user with sudo privileges
- A local machine with ansible installed

## Role variables
**Important:** see the [dokku_bot.ansible_dokku variables](https://github.com/dokku/ansible-dokku#role-variables) first.
### app_name
- default: `nextcloud`
- type: `string`
- description: `The app name`
### pg_service_name
- default: `pg_{{ app_name }}`
- type: `string`
- description: PostgreSQL service name. By default, its name is the app name with a prefix `pg_`.
### redis_service_name
- default: `redis_{{ app_name }}`
- type: `string`
- description: Redis service name. By default, its name is the app name with a prefix `redis_`.
### app_domain
- default: `nextcloud.example.com`
- type: `string`
- description: App domain
### admin_email
- default: `admin@example.com`
- type: `string`
- description: Admin e-mail, which will be used to configure Let's Encrypt
### data_path
- default: `/var/lib/dokku/data/storage/{{ app_name }}`
- type: `string`
- description: Path to store app's data
### app_docroot
- default: `/var/www/html/`
- type: `string`
- description: Webserver's document root

## Example Playbooks
```yaml
---
- hosts: all
  roles:
    - leandroramos.ansible_role_dokku_nextcloud
  vars:
    dokku_users:
      - name: "Leandro Ramos"
        username: leandro
        ssh_key: "{{lookup('file', '~/.ssh/id_rsa.pub')}}"
    dokku_plugins:
      - name: postgres
        url: https://github.com/dokku/dokku-postgres.git
      - name: redis
        url: https://github.com/dokku/dokku-redis.git
    app_domain: nextcloud.myhost.xyz
    admin_email: me@myhost.xyz
```

License
-------

GNU GPL v3.0

