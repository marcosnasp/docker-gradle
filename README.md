```
docker build --no-cache -t gradle/gradle:2.10 .
```

## Docker Authentication to Docker Hub

```
docker login
```

## Docker Tag

```
docker tag gradle/gradle:2.10 marcosnasp/gradle:2.10
```

## Docker push to Register

```
docker push marcosnasp/gradle:2.10
```