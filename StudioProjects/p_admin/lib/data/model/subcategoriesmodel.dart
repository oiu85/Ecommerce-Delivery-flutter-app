class SubCategoriesModel {
  int? subcategoryId;
  String? subcategoryName;
  String? subcategoryNameAr;
  String? subcategoryImage;
  String? subcategoryDatetime;
  int? categoryId;
  String? categoriesName;
  String? categoriesNameAr;

  SubCategoriesModel(
      {this.subcategoryId,
        this.subcategoryName,
        this.subcategoryNameAr,
        this.subcategoryImage,
        this.subcategoryDatetime,
        this.categoryId,
        this.categoriesName,
        this.categoriesNameAr});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryNameAr = json['subcategory_name_ar'];
    subcategoryImage = json['subcategory_image'];
    subcategoryDatetime = json['subcategory_datetime'];
    categoryId = json['category_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['subcategory_name_ar'] = subcategoryNameAr;
    data['subcategory_image'] = subcategoryImage;
    data['subcategory_datetime'] = subcategoryDatetime;
    data['category_id'] = categoryId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    return data;
  }
}