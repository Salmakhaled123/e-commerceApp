part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final List<ProductItemModel>resultsList;
  SearchSuccess(this.resultsList);
}
class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure(this.errorMessage);
}
class EmptySearch extends SearchState{}


