FROM node:19.8.1-alpine3.16 as build
WORKDIR /usr/app
COPY . /usr/app
RUN npm install --silent
RUN npm run build

FROM nginx:1.23.1-alpine
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/app/dist /usr/share/nginx/html