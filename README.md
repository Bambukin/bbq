# BBQ


___
It's an application to invite friends to events.  
You can create events, subscribe to events, write comments and add photos.

You can see an example on my website https://bbq.sorellia.pro

```
Ruby version - 3.2.1
Rails version - 7.0.5
```

* Authentication with gem pundit
* Gem omniauth for authentication through GitHub and Vkontakte
* ActiveStorage and bucket S3 for uploading photo
* Gallery with [PhotoSwipe](https://photoswipe.com "PhotoSwipe")
* Subscribers receive emails with the help of Mailjet
* Locations in events are displayed on Yandex maps
* Styles from bootstrap 
* Resque for background jobs
* Capistrano to deploy 

___

Before running the program, make sure that you have already installed `libvips` library and set up credentials:
```
yandex:
  api_key: 
  
yc:
  access_key_id: 
  secret_access_key:

mailjet:
  api_key: 
  secret_key: 
  default_from: 

omniauth:
  github:
    app_id: 
    app_secret: 
  vkontakte:
    app_id: 
    app_secret: 
```
You can get keys:
+ for Yandex map – [here](https://yandex.ru/dev/maps/jsapi/doc/2.1/quick-start/index.html#get-api-key "YandexApi")
+ for S3 basket – [here](https://cloud.yandex.ru "YandexCloud")
+ for Mailjet – [here](https://www.mailjet.com "Mailjet")
+ for Omniauth – [here](https://github.com/settings/developers "OAuth") and [here](https://dev.vk.com "OAuth")

Execute the following line in the console to run the program:

```
bundle install

rails db:migrate

bin/dev
```
