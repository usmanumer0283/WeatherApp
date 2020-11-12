import 'package:flutter/material.dart';
import 'package:flutter_app/WeatherBloc.dart';
import 'package:flutter_app/WeatherModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/WeatherRepo.dart';

import 'WeatherBloc.dart';

import 'WeatherModel.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,


          body:Center(
            child: BlocProvider(
              builder: (context) => WeatherBloc(WeatherRepo()),
              child: SearchPage(),
            ),

          )
        )
    );
  }
}




class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        BlocBuilder<WeatherBloc,WeatherState >(
          builder: (context, state){
            if(state is WeatherIsNotSearched)
              return Container(
                padding: EdgeInsets.only(left: 32, right: 32,),
                child: Column(
                  children: <Widget>[
                    Text("Weather App", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black),),
                    SizedBox(height: 24,),
                    TextFormField(

                      controller: cityController,
                      decoration: InputDecoration(
                        prefixIcon:IconButton(
                          color: Colors.black,
                          onPressed:(){
                            weatherBloc.add(FetchWeather(cityController.text));
                          } ,
                          icon: Icon(Icons.search),

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid
                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid
                            )
                        ),

                        hintText: "City Name",
                        hintStyle: TextStyle(color: Colors.black),

                      ),
                      style: TextStyle(color: Colors.black),


                    ),




                  ],
                ),
              );
            else if(state is WeatherIsLoading)
              return Center(child : CircularProgressIndicator());
            else if(state is WeatherIsLoaded)
              return ShowWeather(state.getWeather, cityController.text);
            else
              return Text("Ooops...something went wrong",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)
              );
          },
        )

      ],
    );
  }
}


class ShowWeather extends StatelessWidget {
  WeatherModel weatherModel;
  final city;
  double image;


  ShowWeather(this.weatherModel, this.city);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    var description =weatherModel.weather.toList(growable: true);


    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      padding: EdgeInsets.only(right: 20, left: 20, top: 30),
      child: ListView(

        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[

                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 3, horizontal: 3),
                    filled: true,
                    fillColor: Colors.white,

                    prefixIcon: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        weatherBloc.add(FetchWeather(cityController.text));
                      },
                      icon: Icon(Icons.search),

                    ),
                    enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid
                        )
                    ),
                    hintText: "City Name",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text(weatherModel.name.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Text("📍" +
                      weatherModel.coord.lon + " , " + weatherModel.coord.lat,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            weatherModel.main.getTemp.round().toString() + "°ᶜ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                         Text("Feels Like  " + weatherModel.main.getfeelsLike.round().toString() + " °ᶜ",
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: 12
                           ),
                         ),

                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text("Min:" + weatherModel.main.getmin.round().toString() + " °ᶜ", style: TextStyle(color: Colors
                              .black, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text("Max:" + weatherModel.main.getmax.round().toString() + " °ᶜ", style: TextStyle(color: Colors
                              .black, fontSize: 16),),
                        ),

                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:60.0),
                      child: Text(weatherModel.weather[0].description.isEmpty ?? true ? 'Hello World'
                          : weatherModel.weather[0].description.toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),

                  ],
                ),


              ),
            ],
          ),
        ],
      ),
    );

  }
}



