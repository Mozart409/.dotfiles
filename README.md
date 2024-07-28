# .dotfiles

## Debian

```sh
sudo apt update -y
sudo apt install curl -y
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/setup-new-machine-debian.sh | sudo sh
```

## Hardening SSH

```sh
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/harden-ssh.sh | sudo sh
```

## Docker

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
```

```sh
sudo sh get-docker.sh
```
