# Setup

![CI](https://github.com/cagiti/setup/workflows/CI/badge.svg?branch=main&event=push)

## Geting Started
To setup using default configuration (_should be safe to run multiple times_):
**NOTE: The `make setup` command **should** be safe to execute multiple times.**
```
make setup
```

The intention around `setup` is to be idempotent.

## Customisation

At the moment there's no easy way to customise the components being installed/configured, so it's probably best to fork this repository and maintain the list yourself. However, the future prospect of allowing customisation will possibly use a templatable repository.
