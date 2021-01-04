// 天気予報
{
  $(function() {
    var apikey = gon.api_key;
    var city = 'Osaka';
    var url = '//api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&lang=ja&units=metric&APPID=' + apikey;
    $.ajax({
      url: url,
      dataType: "json",
      type: 'GET',
    })
    .done(function(data) {
      var insertHTML = "";
      var cityName = '<h2>' + "大阪の天気" + '</h2>';
      $('#city-name').html(cityName);
      for (var i = 0; i <= 8; i = i + 2) {
        insertHTML += buildHTML(data, i);
      }
      $('#weather').html(insertHTML);
    })
    .fail(function(data) {
      console.log("失敗しました");
    });
  });

  function weatherJavaneseConversion(name) {
    switch (name) {
      case "Clear":
        return "晴れ"
      case 'Clouds':
        return "曇り"
      case "Rain":
        return "雨"
      case "Snow":
        return "雪"
      default:
        console.log(name)
        return name
    }
  }

  function buildHTML(data, i) {
    var Week = new Array("（日）","（月）","（火）","（水）","（木）","（金）","（土）");
    var date = new Date (data.list[i].dt_txt);
    date.setHours(date.getHours() + 9);
    var month = date.getMonth()+1;
    var day = month + "月" + date.getDate() + "日" + Week[date.getDay()] + date.getHours() + "：00";
    var icon = data.list[i].weather[0].icon;
    var main = weatherJavaneseConversion(data.list[i].weather[0].main);
    var html =
    '<div class="weather-report">' +
      '<img class="weather-icon" src="http://openweathermap.org/img/w/' + icon + '.png">' +
      '<div class="weather-date">' + day + '</div>' +
      '<div class="weather-main">'+ main + '</div>' +
      '<div class="weather-temp">' + Math.round(data.list[i].main.temp) + '℃</div>' +
    '</div>'
    return html
  }
}