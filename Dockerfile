FROM node:16-alpine as webbuild
WORKDIR '/usr/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=webbuild /usr/app/build /usr/share/nginx/html
