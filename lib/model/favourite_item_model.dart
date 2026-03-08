import 'package:equatable/equatable.dart';

class FavouriteItemModel  extends Equatable{
  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false
});
  final String id;
  final int value;
  final bool isDeleting;
  final bool isFavourite;


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}