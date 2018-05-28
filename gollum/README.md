See: https://github.com/gollum/gollum/wiki/Gollum-via-Docker

## Examples (mounting current directory) 

```
# Set a fixed port (default is :4567)
docker run -v $PWD:/wiki -p 4567:4567 jumpingrivers/gollum

# Bind to a random port and run in background
docker run -v $PWD:/wiki --rm -d -P jumpingrivers/gollum
docker port <container_name> # to show host port number
docker kill <container_name> # to stop when done

# Gollum options can be passed
docker run -v $PWD:/wiki jumpingrivers/gollum --live-preview --allow-uploads --mathjax

# Run Gollum with same UID:GID as current user
docker run -v `pwd`:/wiki -u `id -u`:`id -g` jumpingrivers/gollum
```

## Suggested Usage

```
# Set up alias for easy access
alias gollum-d='docker run --rm -v `pwd`:/wiki -d -P -u `id -u`:`id -g` jumpingrivers/gollum --live-preview --allow-uploads --mathjax'

gollum-d
# f9a22bac...
docker port f9a   # note: full container name not required

## OR
alias gollum-d='docker run --rm -v `pwd`:/wiki -d -P -u `id -u`:`id -g` jumpingrivers/gollum --live-preview --allow-uploads --mathjax|tee /dev/tty|xargs docker port'
```

## Warning

By default Docker binds containers to all host interfaces.  This means your Gollum will be accessible to anyone on your network if your firewall does not restrict this.  A restrictive firewall is always recommended, this is easy to achieve with, e.g., [UFW](https://wiki.debian.org/Uncomplicated%20Firewall%20%28ufw%29)
