class PriceTotalModel{

  String ? subTotal;
  String ? deliveryCharge;
  String ? discount;
  String ? total;

  PriceTotalModel({this.subTotal,this.deliveryCharge,this.discount,this.total});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['subTotal']=subTotal;
    map['deliveryCharge']=deliveryCharge;
    map['discount']=discount;
    map['total']=total;
    return map;
  }



}