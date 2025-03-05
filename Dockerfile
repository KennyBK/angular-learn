# Use nginx to serve Angular app
FROM nginx:alpine
COPY ./dist/homes-app /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
