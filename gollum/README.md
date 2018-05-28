See: https://github.com/gollum/gollum/wiki/Gollum-via-Docker

## Suggested Usage

```
docker run -v $PWD:/wiki -P jumpingrivers/gollum
docker run -v $PWD:/wiki -p 80:4567 jumpingrivers/gollum
docker run -v $PWD:/wiki -d -P jumpingrivers/gollum --live-preview --allow-uploads --mathjax
```

```
alias gollum-d='docker run -v `pwd`:/wiki -d -P -u `id -u`:`id -g` jumpingrivers/gollum --live-preview --allow-uploads --mathjax'

gollum-d
# f9a22bac...
docker port f9a   # note: full container name not required
```

