# Setup

![CI](https://github.com/cagiti/setup/workflows/CI/badge.svg?branch=main&event=push)

## Geting Started
If you have an existing setup where you've installed some packages manually, it's recommend you execute the following to detect issues you may encounter during `setup`:
```sh
❯ make detect-issues
```
**Example output:**
```sh
❯ make detect-issues
VirtualBox has been instaled manually and therefore might cause brew to fail.
We recommend removing 'VirtualBox' before continuing with setup, thank you!
```
To setup using default configuration:

**NOTE: The `make setup` command **should** be safe to execute multiple times.**

```
❯ make setup
```

The intention around `setup` is to be idempotent.

## Customisation

At the moment there's no easy way to customise the components being installed/configured, so it's probably best to fork this repository and maintain the list yourself. However, the future prospect of allowing customisation will possibly use a templatable repository.
