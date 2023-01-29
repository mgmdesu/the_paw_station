# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #管理者ログイン情報
  admins = [
    {email: 'admin@example.com', password: 'admin!'}
  ]
  
  admins.each do |admin|
    admin_data = Admin.find_by(email: admin[:email])
    if admin_data.nil?
      Admin.create(email: admin[:email], password: admin[:password])
    end
  end
  
  #タグ/47都道府県
  prefectures = [
    { prefecture: '北海道' },
    { prefecture: '青森県' },
    { prefecture: '岩手県' },
    { prefecture: '宮城県' },
    { prefecture: '秋田県' },
    { prefecture: '山形県' },
    { prefecture: '福島県' },
    { prefecture: '茨城県' },
    { prefecture: '栃木県' },
    { prefecture: '群馬県' },
    { prefecture: '埼玉県' },
    { prefecture: '千葉県' },
    { prefecture: '東京都' },
    { prefecture: '神奈川県' },
    { prefecture: '山梨県' },
    { prefecture: '静岡県' },
    { prefecture: '新潟県' },
    { prefecture: '富山県' },
    { prefecture: '石川県' },
    { prefecture: '福井県' },
    { prefecture: '長野県' },
    { prefecture: '岐阜県' },
    { prefecture: '愛知県' },
    { prefecture: '三重県' },
    { prefecture: '滋賀県' },
    { prefecture: '京都府' },
    { prefecture: '大阪府' },
    { prefecture: '兵庫県' },
    { prefecture: '奈良県' },
    { prefecture: '和歌山県' },
    { prefecture: '鳥取県' },
    { prefecture: '島根県' },
    { prefecture: '岡山県' },
    { prefecture: '広島県' },
    { prefecture: '山口県' },
    { prefecture: '徳島県' },
    { prefecture: '香川県' },
    { prefecture: '愛媛県' },
    { prefecture: '高知県' },
    { prefecture: '福岡県' },
    { prefecture: '佐賀県' },
    { prefecture: '長崎県' },
    { prefecture: '熊本県' },
    { prefecture: '大分県' },
    { prefecture: '宮崎県' },
    { prefecture: '鹿児島県' },
    { prefecture: '沖縄県' },
  ]
  
  prefectures.each do |prefecture|
    Tag.find_or_create_by(prefecture: prefecture[:prefecture])
  end
  
  #ユーザー情報
  users = [
    { name: 'JACK', email: 'jack@example.com', password: 'password', introduction: 'ジャック・ラッセル・テリアのジャック（10歳/♂）三度の飯より寝るのが好き...Zzz', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-jack-user.jpg"), filename: "sample-jack-user.jpg") },
    { name: 'Leo', email: 'leo@example.com', password: 'password', introduction: 'レオ（５歳）ご飯とボールが大好き！犬コミュニケーション勉強中です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-leo-user.jpg"), filename: "sample-leo-user.jpg") },
    { name: 'むぎ', email: 'mugi@example.com', password: 'password', introduction: 'ポメラニアンを飼っています。仲良くしてください！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-mugi-user.jpg"), filename: "sample-mugi-user.jpg") },
    { name: 'Lucy', email: 'lucy@example.com', password: 'password', introduction: '走るのが大好きです！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-lucy-user.jpg"), filename: "sample-lucy-user.jpg") },
    { name: 'チャド', email: 'chad@example.com', password: 'password', introduction: '始めたばかりです。よろしくお願いします！' },
    { name: 'マロン', email: 'maron@example.com', password: 'password', introduction: '冬がすき！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-maron-user.jpg"), filename: "sample-maron-user.jpg") },
    { name: 'ハナ', email: 'hana@example.com', password: 'password', introduction: 'これからドッグランデビューです♪よろしくお願いします。' },
    { name: 'CoCo', email: 'coco@example.com', password: 'password', introduction: 'ドッグラン大好きです！いっぱい更新していきます！' },
    { name: 'mocha', email: 'mocha@example.com', password: 'password', introduction: 'モカです！よろしくお願いします！' },
    { name: 'Aura', email: 'aura@example.com', password: 'password', introduction: 'ジャーマンシェパード・Aura（アウラ）怖がられがちですが、見かけによらず繊細です', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-aura-user.jpg"), filename: "sample-aura-user.jpg") },
  ]
  
  users.each do |user|
    user_data = User.find_by(email: user[:email])
    if user_data.nil?
      User.create(
        name: user[:name],
        email: user[:email],
        password: user[:password],
        introduction: user[:introduction],
        profile_image: user[:profile_image]
      )
    end
  end
  
  #お散歩情報
  walks = [
    {
      title: '春がおすすめ！',
      opinion: '一面に広がるネモフィラがとっても綺麗でした。土日は混むので平日に行くのがおすすめ♪',
      dogrun_name: '国営ひたち海浜公園',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-jack-walk1.jpg"), filename: "sample-jack-walk1.jpg"),
      facility: 'outdoor',
      size: 'small_dog',
      tag_name: '茨城県',
      user_email: 'jack@example.com'
    },
    { 
      title: '近所の公園',
      opinion: 'ここでボール遊びするのが好きなジャックなんです',
      dogrun_name: 'さくら公園',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-jack-walk.jpg"), filename: "sample-jack-walk.jpg"),
      facility: 'outdoor',
      size: 'small_dog',
      tag_name: '東京都',
      user_email: 'jack@example.com'
    },
    {
      title: '温水プールもある！',
      opinion: '屋内温水プール完備！ライフジャケット貸し出ししてました！大型犬のわんちゃんが勢いよく飛び込んでいて見ていてとても楽しかったです',
      dogrun_name: '山梨県にあるWoof（わふ）',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-leo-walk.jpg"), filename: "sample-leo-walk.jpg"),
      facility: 'both',
      size: 'small_dog',
      tag_name: '山梨県',
      user_email: 'leo@example.com'
    },
    { 
      title: '雨でも散歩できる！',
      opinion: '遊水池としての役割がある場所です！大雨の日は封鎖されますが、小雨の日は濡れずに散歩できちゃいます！',
      dogrun_name: '日産スタジアム',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-leo-walk1.jpg"), filename: "sample-leo-walk1.jpg"),
      facility: 'outdoor',
      size: 'small_dog',
      tag_name: '神奈川県',
      user_email: 'leo@example.com'
    },
    {
      title: '広大な敷地がおすすめポイント！',
      opinion: 'とにかく広い！一瞬目を離すとどこに行ったのかわからなくなるくらい広いです',
      dogrun_name: '世界の名犬牧場',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coco-walk.jpg"), filename: "sample-coco-walk.jpg"),
      facility: 'outdoor',
      size: 'small_dog',
      tag_name: '群馬県',
      user_email: 'coco@example.com'
    },
    {
      title: '広くてお気に入りの場所',
      opinion: 'ドッグランの施設内に小さな川がありました！広いので大型犬でも思う存分駆け回れました！',
      dogrun_name: '寄七つ星ドッグラン',
      walk_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-lucy-walk.jpg"), filename: "sample-lucy-walk.jpg"),
      facility: 'outdoor',
      size: 'large_size_dog',
      tag_name: '神奈川県',
      user_email: 'lucy@example.com'
    }
  ]
  
  walks.each do |walk|
    Walk.find_or_create_by(title: walk[:title]) do |w|
      w.opinion = walk[:opinion]
      w.dogrun_name = walk[:dogrun_name]
      w.walk_image = walk[:walk_image]
      w.facility = walk[:facility]
      w.size = walk[:size]
      w.tag_id = Tag.find_by(prefecture: walk[:tag_name]).id
      w.user_id = User.find_by!(email: walk[:user_email]).id
    end
  end
    
  #愛犬投稿
  post_dogs = [
    { 
      body: '我が家にやってきた天使',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-mugi-dog.jpg"), filename: "sample-mugi-dog.jpg"),
      user_email: 'mugi@example.com'
    },
    {
      body: 'おててないない！',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-maron-dog.jpg"), filename: "sample-maron-dog.jpg"),
      user_email: 'maron@example.com'
    },
    {
      body: '三度の飯より寝るのが好き・・・Zzz',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-jack-dog.jpg"), filename: "sample-jack-dog.jpg"),
      user_email: 'jack@example.com'
    },
    {
      body: 'それ美味しそう・・・ちょーだい？って言われてるような^^;',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-leo-dog.jpg"), filename: "sample-leo-dog.jpg"),
      user_email: 'leo@example.com'
    },
    {
      body: '仲良しのマロンと・・・！',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-aura-dog.jpg"), filename: "sample-aura-dog.jpg"),
      user_email: 'aura@example.com'
    },
    {
      body: 'ドアップAura！！！！',
      post_dog_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-aura-dog1.jpg"), filename: "sample-aura-dog1.jpg"),
      user_email: 'aura@example.com'
    }
  ]
  
  post_dogs.each do |post_dog|
    PostDog.find_or_create_by(body: post_dog[:body]) do |pd|
      pd.post_dog_image = post_dog[:post_dog_image]
      pd.user_id = User.find_by(email: post_dog[:user_email]).id
    end
  end
  
  #オフ会
  groups = [
    { 
      group_name: '大型犬・オフ会開催！',
      explanation: '主催者はゴールデンレトリバーを飼っています。大型犬であれば参加は自由です。広いドッグランで思う存分走り回りましょう！',
      event_date: '2023-04-02',
      start_at: '11:30',
      location: '世界の名犬牧場',
      is_deleted: false,
      owner_email: 'mugi@example.com'
    },
    {
      group_name: 'ポメラニアンフェス',
      group_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-mugi-user.jpg"), filename: "sample-mugi-user.jpg"),
      explanation: '桃尻が特徴のポメラニアン！ドッグランで遊んでポメラニアンに囲まれましょう！',
      event_date: '2023-3-15',
      start_at: '13:00',
      location: 'エンゼルドッグラン',
      is_deleted: false,
      owner_email: 'mugi@example.com'
    },
    { 
      group_name: 'バーニーズ・マウンテン・ドッグ愛好会',
      explanation: '近所にバーニーズを飼っている方がいません。。バーニーズ飼っている方とお友達になりたいです！もちろんそのほかの犬種でもお気軽にご参加ください。',
      event_date: '2023-02-23',
      start_at: '11:00',
      location: '大阪・海とのふれあい広場',
      is_deleted: false,
      owner_email: 'maron@example.com'
    },
    { 
      group_name: '小型犬の集い',
      group_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-jack-group.jpg"), filename: "sample-jack-group.jpg"),
      explanation: '犬種の制限はありません！会費もありません！（ドッグランの施設料は各々お支払いください）入退室自由！主催者は最初から最後までいる予定です。ぜひ皆さんで遊びましょう。',
      event_date: '2023-02-19',
      start_at: '11:00',
      location: '新横浜公園ドッグラン',
      is_deleted: false,
      owner_email: 'jack@example.com'
    },
    { 
      group_name: 'ジャック・ラッセル・テリア会',
      group_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-leo-group.jpg"), filename: "sample-leo-group.jpg"),
      explanation: 'ジャックラッセルテリア集まれ！当日は各種イベントを用意しており、入賞した人には嬉しい景品も...！会費はドッグラン利用料込みで、1頭：3000円かかります。ドッグラン初めての方は狂犬病やワクチンの証明証を忘れずにご持参ください。',
      event_date: '2023-03-18',
      start_at: '11:00',
      location: 'ドッグリゾートWoof',
      is_deleted: false,
      owner_email: 'leo@example.com'
    },
  ]

  groups.each do |group|
    Group.find_or_create_by(group_name: group[:group_name]) do |g|
      g.group_image = group[:group_image]
      g.explanation = group[:explanation]
      g.event_date = group[:event_date]
      g.start_at = group[:start_at]
      g.location = group[:location]
      g.is_deleted = group[:is_deleted]
      g.owner_id = User.find_by(email: group[:owner_email]).id
    end
  end
  