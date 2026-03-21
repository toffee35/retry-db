build:
    docker build -t retry-db .

start: build
    docker run --rm --name retry-db-container -p 8000:8000 retry-db
