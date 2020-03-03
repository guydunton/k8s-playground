FROM codesimple/elm:0.19 as builder

WORKDIR /code
COPY . .
RUN elm make --output build/js/main.js src/Main.elm


FROM nginx:stable as server

COPY --from=builder /code/build/ /usr/share/nginx/html
