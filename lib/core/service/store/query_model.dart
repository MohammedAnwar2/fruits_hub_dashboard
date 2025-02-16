enum QueryConstants {
  orderBy,
  descending,
  limit,
  where,
}

enum QueryWhereConstants {
  field,
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  whereNotIn,
}

class QueryModel {
  String? orderBy;
  bool? descending;
  int? limit;
  List<WhereFilter>? where; // Now a list instead of a single filter

  QueryModel({this.orderBy, this.descending, this.limit, this.where});

  Map<String, dynamic> toMap() {
    return {
      if (orderBy != null) QueryConstants.orderBy.name: orderBy,
      if (descending != null) QueryConstants.descending.name: descending,
      if (limit != null) QueryConstants.limit.name: limit,
      if (where != null)
        QueryConstants.where.name: where!.map((e) => e.toMap()).toList(),
    };
  }
}

class WhereFilter {
  String field;
  Object? isEqualTo;
  Object? isNotEqualTo;
  num? isLessThan;
  num? isGreaterThan;
  num? isLessThanOrEqualTo;
  num? isGreaterThanOrEqualTo;
  Object? arrayContains;
  List<Object>? arrayContainsAny;
  List<Object>? whereIn;
  List<Object>? whereNotIn;

  WhereFilter({
    required this.field,
    this.isEqualTo,
    this.isNotEqualTo,
    this.isGreaterThan,
    this.isLessThan,
    this.isGreaterThanOrEqualTo,
    this.isLessThanOrEqualTo,
    this.arrayContains,
    this.arrayContainsAny,
    this.whereIn,
    this.whereNotIn,
  });

  Map<String, dynamic> toMap() {
    return {
      QueryWhereConstants.field.name: field,
      if (isEqualTo != null) QueryWhereConstants.isEqualTo.name: isEqualTo,
      if (isNotEqualTo != null)
        QueryWhereConstants.isNotEqualTo.name: isNotEqualTo,
      if (isGreaterThan != null)
        QueryWhereConstants.isGreaterThan.name: isGreaterThan,
      if (isLessThan != null) QueryWhereConstants.isLessThan.name: isLessThan,
      if (isGreaterThanOrEqualTo != null)
        QueryWhereConstants.isGreaterThanOrEqualTo.name: isGreaterThanOrEqualTo,
      if (isLessThanOrEqualTo != null)
        QueryWhereConstants.isLessThanOrEqualTo.name: isLessThanOrEqualTo,
      if (arrayContains != null)
        QueryWhereConstants.arrayContains.name: arrayContains,
      if (arrayContainsAny != null)
        QueryWhereConstants.arrayContainsAny.name: arrayContainsAny,
      if (whereIn != null) QueryWhereConstants.whereIn.name: whereIn,
      if (whereNotIn != null) QueryWhereConstants.whereNotIn.name: whereNotIn,
    };
  }
}

// enum QueryConstants {
//   orderBy,
//   descending,
//   limit,
//   where,
// }

// enum QueryWhereConstants {
//   field,
//   isEqualTo,
//   isNotEqualTo,
//   isLessThan,
//   isLessThanOrEqualTo,
//   isGreaterThan,
//   isGreaterThanOrEqualTo,
//   arrayContains,
//   arrayContainsAny,
//   whereIn,
//   whereNotIn,
// }

// class QueryModel {
//   String? orderBy;
//   bool? descending;
//   int? limit;
//   WhereFilter? where;

//   QueryModel({this.orderBy, this.descending, this.limit, this.where});

//   Map<String, dynamic> toMap() {
//     return {
//       QueryConstants.orderBy.name: orderBy,
//       QueryConstants.descending.name: descending,
//       QueryConstants.limit.name: limit,
//       QueryConstants.where.name: where?.toMap(),
//     };
//   }
// }

// class WhereFilter {
//   String field;
//   Object? isEqualTo;
//   Object? isNotEqualTo;
//   num? isLessThan;
//   num? isGreaterThan;
//   num? isLessThanOrEqualTo;
//   num? isGreaterThanOrEqualTo;
//   Object? arrayContains;
//   List<Object>? arrayContainsAny;
//   List<Object>? whereIn;
//   List<Object>? whereNotIn;

//   WhereFilter({
//     required this.field,
//     this.isEqualTo,
//     this.isNotEqualTo,
//     this.isGreaterThan,
//     this.isLessThan,
//     this.isGreaterThanOrEqualTo,
//     this.isLessThanOrEqualTo,
//     this.arrayContains,
//     this.arrayContainsAny,
//     this.whereIn,
//     this.whereNotIn,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       QueryWhereConstants.field.name: field,
//       QueryWhereConstants.isEqualTo.name: isEqualTo,
//       QueryWhereConstants.isGreaterThan.name: isGreaterThan,
//       QueryWhereConstants.isLessThan.name: isLessThan,
//       QueryWhereConstants.isNotEqualTo.name: isNotEqualTo,
//       QueryWhereConstants.isGreaterThanOrEqualTo.name: isGreaterThanOrEqualTo,
//       QueryWhereConstants.isLessThanOrEqualTo.name: isLessThanOrEqualTo,
//       QueryWhereConstants.arrayContains.name: arrayContains,
//       QueryWhereConstants.arrayContainsAny.name: arrayContainsAny,
//       QueryWhereConstants.whereIn.name: whereIn,
//       QueryWhereConstants.whereNotIn.name: whereNotIn
//     };
//   }
// }

// class WhereFilter {
//   String field;
//   dynamic isEqualTo;
//   dynamic isNotEqualTo;
//   dynamic isLessThan;
//   dynamic isGreaterThan;
//   dynamic isLessThanOrEqualTo;
//   dynamic isGreaterThanOrEqualTo;
//   dynamic arrayContains;
//   dynamic arrayContainsAny;
//   dynamic whereIn;
//   dynamic whereNotIn;

//   WhereFilter({
//     required this.field,
//     this.isEqualTo,
//     this.isGreaterThan,
//     this.isLessThan,
//     this.isNotEqualTo,
//     this.isGreaterThanOrEqualTo,
//     this.isLessThanOrEqualTo,
//     this.arrayContains,
//     this.arrayContainsAny,
//     this.whereIn,
//     this.whereNotIn,
//   });

  // Map<String, dynamic> toMap() {
  //   return {
  //     QueryWhereConstants.field.name: field,
  //     QueryWhereConstants.isEqualTo.name: isEqualTo,
  //     QueryWhereConstants.isGreaterThan.name: isGreaterThan,
  //     QueryWhereConstants.isLessThan.name: isLessThan,
  //     QueryWhereConstants.isNotEqualTo.name: isNotEqualTo,
  //     QueryWhereConstants.isGreaterThanOrEqualTo.name: isGreaterThanOrEqualTo,
  //     QueryWhereConstants.isLessThanOrEqualTo.name: isLessThanOrEqualTo,
  //     QueryWhereConstants.arrayContains.name: arrayContains,
  //     QueryWhereConstants.arrayContainsAny.name: arrayContainsAny,
  //     QueryWhereConstants.whereIn.name: whereIn,
  //     QueryWhereConstants.whereNotIn.name: whereNotIn
  //   };
  // }
// }
