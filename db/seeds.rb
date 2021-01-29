d1 = District.create(name: '南港', latitude: 34.6261, longitude: 135.419)
s1 = d1.spots.create(name: 'かもめ大橋', explanation: 'かもめ大橋の下に位置する波止が釣り場である。内側はアジやクロダイ、外側はハマチなどの青物が狙える。秋になると、外側から内側の順にタチウオが釣れ始める。', address: '〒559-0032 大阪府大阪市住之江区南港南５丁目', latitude: 34.6114, longitude: 135.419)
s2 = d1.spots.create(name: 'シーサイトコスモ', explanation: 'コスモスクエア駅出入口のすぐ右方向に位置し、電車でのアクセスが良い。根魚や青物、タチウオ、シーバスなど幅広い魚が釣れる。柵があり、お子様連れのご家族でも安心して釣りを行える。一部、釣り禁止区域が存在する。', address: '〒559-0034 大阪府大阪市住之江区南港北1丁目32', latitude: 34.6114, longitude: 135.419)
d2 = District.create(name: '貝塚人工島', latitude: 34.6361, longitude: 135.319)
f1 = FishingType.create(name: 'サビキ釣り', content: 'サビキを使う釣り方。')
f2 = FishingType.create(name: 'ウキ釣り', content: 'ウキを使う釣り方。')
s1.fishing_types << f1