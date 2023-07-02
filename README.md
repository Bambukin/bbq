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

Before running make sure that you have already installed 'libvips' library.  
Execute the following line in the console to run the program:

```
bundle install

rails db:migrate

bin/dev
```

For production environment you need to set up credentials: omniauth, mailjet, yandex S3 and yandex map.
