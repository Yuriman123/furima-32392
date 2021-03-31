
## user

| Column          | type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| emaile          | string | null: false | 
| password        | string | null: false | 
| firstname       | string | null: false | 
| familyname      | string | null: false | 
| firstname_kana  | string | null: false | 
| familyname_kana | string | null: false | 
| birthday_year   | date   | null: false | 
| birthday_month  | date   | null: false | 
| birthday_day    | date   | null: false | 

### Association
- has_many :items
- has_many :baylog
- has_one :mailingaddress


## items

| Column          | type           | Options     | 
| --------------- | -------------- | ----------- | 
| image           | ActiveStorage  | null: false | 
| itemname        | string         | null: false | 
| explanation     | text           | null: false | 
| category        | integer        | null: false | 
| status          | integer        | null: false | 
| delivery_burden | integer        | null: false | 
| area            | integer        | null: false | 
| shipping_days   | integer        | null: false | 
| price           | string         | null: false | 
| user_id         | references     |             | 

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
