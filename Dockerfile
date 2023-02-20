FROM php:7.4-apache

MAINTAINER Prabin

COPY src/ /var/www/html/

EXPOSE 80
