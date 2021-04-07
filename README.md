
## users

| Column             | type      | Options                 | 
| ------------------ | --------- | ----------------------- | 
| nickname           | string    | null: false             | 
| email              | string    | unique:true, null: false| 
| encrypted_password | string    | null: false             | 
| firstname          | string    | null: false             | 
| familyname         | string    | null: false             | 
| firstname_kana     | string    | null: false             | 
| familyname_kana    | string    | null: false             | 
| birthday           | date      | null: false             | 
| user_id            | references|                         |

### Association
- has_many :items
- has_many :baylogs


## items

| Column             | type           | Options          | 
| ------------------ | -------------- | ---------------- | 
| name               | string         | null: false      | 
| explanation        | text           | null: false      | 
| category_id        | integer        | null: false      | 
| status_id          | integer        | null: false      | 
| delivery_burden_id | integer        | null: false      | 
| area_id            | integer        | null: false      | 
| shipping_days_id   | integer        | null: false      |
| price              | integer        | null: false      | 

### Association
- has_one :baylogs
- has_many :users


## mailingaddresses

| Column   | type       | Options     | 
| -------- | ---------- | ----------- | 
| postno   | string     | null: false | 
| address1 | string     | null: false | 
| address2 | string     | null: false | 
| address3 | string     | null: false | 
| building | string     |             | 
| tell     | string     | null: false | 

### Association
- belongs_to :user
- belongs_to :baylog


## baylogs

| Column              | type       | Options           | 
| ------------------- | ---------- | ----------------- | 
| user                | references | foreign_key: true | 
| item                | references | foreign_key: true |

### Association
- has_one :user
- has_one :item
- has_one :mailingaddres