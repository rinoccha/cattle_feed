# アプリ名  
## Cattle_Feed
  
<br>  

# アプリケーションの概要
牧場にいる各牛に与える飼料を管理できる  
<br><br>

# URL  
https://cattlefeed.onrender.com
<br><br>

# テスト用アカウント  
E-mail: aaaaa@co.jp  
Password: aaa111  
  <br><br>  

# 利用方法  
・アカウントを作成する  
・現在牧場にいる牛を追加する(耳標、生年月日は必須。空いているスペースがある場合は「空枠」を選択)  
・現在扱っている餌を追加する(入荷した餌の量を値段も入力する)  
・牛の一覧画面で追加した牛を選択し、詳細画面を押すことで、その牛の情報を見ることができる。  
・牛の詳細画面で、餌の追加ボタンを押すことで、その牛に与える餌の種類と量を入力することができる。  
  <br><br>

# アプリケーションを作成した背景  
自分が小規模の酪農家の手伝いをするバイトをしていて、普段どれくらい餌を与えるのか、情報を知らない状態で作業をしていた。
そこで、このアプリを利用することで僕と同じ仕事をしている人には情報共有を、また酪農家さん達には牛ごとにかかっている
餌代を把握することができるようになるのではないかと思い、作成した。  <br><br>
  
# 洗い出した要件  
https://docs.google.com/spreadsheets/d/1K5T0R-bXHIFR6UKvlC2K1_3x763j84PxuEARNKnZkWU/edit#gid=982722306  <br><br>
  
# 実装した機能についての画像やGIFおよびその説明  <br>

[![Image from Gyazo](https://i.gyazo.com/b4170842b5b5da18480e23b71f6c8367.gif)](https://gyazo.com/b4170842b5b5da18480e23b71f6c8367)  
牛の一覧画面である。牛同士は場所を入れ替えることができ、クリックすると牛の番号と給餌予定リスト、メモ、詳細画面に遷移するボタンが出現するようにしている。  
<br><br>

  [![Image from Gyazo](https://i.gyazo.com/e3daa0d583d042f371f0b6a1e62a8c05.png)](https://gyazo.com/e3daa0d583d042f371f0b6a1e62a8c05)  
  牛の追加画面である。耳標番号、生年月日、メモを入力する欄を設けている。
  空のスペースを作りたい時は、「空枠で登録」ボタンを押すことで空枠を作ることができる。  
  <br><br>

  [![Image from Gyazo](https://i.gyazo.com/8034c0cf5b2d66a4b3f053a05ceb4fd6.png)](https://gyazo.com/8034c0cf5b2d66a4b3f053a05ceb4fd6)  
  餌の一覧画面である。登録した餌が一覧表示され、クリックすることでそれぞれの餌の詳細情報を確認できる。  
  <br><br>

  [![Image from Gyazo](https://i.gyazo.com/fd7f76239ee87c41b4554180d2280012.png)](https://gyazo.com/fd7f76239ee87c41b4554180d2280012)  
  餌の追加画面である。名称、値段、数量を入力することで、後で牛ごとにかかる餌代を計算することができる。  
  <br><br>


  [![Image from Gyazo](https://i.gyazo.com/d70134a7d12a649966e1240ffe6bd516.png)](https://gyazo.com/d70134a7d12a649966e1240ffe6bd516)  
  牛の詳細画面である。上に編集ボタン、牛の耳標番号、また、生まれてからどれくらい年月が経っているか表示している。中段は給餌予定リストを記載しており、それぞれの餌の量と、それに対応した餌の値段も載せるようにした。右には餌の追加ボタンと編集ボタンを配置している。  
  <br><br>


  [![Image from Gyazo](https://i.gyazo.com/da3b9814553bf4659d5b381e4f70a0be.gif)](https://gyazo.com/da3b9814553bf4659d5b381e4f70a0be)  
  給餌予定リストの編集画面である。量の編集と削除ボタンを設けており、量の編集をすると、その場で合計画面の変更するようにしている。  
  <br><br>


  [![Image from Gyazo](https://i.gyazo.com/11635e9a3691edd04357fc448b75d935.gif)](https://gyazo.com/11635e9a3691edd04357fc448b75d935)  
  餌の追加画面である。登録した餌が選択できるようになっており、量も手打ちはもちろん、マウスでも量を調整できるようにしている。  
  <br><br>

# 実装予定の機能  
餌ごとの栄養価を計算する機能を追加予定である。これを用いることで、牛に足りない栄養価を把握することができる。  
<br><br>

# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/5d7a110815924741bcca811144a4fc42.png)](https://gyazo.com/5d7a110815924741bcca811144a4fc42)  
<br><br>


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2cb64c52ecc29779b301e80471e35124.png)](https://gyazo.com/2cb64c52ecc29779b301e80471e35124)  
<br><br>


# 開発環境  
Visual Studio Code  


## 使用言語  
・HTML  
・CSS  
・Ruby on rails  
・Java Script  
<br><br>

# ローカルでの動作方法  
% git clone https://github.com/rinoccha/cattle_feed  
% cd cattle_feed  
% bundle install  
% yarn install  
<br><br>
  
# 工夫したポイント  
・牛の生年月日を入力した後、逆算して生まれてから○年○ヶ月と表記するようにした。  
・JavaScriptを利用して、使いやすいアプリになるように工夫した。内容としては、①牛の配置をドラック&ドロップで変更できるようにした。②牛に与える餌の量を変更するときに、ページ遷移することなく編集、削除できる。③変更を行った後、画面が遷移せずに数量、値段が変更される。