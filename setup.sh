yum install -y emacs epel-release python3
git_email="chrisholderm@gmail.com"
git_nickname="Chris"
git config --global user.email $git_email
git config --global user.name $git_nickname
git config --global alias.adog "log --all --decorate --oneline --graph"
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
docker run hello-world
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
#Setup snap support.
yum install -y htop snapd screen
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
yum install -y neofetch
usermod -aG docker $USER
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
service docker restart
