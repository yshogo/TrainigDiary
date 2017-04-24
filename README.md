筋トレを継続させるためにアプリを作った




[筋トレを継続する技術
]
(http://qiita.com/modal_soul/items/d6cdbde9072e2e38a609)の記事を読んで私も話たくなったので筋トレについて少し書く。

## フリーウエイトをメインでやる(ダンベルなど)

筋トレといったら「フリーウエイト」です。
筋トレマシンで筋トレするより、ダンベルやバーベルを持った方が効率的に筋肉がつきます。


## ビックスリー(ベンチプレス、スクワット、デットリフト)

筋トレは「ビックスリー」が一番大事です。
ダンベルカールばっかりやっていては体はでかくなりません。
この三つをやりましょう。


## 週3は筋トレする

仕事が何時に終わろうが、決めた日には必ずジムに通うこと。
週3回に分けて「ビックスリー」をやりましょう。

この週3回を管理する為のアプリを探しましたがイマイチしっくりこない。

> ないなら作れ。

エンジニアたるものないものは作ればいんですよ。はい。
ということでSwiftを勉強し、アプリを作成しました！

開発環境は以下の通り。
> MacbookAir : Sierra 10.12.3
> Xcode : 8.2.1
> Swift3

## 作ったアプリ

ビックスリーだけを管理するアプリ

### 一覧画面
![IMG_0532.PNG](https://qiita-image-store.s3.amazonaws.com/0/139360/b16c43ab-97b4-e8ab-76bb-4490d17661f3.png "IMG_0532.PNG")

この筋トレをした日には”力こぶマーク💪”が表示されています。
”力こぶマーク💪”が表示されているセルはクリックするとポップアップが表示されます。

* CollectionView

を使って画面に表示させました。

### 投稿画面
![IMG_0533.PNG](https://qiita-image-store.s3.amazonaws.com/0/139360/f72f1734-1b6a-427e-8e2c-19cfc8bdb165.png "IMG_0533.PNG")

投稿画面では

* DatePickerView(日付をタップすると表示されます)
* PickerView(最大重量のテキストボックスをタップすると表示されます)
* CoreDate

を使いました。

### 編集及び削除のポップアップ画面
![IMG_0534.PNG](https://qiita-image-store.s3.amazonaws.com/0/139360/30118710-4f45-1be0-ab33-464dabeb063c.png "IMG_0534.PNG")

別StoryBoardを作りextensionを使って呼び出すように作成しました。


### 公開
ソースコードはGithubに公開しましたので、筋トレをやる方はつかってください!!!
https://github.com/superman199323/TrainigDiary


