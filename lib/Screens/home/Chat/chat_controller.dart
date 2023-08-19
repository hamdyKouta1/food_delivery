import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../Cache Helper/cache_helper.dart';
import '../../../Models/people_model.dart';
import '../../../Services/fire_base_services.dart';

class PeopleController extends GetxController {
  Services peopleServ = Services();
  List listOfAllPeople = [];
  bool dataEmpty = true;
  var checking = false;

  @override
  void onInit() {
    super.onInit();
    listOfAllPeople.clear();
    getPeople();
  }

  getPeople() async {
    checking = true;
    listOfAllPeople.clear();
    var email = await CacheHelper.getFromSharedPreferences('email');
    var support = await CacheHelper.getFromSharedPreferences('support');
    print(email);
    print(support);
    if (email == support) {
      listOfAllPeople.clear();
      String greatPath = 'people-support';
      await peopleServ.cloudStore
          .collection(greatPath)
          .get()
          .then((querySnapshot) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          listOfAllPeople.add(
              PeopleModel.fromJson(querySnapshot.docs.elementAt(i).data()));
        }
      });
    } else {
      listOfAllPeople.clear();
      var value = {'email': support, 'name': 'support'};
      listOfAllPeople.add(PeopleModel.fromJson(value));
    }

    checking = false;
    dataEmpty = false;
    update();
  }
}
