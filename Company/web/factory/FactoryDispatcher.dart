part of Factory;

class FactoryDispatcher {
  void dispatch(type,values){
      switch(type){
        case "car":
                    return new Car();
                    break;
      }
  }
}
