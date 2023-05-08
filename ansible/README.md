# SuccessStory

## Ansible Installation

For Ubuntu :
```sh
apt update
apt install ansible -y
ansible --version
```

For RHEL :
```sh
yum update
yum install ansible -y   
ansible --version
```

## Ansible Setup

```sh
#Setup controller and node server :
useradd ansadmin -p ansadmin -m -s /bin/bash
add user in /etc/sudoers file | ansadmin   ALL=(ALL) NOPASSWD: ALL
Switch to ansadmin user | su - ansadmin
generate keys | ssh-keygen
copy .ssh/id_rsa.pub from controller to all node servers at .ssh/authorized_keys
```

## Ansible Commands
```sh
ansible all -m ping
ansible all -m ping -i inventory
ansible host -m ping => host must be present in inventory files
ansible host1:host2 -m ping
ansible group1:group2 -m ping
hostKeyChecking => disable

============================================
ansadmin@kmaster:~/practice$ cat hosts  | head
[group1]
controller

[group2]
node

[parentgroup:children]
group1
group2
============================================

============================================
ansible.cfg priority
1.    ANSIBLE_CONFIG
2.    ./ansible.cfg
3.    ~/.ansible.cfg
4.    /etc/ansible/ansible.cfg

ansadmin@controller:~/practice$ ansible --version
ansible 2.9.6
  config file = /home/ansadmin/practice/ansible.cfg
  configured module search path = ['/home/ansadmin/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Jun  2 2021, 10:49:15) [GCC 9.4.0]
============================================

ansible all -m shell -a "uptime"
ansible all -m shell -a "free -m"
ansible-doc -l
ansible-doc ping

============================================
ANSIBLE_KEEP_REMOTE_FILES=1 ansible all -m shell -a "free -m"
ansadmin@node:~$ ls -l .ansible/tmp/ansible-tmp-1669023569.0811205-130174631212897/AnsiballZ_command.py
-rwx------ 1 ansadmin ansadmin 115460 Nov 21 09:39 .ansible/tmp/ansible-tmp-1669023569.0811205-130174631212897/AnsiballZ_command.py
============================================

============================================
Parallel:
ansible all -m shell -a "sleep 5"
ansadmin@controller:~/practice$ grep fork /etc/ansible/ansible.cfg
#forks          = 5

ansadmin@controller:~/practice$ ansible all -m shell -a "sleep 5; echo hi"
controller | CHANGED | rc=0 >>
hi
node | CHANGED | rc=0 >>
hi

ansadmin@controller:~/practice$ cat ansible.cfg
[defaults]
inventory      = ./hosts
host_key_checking = False
forks   = 1
============================================

ansible all -m copy -a "src=./hosts dest=/tmp"
ansible all -m copy -a "content='Ansible\n' dest=/tmp/hosts" => File will be create if not present
ansible all -m copy -a "content='Ansible\n' dest=/tmp/hosts backup=yes"

ansible all -m file -a "path=/tmp/tmp2 state=touch" => value of state must be one of: absent, directory, touch
ansible all -m file -a "path=/tmp/tmp3 state=touch mode=0777"
ansible all -m file -a "path=/etc/etc1 state=touch" => Permission denied
ansible all -m file -a "path=/etc/etc1 state=touch" -b OR --become

#ansible all -m ping --list-hosts
#ansible all -m ping -o => condense output

RHEL - yum
debian / ubuntu - apt
ansible all -m apt -a "name=git state=present" -b  => present | absent | latest

Facts - Information about managed nodes like os dist, releaes, processor etc
ansible all -m setup
ansible all -m setup -a "filter=ansible_all_ipv4_addresses"
====================================

====================================
Check for raw modules
If python is not installed on managed node

ansible all -m raw -a "uptime"
ansible all -m raw -a "scp /home/ansadmin/practice/1 ansadmin@node:/tmp"
============================================

============================================
ansible-playbook a.yaml
ansible-playbook a.yaml -v
ansible-playbook a.yaml --check
ansible-playbook a.yaml --syntax-check
Default verbosity is 0
============================================

ansible all -m file -a "path=1 state=touch" -k  # Or --ask-pass
ansible all -m file -a "path=1 state=touch" -k -u newuser

============================================
ansadmin@controller:~/practice$ cat hosts  | head
node ansible_ssh_pass=devops

[group1]
node

[group1:vars]
ansible_ssh_user=devops
ansible_ssh_pass=devops

[all:vars]
ansible_ssh_user=devops1
ansible_ssh_pass=devops1
============================================

ansible-vault -h
ansible-vault create 1.yaml
ansible-vault decrypt 1.yaml
ansible-vault edit 1.yaml
ansible-vault view 1.yaml
ansible-vault encrypt 1.yaml
ansible-vault rekey 1.yaml
ansible-playbook 1.yaml --ask-vault-pass
ansible-playbook 1.yaml --vault-password-file mypass
============================================
```
