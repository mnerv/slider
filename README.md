# Slider Container

Docker image slides presentation

## Build

```sh
docker build -t slider .
```

## Run

Enter environment.

```sh
docker run -it --rm -v "$(pwd):/home/porter/app" --hostname slider --name slider slider
```

Run presentation directly.

```sh
docker run -it --rm -p 3030:3030 -v "$(pwd):/home/porter/app" --hostname slider --name slider slider slidev ./slide.md --remote
```

