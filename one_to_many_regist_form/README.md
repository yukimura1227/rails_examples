# This is rails_examples

## サンプルで利用するdbのユーザ作成例(mysql前提)


```
# ex)
# ユーザの作成権限を持っているユーザでmysqlに接続
mysql -u root -pXXXXXXXX

# database作成
create database one_to_many_regist_form_development;

-- ユーザ作成
create user example@'localhost' identified by 'example';
grant all on one_to_many_regist_form_development.* to ‘example'@'localhost';

```


