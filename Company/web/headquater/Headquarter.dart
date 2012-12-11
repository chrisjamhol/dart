library Headquarter;
import '../office/Office.dart';
import '../factory/Factory.dart';
import 'dart:json';

class Headquarter {
    List<Office> offices;
    List<Factory> factories;


    Headquarter(){
      offices = new List();
      factories = new List();

      var officeConfig = JSON.parse('''{
                                              "BB":{"employees": "30"},
                                              "KA":{"employees": "10"},
                                              "USA":{"employees": "13"}
                                          }''');
        var factoryConfig = JSON.parse('''[
                                             "car":{"contingent": 500,"color": blue},
                                             "ship":{"contigent": 2},
                                             "truck": {"contigent": 30},
                                             "navi": {"contigent": 530},
                                             "naviSoftware": {"contigent": 1}
                                          ]''');

      buildOffices(officeConfig);
      buildFactories(factoryConfig);
    }

    void buildOffices(Map properties) {
      print("   builting offices");

      properties.forEach((name, attrs){
          offices.add(new Office(name,int.parse(attrs['employees'])));
      });

      offices.forEach((office){
          print(office.toString());
      });

      print("   offices build");
    }

    void buildFactories(Map properties){
        print("   building factories");

        var factoryDispatcher = new FactoryDispatcher();

        properties.forEach((type,values){
            factories.add(factoryDispatcher.dispatch(type,values));
        });



        print("  factories build");
    }


    /**BigBoss bigBoss;

    void hireBigBoss(){
        this.bigBoss = new BigBoss("Chris",50000);
    }**/
}
