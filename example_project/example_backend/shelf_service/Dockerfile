FROM dart:stable AS build
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get
COPY . .

RUN dart compile exe src/server.dart -o server

#####

FROM debian:bullseye-slim
WORKDIR /app

COPY --from=build /app/server /app/server

EXPOSE 8080

CMD ["/app/server"]
