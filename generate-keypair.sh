# generate-keypair.sh

mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub
