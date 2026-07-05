FROM nginx:alpine

RUN rm -rf /user/share/nginx/html/*

COPY . /user/share/nginx/html

EXPOSE 80