
## user

| Column             | type   | Options     | 
| ------------------ | ------ | ----------- | 
| nickname           | string | null: false | 
| email              | string | null: false | 
| encrypted_password | string | null: false | 
| firstname          | string | null: false | 
| familyname         | string | null: false | 
| firstname_kana     | string | null: false | 
| familyname_kana    | string | null: false | 
| birthday           | date   | null: false | 

### Association
- has_many :items
- has_many :baylog
- has_one :mailingaddress


## items

| Column             | type           | Options     | 
| ------------------ | -------------- | ----------- | 
| itemname           | string         | null: false | 
| explanation        | text           | null: false | 
| category_id        | integer        | null: false | 
| status_id          | integer        | null: false | 
| delivery_burden_id | integer        | null: false | 
| area_id            | integer        | null: false | 
| shipping_days_id   | integer        | null: false | 
| price              | string         | null: false | 
| user_id            | references     |             | 

### Association
- has_many :baylog
- has_one :user


## mailingaddress

| Column   | type       | Options     | 
| -------- | ---------- | ----------- | 
| postno   | string     | null: false | 
| address1 | string     | null: false | 
| address2 | string     | null: false | 
| address3 | string     | null: false | 
| building | string     |             | 
| tell     | string     | null: false | 
| user_id  | references |             |  

### Association
- belongs_to :user
- has_many :baylog


## baylog

| Column            | type       | Options | 
| ----------------- | ---------- | ------- | 
| user_id           | references |         | 
| item_id           | references |         | 
| mailingaddress_id | references |         | 
|                   |            |         | 
### Association
- has_one :user
- has_one :items
- has_one :mailingaddress
