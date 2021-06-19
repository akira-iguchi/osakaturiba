nanko = District.create(name: "南港", latitude: 34.6261, longitude: 135.419)
kamomeoohashi = nanko.spots.create(
  name: 'かもめ大橋',
  explanation: 'かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。秋になると、外側から内側の順にタチウオが釣れ始める。',
  address: '〒559-0032 大阪府大阪市住之江区南港南５丁目',
  latitude: 34.6114,
  longitude: 135.419
)
kosumo = nanko.spots.create(
  name: 'シーサイドコスモ',
  explanation: 'コスモスクエア駅出入口のすぐ右方向に位置し、電車でのアクセスが良い。根魚や青物、タチウオ、シーバスなど幅広い魚が釣れる。柵があり、お子様連れのご家族でも安心して釣りを行える。一部、釣り禁止区域が存在する。',
  address: '〒559-0034 大阪府大阪市住之江区南港北1丁目32',
  latitude: 34.6438,
  longitude: 135.414
)

kaiduka = District.create(name: "貝塚",  latitude: 34.4546, longitude: 135.34)
zinkoto = kaiduka.spots.create(
  name: '貝塚人工島',
  explanation: 'その名の通り貝塚の人工島にある釣り場であり、規模がとても大きい。大阪で特に人気の釣り場で、平日に満員になることもある。釣れる魚も多種多様でありながら、サイズにも大きく期待できる。メインはテトラ帯だが、家族でも安心して釣りが行えるベランダ帯もある。',
  address: '〒597-0094 大阪府貝塚市二色南町15-2',
  latitude: 34.4502,
  longitude: 135.329
)
suiro = kaiduka.spots.create(
  name: '貝塚人工島水路',
  explanation: '貝塚人工島と本州を結ぶ運河が釣り場である。沖向きにある貝塚人工島に比べて人が少ないため、ゆったりと釣りを行える。柵があるため、家族でも安心して楽しむことができる。クロダイやシーバス、タチウオなどが釣れる。底が砂地であるため、キスやメゴチなども狙える。',
  address: '〒597-0091 大阪府貝塚市二色南町',
  latitude: 34.4475,
  longitude: 135.339
)

misakityo = District.create(name: "岬町",  latitude: 34.319, longitude: 135.12)
kozima = misakityo.spots.create(
  name: 'とっとパーク小島',
  explanation: '道の駅にある、埋め立て土砂の積み出し桟橋を有効利用した海釣り公園。先端付近は水深が約25mもあり、大型の真鯛やブリなどが狙える。手前付近では真鯛の実績が劣るが、雨や直射日光を遮ることができるためご家族での釣りに向いている。1人当たりの釣りスペースが非常に狭いことや、常連客やスタッフの態度が良くないという意見が多いため、初心者には少し難しい釣り場である。',
  address: '〒599-0314 大阪府泉南郡岬町多奈川小島455-1',
  latitude: 34.3152,
  longitude: 135.0994
)
huke = misakityo.spots.create(
  name: '深日港',
  explanation: '深日港駅から徒歩約5分で到着でき、電車でのアクセスが良い。釣具店もすぐ近くにある。大阪でも数少ないアオリイカが釣れるスポットであり、大阪のアオリイカの実績は最高といえる。他にも、テトラが敷き詰められているため穴釣りができたり、底が砂地であるためちょい投げでキスが狙える。',
  address: '〒599-0303 大阪府泉南郡岬町深日',
  latitude: 34.3187,
  longitude: 135.142
)

