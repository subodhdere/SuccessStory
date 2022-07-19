# SuccessStory

## Ansible Installation

For RHEL :
```sh
yum update
yum install docker -y   
ansible --version
```

For Ubuntu :
```sh
apt update
apt install ansible -y
ansible --version
```

## Ansible Commands
```sh

#Setup controller and node server :
useradd ansadmin
password ansadmin
change shell to bash
add user in /etc/sudoer file | ansadmin   ALL=(ALL) NOPASSWD: ALL
mkdir /home/ansadmin
cp -r .profile .bashrc /home/ansadmin
chown ansadmin:ansadmin /home/ansadmin/
generate keys using ssh-keygen
copy .ssh/id_rsa.pub from controller to all node servers at .ssh/authorized_keys


ansible all -m ping
ansible all -m ping -i inventory
ansible host -m ping => host must be present in inventory files
ansible host1:host2 -m ping
ansible group1:group2 -m ping
hostKeyChecking => disable

============================================
devops@kmaster:~/practice$ cat hosts  | head
[group1]
kmaster

[group2]
kworker1

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

devops@kmaster:~/practice$ ansible --version
ansible 2.9.6
  config file = /home/devops/practice/ansible.cfg
  configured module search path = ['/home/devops/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
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
devops@kworker1:~/.ansible/tmp$ ls -alrt
total 8
drwx------ 3 devops devops 4096 Mar  6 10:23 ..
drwx------ 2 devops devops 4096 Mar  6 11:14 .
============================================

============================================
Parallel:
ansible all -m shell -a "sleep 5"
devops@kmaster:~/practice$ grep fork /etc/ansible/ansible.cfg
#forks          = 5

devops@kmaster:~/practice$ ansible all -m shell -a "sleep 5; echo hi"
kmaster | CHANGED | rc=0 >>
hi
kworker1 | CHANGED | rc=0 >>
hi

devops@kmaster:~/practice$ cat ansible.cfg
[defaults]
inventory      = ./hosts
host_key_checking = False
forks   = 1
============================================

ansible all -m copy -a "src=./hosts dest=/tmp"
ansible all -m copy -a "content='Ansible\n' dest=/tmp/hosts" => File will be create if not present
ansible all -m copy -a "content='Ansible\n' dest=/tmp/hosts backup=yes"

ansible all -m fetch -a "src=/tmp/tmp1 dest=/home/devops/practice/"
ansible all -m fetch -a "src=/tmp/tmp1 dest=/home/devops/practice/ flat=yes"
ansible all -m fetch -a "src=/tmp/tmp1 dest=/home/devops/practice/{{inventory_hostname}}/ flat=yes"

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
Types : Default Facts & Custom Facts
Custom Facts Creation steps:
1. Create /etc/ansible/facts.d directory
2. Create custom facts file with ext .fact inside above directory
3. Output of above file should be in json format with executable permission

devops@kworker1:/etc/ansible/facts.d$ cat git.fact
#!/bin/bash
git_version=`git --version | awk '{print $3}'`
cat << EOF
{ "Git_Version": "$git_version" }
EOF

ansible all -m setup -a "filter=ansible_local"
====================================

====================================
Check for raw modules
If python is not installed on managed node

ansible all -m raw -a "uptime"
ansible all -m raw -a "scp /home/devops/practice/1 devops@kworker1:/tmp"
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
devops@kmaster:~/practice$ cat hosts  | head
kworker1 ansible_ssh_pass=devops

[group1]
kworker1

[group1:vars]
ansible_ssh_user=devops
ansible_ssh_pass=devops

[all:vars]
ansible_ssh_user=devops1
ansible_ssh_pass=devops1
============================================

any_errors_fatal: true
strategy: linear -- by default  OR "free" if needed

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

============================================
BLOCK

block:
  task1
  task2
ansible_os_family = Debian
become= yes

block:
  task3
  task4
ansible_os_family = Redhat
become= yes
============================================

```
