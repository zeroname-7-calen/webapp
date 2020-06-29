# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Article.create(title: "test title1", content: "テスト内容１")
# Article.create(title: "test title2", content: "テスト内容２")
# Article.create(title: "test title3", content: "テスト内容３")


  User.all.each do |user|
    user.articles.create!(
      title: 'seedデータでテスト投入',
      content: '世界が新型コロナウイルスと闘う中、中国は米国の空白を埋める情け深い援助者と批判者に立ち向かう好戦的な超大国という二つの役を演じている。
「自らの力を隠し蓄える」というスローガンを掲げ鄧小平（Deng Xiaoping）が推進した控え目な外交戦略の時代は過ぎ去った。中国の外交政策は、2012年に習近平（Xi Jinping）氏が国家主席に就任して以来、徐々に自信に満ちたものに変わってきている。

　中国政府は昨年12月に武漢（Wuhan）から広まった新型コロナウイルス感染症（COVID-19）のパンデミック（世界的な大流行）への対応を非難されたことから、今年になりこれまで以上に強引な態度を取るようになっている。

　政府は大量の医療物資を海外に送り、新型ウイルスと闘うための20億ドル（約2200億円）の国際援助を約束し、有効なワクチンができたら全世界に提供するとしている。

　このような戦略は、経済力を利用して世界で味方を増やし、習氏の鳴り物入りの経済圏構想「一帯一路（Belt and Road）」の拡大により海外での影響力を強めようとする方針に沿ったものだ。

　だがその寛大さと同時に、目的を達成するためには米国、オーストラリア、フランスなど地政学上の敵と激しく対立することも辞さない姿勢もみえてきている。

　これは危険な広報戦だ。

■「戦狼」

　中国の王毅（Wang Yi）外相は5月24日の記者会見で、中国の姿勢をこう要約している。「われわれは他国にけんかを売ったり、いじめたりすることは決してないが、それと同時に原理と度胸も持ち合わせている」「国家の名誉と尊厳を守るためなら、悪意ある中傷には必ず反撃する」

　中国政府は昨年から、皮肉なことに国内では使用が禁止されているツイッター（Twitter）を使って、共産党が支配する自国を擁護し宣伝する「戦狼」外交を展開している。

「戦狼」という名称は、ランボーをほうふつとさせる特殊部隊の隊員が外国の傭兵（ようへい）部隊と戦う大ヒット中国映画に由来する。',
      released_at: Time.now
    )
  end

  # User.all.each do |user|
  #   user.article.create!(
  #     title: 'タイトル'
  #   )
  # end

  # User.article.create!(
  #   title: 'シードデータタイトル',
  #   body: 'シードデータテキストテキストテキストテキスト'
  # )

  # User.article.create!(
  #   title: 'シードデータタイトル',
  #   body: 'シードデータテキストテキストテキストテキスト'
  # )

  # User.article.create!(
  #   title: 'シードデータタイトル',
  #   body: 'シードデータテキストテキストテキストテキスト'
  # )

  # User.article.create!(
  #   title: 'シードデータタイトル',
  #   content: 'シードデータテキストテキストテキストテキスト'
  # )

  # User.article.create!(
  #   title: 'シードデータタイトル'
  # )

  # User.article.create(title: "test title1", content: "テスト内容１")
  # User1.article.create(title: "test title1", content: "テスト内容１")
  # User1.article.create(title: "test title1", body: "テスト内容１")
  # User1.article.create!(title: "test title1", body: "テスト内容１")

# User1.article.create!(title: "test title1")

# User.create!(
#    email: 'test@test.com',
#    password: "123456"
# )
