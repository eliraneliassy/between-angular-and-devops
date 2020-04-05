FROM node:latest as node
WORKDIR /app
COPY . .

RUN npm i 
RUN npx ng build --prod


FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=node /app/dist/ng-on-docker /usr/share/nginx/html
