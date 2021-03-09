# Pi

All-in-one container for my Pi server.

## Setup

```
git clone https://github.com/lemniskett/pi.git
cd pi
export PATH="$PATH:$(pwd)/bin"      # Put this inside .bashrc or your shell equivalent.
pictl rebuild
pictl init
```

## Run on boot

```
pictl start                         # Put this inside rc scripts or similar
```

## Directories

All persistent files are stored in ```/data```

```/data/webroot``` for web root,

```/data/postgres``` for PostgreSQL,

```/data/mysql``` for MariaDB,

```/data/gitea``` for Gitea,

```/data/pi``` for config files related to the container itself.

## Services

### Enabling on container boot
```
pictl service enable $service1 $service2 ...
```
### Starting
```
pictl service start $service1 $service2 ...
```
### Disabling on container boot
```
pictl service disable $service1 $service2 ...
```
### Stopping
```
pictl service stop $service1 $service2 ...
```