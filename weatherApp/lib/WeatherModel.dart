class WeatherModel {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  String visibility;
  Wind wind;
  Clouds clouds;
  String dt;
  Sys sys;
  String timezone;
  String id;
  String name;
  String cod;

  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = json.putIfAbsent('coord', () => null) != null
        ? new Coord.fromJson(json.putIfAbsent('coord', () => null))
        : null;
    if (json.putIfAbsent('weather', () => null) != null) {
      weather = new List<Weather>();
      json.putIfAbsent('weather', () => []).forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }

    base = json.putIfAbsent('base', () => null).toString();
    main = json.putIfAbsent('main', () => null) != null
        ? new Main.fromJson(json.putIfAbsent('main', () => null))
        : null;
    visibility = json.putIfAbsent('visibility', () => null).toString();
    wind = json.putIfAbsent('wind', () => null) != null
        ? new Wind.fromJson(json.putIfAbsent('wind', () => null))
        : null;
    clouds = json.putIfAbsent('clouds', () => null) != null
        ? new Clouds.fromJson(json.putIfAbsent('clouds', () => null))
        : null;
    dt = json.putIfAbsent('dt', () => null).toString();
    sys = json.putIfAbsent('sys', () => null) != null
        ? new Sys.fromJson(json.putIfAbsent('sys', () => null))
        : null;
    timezone = json.putIfAbsent('timezone', () => null).toString();
    id = json.putIfAbsent('id', () => null).toString();
    name = json.putIfAbsent('name', () => null).toString();
    cod = json.putIfAbsent('cod', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['base'] = this.base;
    if (this.main != null) {
      data['main'] = this.main.toJson();
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

class Coord {
  String lon;
  String lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json.putIfAbsent('lon', () => null).toString();
    lat = json.putIfAbsent('lat', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
class Weather {
  String id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json.putIfAbsent('id', () => null).toString();
    main = json.putIfAbsent('main', () => null).toString();
    description = json.putIfAbsent('description', () => null).toString();
    icon = json.putIfAbsent('icon', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  String pressure;
  String humidity;


  double get getTemp => temp-272.5;
  double get getfeelsLike => feelsLike-272.5;
  double get getmin => tempMin-272.5;
  double get getmax => tempMax-272.5;
  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json.putIfAbsent('temp', () => null);
    feelsLike = json.putIfAbsent('feels_like', () => null);
    tempMin = json.putIfAbsent('temp_min', () => null);
    tempMax = json.putIfAbsent('temp_max', () => null);
    pressure = json.putIfAbsent('pressure', () => null).toString();
    humidity = json.putIfAbsent('humidity', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    return data;
  }
}

class Wind {
  String speed;
  String deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json.putIfAbsent('speed', () => null).toString();
    deg = json.putIfAbsent('deg', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}

class Clouds {
  String all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json.putIfAbsent('all', () => null).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys.fromJson(Map<String, dynamic> json) {
    country = json.putIfAbsent('country', () => null).toString();
    sunrise = json.putIfAbsent('sunrise', () => null);
    sunset = json.putIfAbsent('sunset', () => null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    return data;
  }
}

