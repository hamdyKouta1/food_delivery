class VoucherModel{

  String ? voucher;

  VoucherModel({this.voucher});

  Map<String,dynamic> toJason(){
    var map =<String,dynamic>{};
    map['voucher']=voucher;


    return map;


  }



}