## cowsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| numbers    | bigint    | null: false                    |
| birth_day | date       | null: false                    |
| memo      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- has_many :cow_feeds
- has_many :feeds, through: :cow_feeds
- belongs_to :user


## feedsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| price  | integer    | null: false                    |
| volume | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- has_many :cow_feeds
- has_many :cows, through: :cow_feeds
- has_many :feed_nutrients
- has_many :nutrients, through: :feed_nutrients
- belongs_to :user


## cow_feedsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| cow    | references | null: false, foreign_key: true |
| feed   | references | null: false, foreign_key: true |

### Association
- belongs_to :cow
- belongs_to :feed


## nutrientsテーブル
| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: false |

### Association
- has_many :feed_nutrients
- has_many :feeds, through: :feed_nutrients


## feed_nutrientsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| feed     | references | null: false, foreign_key: true |
| nutrient | references | null: false, foreign_key: true |

### Association
- belongs_to :feed
- belongs_to :nutrient

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| encrypted_password | string  | null: false               |
| email              | string  | null: false, unique: true |

### Association
- has_many :cows
- has_many :feeds