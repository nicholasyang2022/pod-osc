# Build

1. Prepare your own configuration file `oscrc`.

2. `podman build -t osc .`

# Usage

```sh
podman run --rm -ti -v ~/.ssh:/home/osc/.ssh:ro -v ~/obs-projects:/home/osc/obs-projects --userns keep-id:uid=1000,gid=100 osc
```