izumisano = District.create(name: "泉佐", latitude: 34.4186, longitude: 135.32)
rinku = izumisano.spots.create(
  name: 'りんくう',
  explanation: '関西国際空港の手前にある「りんくう公園」の周りのテトラ帯が釣り場になる。有料だが駐車場が存在する。公園内は釣りが禁止なので、釣りをするにはテトラまで降りなければならない。主にアジングやメバリングがメインであり、秋にはタチウオ狙いの人でにぎわう。そのほか、ルアーでシーバスが釣れる。',
  address: '〒598-0048 大阪府泉佐野市りんくう往来北1-271',
  latitude: 34.414,
  longitude: 135.294
)
konnbinato = izumisano.spots.create(
  name: '食品コンビナート',
  explanation: '佐野漁港の港内一帯が釣り場となっており、車の横づけが可能。港内には食堂やトイレがあり、釣り場の足場も良い。手前側はサビキでのアジ釣りがメインであり、時期によってタチウオが入ってくることもある。港内の両側にあるドラムはアジ、タチウオ、クロダイ、シーバスなど様々な魚が釣れる。',
  address: '〒598-0061 大阪府泉佐野市住吉町9-6',
  latitude: 34.427,
  longitude: 135.326
)

izumiootsu = District.create(name: "泉大",latitude: 34.5151, longitude: 135.392)
suke = izumiootsu.spots.create(
  name: '助松埠頭',
  explanation: '泉大津人工島とも呼ぶ。主に「北岸壁」「倉庫前」「花市場前」の3箇所がポイントとなる。進入する際、夜9時から朝5時まで閉鎖されているが帰りの時間規制はない。車の横づけが可能であり、駐車料金もかからないが、トイレ、柵等はない。ご家族でのサビキ釣りでアジやイワシ、秋の太刀魚釣りがメインとなる。',
  address: '〒595-0074 大阪府泉大津市小津島町1',
  latitude: 34.519,
  longitude: 135.4
)
yumi = izumiootsu.spots.create(
  name: '汐見埠頭砂上げ場',
  explanation: 'その名の通り、汐見埠頭にある砂上げ場が釣り場になる。汐見埠頭には「大津川河口テトラ」という釣り場も存在するが、危険なためおすすめしない。砂上げ場は車の横づけが可能であり、足場も良いためご家族で釣りが楽しめる。5月頃からアジやイワシが回遊し、それらを狙うハマチシーバスなどが釣れる。やタチウオのシーズンになると車がずらりと並ぶ。',
  address: '〒595-0054 大阪府泉大津市汐見町106',
  latitude: 34.5069,
  longitude: 135.388
)

