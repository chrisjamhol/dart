library Office;

class Office {
  String name;
  num employees;

  Office(this.name,this.employees);

  String toString(){
    return 'Office -> name: ${this.name} emp: ${this.employees}';
  }
}
