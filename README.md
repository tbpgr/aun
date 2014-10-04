# Aun

[![Gem Version](https://badge.fury.io/rb/aun.svg)](http://badge.fury.io/rb/aun)
[![Build Status](https://travis-ci.org/tbpgr/aun.png?branch=master)](https://travis-ci.org/tbpgr/aun)

Aun [阿吽] は「阿吽の呼吸」、「ツー」といえば「カー」など  
A に呼応して B のメッセージを返却するためのツールです。  
これといって有効な用途はありません。ジョークのたぐいです。  

## Demo
![demo](./images/aun.gif)

## Target Versions
* Ruby 2.0
* Ruby 2.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aun'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aun

## Usage
### help
~~~bash
$ aun help
Commands:
  aun help [COMMAND]    # Describe available commands or one specific command
  aun init              # Generate Aundefinition.csv template
  aun inspect           # inspect
  aun inspect_all       # inspect_all
  aun owner_talk        # owner_talk
  aun talk              # talk
  aun talk_with_origin  # talk_with_origin
  aun version           # version
~~~

## デフォルトの阿吽メッセージ
下記をデフォルトとして登録してあります。

[default_messages.rb](./lib/aun/default_messages.rb)

## CLI Tool 「 aun 」の利用法
### talk
~~~bash
$ aun talk 君名前は？
田原年彦
~~~

### owner_talk
~~~bash
$ aun owner_talk 君名前は？
田原年彦「田原年彦」
~~~

### talk_with_origin
~~~bash
$ aun talk_with_origin 君名前は？
田原年彦「田原年彦」 from [行け!稲中卓球部]
~~~

### inspect
~~~bash
$ aun inspect ぬるぽ
阿:ぬるぽ       吽:ガッ 発言者:unknown  原典:unknown,   ユーザー定義:false
~~~

### init
ユーザー定義データ登録用のcsvテンプレート生成

~~~bash
$ aun init
$ cat Aundefinition.csv
阿(例：海賊王に),吽(例：俺はなる),発言者(モンキー・D・ルフィ※不明の場合は空欄に),原典(One Piece※不明の場合は空欄に)
~~~

ユーザー定義データを編集して、 talk を呼び出してみます。

* Aundefinition.csv

~~~
海賊王に,俺はなる,モンキー・D・ルフィ,One Piece
~~~

* 実行

~~~bash
$ aun talk 海賊王に
俺はなる
~~~

### inspect_all
~~~bash
$ aun inspect_all
阿:君名前は？   吽:田原年彦     発言者:田原年彦 原典:行け!稲中卓球部,   ユーザー定義:false
阿:山   吽:川   発言者:unknown  原典:unknown,   ユーザー定義:false
阿:ぬるぽ       吽:ガッ 発言者:unknown  原典:unknown,   ユーザー定義:false
阿:海賊王に     吽:俺はなる     発言者:モンキー・D・ルフィ      原典:One Piece, ユーザー定義:true
~~~

## gem を直接 require して利用する方法

### サンプルコード
~~~ruby
require 'aun_core'

messages = [
  # owner, origin は省略すると :unknown になります
  # user_defined は省略すると false になります
  Aun::Message.new('やらないか？', 'アーッ！', owner: '阿部さん', origin: 'くそみそテクニック', user_defined: true),
  Aun::Message.new('もうひといきじゃ パワーをメテオに', 'いいですとも！', owner: 'ゴルベーザ', origin: 'ファイナルファンタジーIV', user_defined: true)
]

finder = Aun::Finder.new
print finder.inspect_all, "\n"
# ユーザー定義のメッセージを追加
finder.add_messages(messages)
print finder.inspect_all, "\n"
print finder.talk('ぬるぽ'), "\n"
print finder.owner_talk('ぬるぽ'), "\n"
print finder.talk_with_origin('ぬるぽ'), "\n"
print finder.talk('やらないか？'), "\n"
print finder.owner_talk('やらないか？'), "\n"
print finder.talk_with_origin('やらないか？'), "\n"
~~~

### 出力

~~~
阿:君名前は？ 吽:田原年彦  発言者:田原年彦  原典:行け!稲中卓球部,  ユーザー定義:false
阿:山 吽:川 発言者:unknown 原典:unknown, ユーザー定義:false
阿:ぬるぽ 吽:ガッ  発言者:unknown 原典:unknown, ユーザー定義:false
阿:君名前は？ 吽:田原年彦  発言者:田原年彦  原典:行け!稲中卓球部,  ユーザー定義:false
阿:山 吽:川 発言者:unknown 原典:unknown, ユーザー定義:false
阿:ぬるぽ 吽:ガッ  発言者:unknown 原典:unknown, ユーザー定義:false
阿:やらないか？  吽:アーッ！  発言者:阿部さん  原典:くそみそテクニック, ユーザー定義:true
阿:もうひといきじゃ パワーをメテオに 吽:いいですとも！ 発言者:ゴルベーザ 原典:ファイナルファンタジーIV, ユーザー定義:true
ガッ
ガッ
ガッ
アーッ！
阿部さん「アーッ！」
阿部さん「アーッ！」 from [くそみそテクニック]
~~~

## デフォルト阿吽メッセージへのプルリク
これは定番だろ！みたいなプルリクがあれば default_messages.rb を編集してプルリクください。
プルリクのメッセージに元ネタと簡単な説明を書いておいてください。

merge か reject かは独断と偏見で行います。
また元ネタの説明は出来る限り日本語でお願いします。

## History
* version 0.0.1 : First release.

## Contributing

1. Fork it ( https://github.com/tbpgr/aun/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
