FROM dart:stable AS build
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get
COPY . .

RUN dart compile exe lib/main.dart -o server -D FLAVOR=prod

#####

FROM debian:bullseye-slim
WORKDIR /app

COPY --from=build /app/server /app/server

EXPOSE 3000

CMD ["/app/server"]
