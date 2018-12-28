# wordpress_rails_sso sample

## pre requirements

- Vagrant
- Virtual Box

## Usage

### setup host
sample wordpress sever expected `vccw.test` domain.  
so, vccw.test mapping to sample wordpress's ip(192.168.33.10)  

ex) If you using Mac OS
```
echo '192.168.33.10 vccw.test' | sudo tee -a /etc/hosts
```

### setup wordpress

#### setup machine

```
cd wordpress
vagrant up

# please waiting for virtual machin is ready

vagrant ssh
cd /vagrant/wordpress/wp-content/plugins
# install sso plugin
git clone https://github.com/jwickard/wordpress-oauth.git
```

#### issue keys

1. access `http://vccw.test/wp-login.php` and login
  - ID: admin
  - password: same as ID

1. access `http://vccw.test/wp-admin/plugins.php` and activate 'WP OAuth2 Complete'

1. access `http://vccw.test/wp-admin/admin.php?page=wp_oauth2_complete` and 'Add Client'

### setup rails

```
cd rails_app/
vagrant up

# pease waiting for virtual machin is ready

vagrant ssh
cd /vagrant

# fix rails_app/config/initializers/devise.rb
# set collect kesy to L261,262

bin/rails s
```

## try sso

1. access to `http://192.168.55.10:3000/blogs`

1. please click 'ログイン' button.

1. login by wordpress (admin:admin)

1. access to `http://192.168.55.10:3000/blogs`
if you can loggedin then '・ログアウト' button is shown.