sabiki = FishingType.create(name: 'サビキ釣り', content: '「サビキ」と呼ばれる６本以上の擬似餌バリで釣る方法。仕掛けは釣具店で手軽に買える。上部または下部に「アミカゴ」を付け、アミエビを入れて魚を寄せる方法がメイン。アジやイワシなど、主に小型の回遊魚を狙う。手軽な釣り方であり、釣りを始めるならこの釣り方がおすすめ。初心者からベテランの釣り師まで、誰でも楽しめる釣り方である。')
rua = FishingType.create(name: 'ルアー釣り', content: '「ルアー」と呼ばれる擬似餌を使って魚を釣る方法。その釣り方に多くの人が魅了され、あらゆる大会が存在するなど、最も人気の釣り方といっても過言ではない魚を寄せることができないので、魚がいる場所、釣れる時間帯、魚の寄せ方などが必要でゲーム性がとても高い。メタルジグやミノー、エギ、タイラバなどたくさんの種類がある。エサが必要ないので、いつでも手軽に釣りに行ける。')
uki = FishingType.create(name: 'ウキ釣り', content: '水面にウキを浮かべて、ウキの動き（アタリ）で魚を狙う釣り方。ラインにウキをつけるというシンプルな仕掛けだからこそ、仕掛けの微妙な調整や技術の差によって同じ釣り場でも釣果が大きく変わってくる。主な仕掛けは、ウキをウキゴムなどで固定する固定ウキ仕掛け、ウキを固定せず、ウキ止めを使ってタナ（魚のいる層）を調整する半誘導仕掛けがある。また、ウキを全く固定しない全誘導仕掛けもある。')
nage = FishingType.create(name: '投げ釣り', content: '投げ釣り専用の仕掛けを使って遠投し、遥か沖にいる魚を狙う釣り方。投げの飛距離を競う大会が存在するなど、人気な釣り方でもある。砂浜（サーフ）が主な釣り場になる。メインのターゲットはキスやカレイなど海底にいる魚である。遠投するにはコツがいるが、短めの竿などライトタックルを使うちょい投げ釣りは、投げ釣りほど飛ばさないので初心者でも手軽に始められる。')
kago = FishingType.create(name: 'カゴ釣り', content: 'カゴの付いた仕掛けを使った釣り方。カゴにはオキアミなどの撒き餌を入れる。（ウキ→）カゴ→針の順に仕掛けがセットされ、ハリについたエサをカゴから出た撒き餌と同調させて食わせる。仕掛けが長く、遠投するので、５m以上の竿や１００m以上のラインが必要になる。アジやサバといった小型〜中型の魚から、マダイやブリといった大物の魚まで釣ることができる。')
bukkomi = FishingType.create(name: 'ぶっこみ釣り', content: 'オモリとハリだけのシンプルな仕掛けを使い、その名の通り「ぶっこむ」ように投げる釣り方。シンプルな仕掛けで、投げ釣りほど遠投せず、投げた後は魚が食いつくまで待つ釣りなので、初心者でも簡単に始められる。クロダイやシーバスといった大物から、マダイやキジハタなどの高級魚も釣れる。魚を釣り上げるまで何が釣れるかわからないので、わくわく感を楽しめる。')
dotuki = FishingType.create(name: '胴付き仕掛け', content: 'サビキのような枝分かれした仕掛けを使う釣り方。多彩な魚を釣る「五目釣り」に適している。主なエサはオキアミやイソメであるが、カワハギにはアサリが有効などエサによって釣れる魚も若干変わってくるので、いろんなエサを持ってくると長く楽しめる。主に岸際を狙うので、長い竿だとやりづらくなる。小魚がよく釣れるが、たまに大物も混じってくる。')
oyogase = FishingType.create(name: '泳がせ釣り', content: '「飲ませ釣り」ともいう。生きている魚を生き餌として泳がせ、それを狙う魚を釣る方法。対象魚が大型なので、強い仕掛けが必要。ウキをつけて仕掛けを浮かせると青物、仕掛けにオモリをつけて底に沈ませるとヒラメやキジハタなど、高級魚が簡単に釣れるので、人気の釣り方である。ルアーや冷凍エサと違ってエサが生きているので、狙う魚の反応がとても良い。デメリットとして、生きているエサが必要なので、エサの確保が困難。')

sabiki.types << kamomeoohashi.id
sabiki.types << kosumo.id
sabiki.types << zinkoto.id
sabiki.types << kozima.id
sabiki.types << huke.id
sabiki.types << konnbinato.id
sabiki.types << suke.id
sabiki.types << yumi.id

rua.types << kamomeoohashi.id
rua.types << kosumo.id
rua.types << zinkoto.id
rua.types << kozima.id
rua.types << huke.id
rua.types << konnbinato.id
rua.types << rinku.id
rua.types << suke.id
rua.types << yumi.id

uki.types << kamomeoohashi.id
uki.types << zinkoto.id
uki.types << suiro.id
uki.types << kozima.id
uki.types << konnbinato.id
uki.types << suke.id
uki.types << yumi.id

nage.types << zinkoto.id
nage.types << suiro.id
nage.types << huke.id

kago.types << zinkoto.id
kago.types << kozima.id

bukkomi.types << kamomeoohashi.id
bukkomi.types << kosumo.id
bukkomi.types << zinkoto.id
bukkomi.types << suiro.id
bukkomi.types << kozima.id
bukkomi.types << huke.id
bukkomi.types << rinku.id
bukkomi.types << konnbinato.id
bukkomi.types << suke.id
bukkomi.types << yumi.id

dotuki.types << zinkoto.id
dotuki.types << kozima.id
dotuki.types << konnbinato.id
dotuki.types << suke.id
dotuki.types << yumi.id

oyogase.types << kamomeoohashi.id
oyogase.types << zinkoto.id
oyogase.types << kozima.id