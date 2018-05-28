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
```

