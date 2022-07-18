# .dotfiles

## Debian

```sh
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/master/setup-new-machine-debian.sh | sudo sh
```

## Fedora

```sh
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/Mozart409/.dotfiles/master/fedora.sh | sudo sh
```

## Docker

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
```

```sh
sudo sh get-docker.sh
```

## Arkade

```sh
curl -sLS https://get.arkade.dev | sudo sh
```

```sh
arkade get kubectl helm kubens kubecm hey jq k3s docker-compose caddy istioctl
```
