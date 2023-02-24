import 'package:json_annotation/json_annotation.dart';

part 'coinbase_response.g.dart';

@JsonSerializable()
class CoinbaseResponse {
  CoinbaseResponse(this.price, this.productId);

  String price;
  @JsonKey(name: 'product_id')
  String productId;

  factory CoinbaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinbaseResponseToJson(this);
}
