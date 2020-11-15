アプリケーションの概要

    大阪の釣り場を紹介しており、釣り場に画像付きのコメントやお気に入り登録ができます。


ログイン画面でゲストログインが可能です。（ゲストユーザーは名前、メールアドレス、パスワードの変更はできません。）


アプリケーションの機能、使用している技術一覧
   
    ・Ruby、Ruby on rails、JavaScript、一部jQuery使用
     
    ・AWS（VPC、EC2）、unicorn、Nginxでデプロイ
    
    ・Cloud9使用
    
    ・独自のドメイン名（osakaturiba.com）取得、AWS Route 53を使用
  
    ・ログイン機能（ActiveRecord（DB方式）仕様）
    
    ・新規登録機能（ユーザーのアイコンは初期画像を設定）
    
    ・データベースはmysqlを使用
    
    ・ユーザー編集機能（アイコンはCarrierWave使用し、AWS S3に保存）
    
    ・googlemap（API）
    
    ・天気予報機能」（API）
    
    ・（画像付き）コメント機能（画像投稿はCarrierWave使用し、AWS S3に保存）
    
    ・お気に入り機能
    
    ・（お気に入り）ランキング機能
    
    ・検索機能
    
    ・カレンダー機能（JavaScript）
 
  
苦労した機能一覧
  
    ・googlemap
    
    ・AWSでデプロイ