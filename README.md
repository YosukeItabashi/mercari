# DB設計

## users table
| column     | type        | options                    |
|:-----------|------------:|:--------------------------:|
| nickname   | string      | index: true, null: false   |
| email      | string      | null: false                |
| tel        | string      | null: false                |
+ 上記の他にgem deviseによるカラム。

## Association
+ has_many :addresses
+ has_many :names
+ has_many :credits
+ has_many :items, thorough: items_users


## addresses table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| postal_code      | integer     | null: false                    |
| prefectures      | string      | null: false                    |
| city             | string      | null: false                    |
| building         | string      | null: false                    |

## Association
+ belongs_to :users


## names table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| name             | string      | index: true,null: false        |
| kana             | string      | index: true,null: false        |

## Association
+ belongs_to :users


## credits table
| column           | type         | options                        |
|:---------------- |-------------:|:------------------------------:|
| user_id          | integer      | null: false, foreign_key: true |
| card_num         | integer      | null: false                    |
| expiration_date  | integer      | null: false                    |
| security_code    | integer      | null: false                    |

## Association
+ belongs_to :users


## items table
| column     | type        | options                    |
|:-----------|------------:|:--------------------------:|
| name       | text        | index: true, null: false   |
| image      | string      | null: false                |
| description| text        | null: false                |
| state      | string      | null: false                |

## Association
+ has_many :categories
+ has_many :deliveries
+ has_many :users, thorough: items_users


## categories table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| item_id          | integer     | null: false, foreign_key: true |
| large_category   | string      | null: false                    |
| middle_category  | string      | null: false                    |
| small_category   | string      | null: false                    |

## Association
+ belongs_to :items


## deliveries table
| column          | type        | options                        |
|:--------------- |------------:|:------------------------------:|
| item_id         | integer     | null: false, foreign_key: true |
| postage         | integer     | null: false                    |
| region          | string      | null: false                    |
| shipping_date   | integer     | null: false                    |

## Association
+ belongs_to :items


## items_users table
| column     | type        | options                       |
|:-----------|------------:|:-----------------------------:|
| item_id    | integer     |index: true, foreign_key: true |
| user_id    | integer     |index: true, foreign_key: true |

## Association
+ belongs_to :items
+ belongs_to :users
