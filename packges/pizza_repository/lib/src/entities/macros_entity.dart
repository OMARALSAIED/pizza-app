class MacrosEntity {
  int calories;
  int proteins;
  int fat;
  int carbs;

  MacrosEntity(
      {required this.calories,
      required this.proteins,
      required this.fat,
      required this.carbs});


      Map<String, Object> toJson() {
    return {
       "calories" :calories,
  "proteins": proteins,
  "fat" :fat,
  "carbs": carbs,
    };
  }

  static MacrosEntity fromJson(Map<String, dynamic> doc) {
    return MacrosEntity(
      calories :doc['calories'],
  proteins:doc ['proteins'],
  fat :doc['fat'],
  carbs:doc['carbs'],);
  }
}
