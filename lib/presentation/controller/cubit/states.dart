abstract class AppStates {}

class AppInitialState extends AppStates {}

class GetWeatherLoadingState extends AppStates {}
class GetWeatherSuccessState extends AppStates {}
class GetWeatherErrorState extends AppStates {
  String error;
  GetWeatherErrorState(this.error);
}



















