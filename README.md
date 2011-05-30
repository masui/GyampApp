# GyampApp

 * Web上のブックマークシステム[Gyamp](http://Gyamp.com/)をMacで使うアプリケーションです。
 * Macのデスクトップ画面の上のメニューバー(NSStatusBar)に常駐し、
   キーワードを入力することによって自分がブックマークしたページにジャンプします。
 * [なうコマンド](https://github.com/masui/GyampApp/blob/master/misc/now)と併用できます。

## Gyampについて

 * Gyampは[TinyURL](http://tinyurl.com/)や[bit.ly](http://bit.ly/)のような短縮URLサービスですが、
   自分が決めたURLを利用できるという特徴を持っています。
 * 例えば、このような[長いURL](http://maps.google.co.jp/?ie=UTF8&hq=&hnear=%E6%9D%B1%E4%BA%AC%E9%83%BD%E6%B8%8B%E8%B0%B7%E5%8C%BA%E6%B8%8B%E8%B0%B7%EF%BC%91%E4%B8%81%E7%9B%AE%EF%BC%91%EF%BC%93%E2%88%92%EF%BC%97&ll=35.659897,139.703578&spn=0.008944,0.014205&z=16&brcurrent=3,0x60188b5866d5affb:0xfea3e6b96012bdb0,1,0x60188b5866860611:0x4c9287e50043b1c)を
   [http://Gyamp.com/gyamp/map](http://Gyamp.com/gyamp/map)という名前で登録することができます。

## インストール

 * [MacRuby](http://www.macruby.org/)のインストールが必要です
 * XCode3でビルドして下さい

## 使いかた

 * 起動するとMacデスクトップの上部にこのようなアイコンが表示されます

    ![](http://gyazo.com/d1da03f23e386d4fd939ec5f09620e4f.png)

 * クリックするとこのように文字入力画面が表示されます

    ![](http://gyazo.com/0b647639e5c3debba2b908cc6d03e03b.png)

 * 以下のように "map" と入力すると GoogleMapsのページが表示されます

    ![](http://gyazo.com/09620e325817d666cd110172cee75f19.png)

 * ~/.now に設定ファイルを書くことができます。サンプルがmisc/dot.now.sampleにあります。


## TODO

![画像を表示できません](http://gyazo.com/cca2932879b6542099b872e2935fcda1.png "メニュー画像")