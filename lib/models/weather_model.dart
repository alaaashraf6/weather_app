class Welcome {
    String cod;
    int message;
    int cnt;
    List<ListElement> list;
    City city;

    Welcome({
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city,
    });

}

class City {
    int id;
    String name;
    Coord coord;
    String country;
    int population;
    int timezone;
    int sunrise;
    int sunset;

    City({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

}

class Coord {
    double lat;
    double lon;

    Coord({
        required this.lat,
        required this.lon,
    });

}

class ListElement {
    int dt;
    MainClass main;
    List<WeatherObj> weather;
    Clouds clouds;
    Wind wind;
    int visibility;
    int pop;
    Sys sys;
    DateTime dtTxt;

    ListElement({
        required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dtTxt,
    });

}

class Clouds {
    int all;

    Clouds({
        required this.all,
    });

}

class MainClass {
    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int seaLevel;
    int grndLevel;
    int humidity;
    double tempKf;

    MainClass({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf,
    });

}

class Sys {
    Pod pod;

    Sys({
        required this.pod,
    });

}

enum Pod {
    D,
    N
}

class WeatherObj {
    int id;
    MainEnum main;
    Description description;
    Icon icon;

    WeatherObj({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

}

enum Description {
    BROKEN_CLOUDS,
    CLEAR_SKY,
    FEW_CLOUDS,
    SCATTERED_CLOUDS
}

enum Icon {
    THE_01_D,
    THE_01_N,
    THE_02_N,
    THE_03_D,
    THE_03_N,
    THE_04_D
}

enum MainEnum {
    CLEAR,
    CLOUDS
}

class Wind {
    double speed;
    int deg;
    double gust;

    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

}
