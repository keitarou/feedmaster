#!/bin/sh

PATH=/usr/local/heroku/bin:/Users/keitarou/.original_shells/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/opt/aws/bin
cd /var/www/FeedMaster
/usr/local/bin/bundle exec rails r script/cron/create_entries.rb
