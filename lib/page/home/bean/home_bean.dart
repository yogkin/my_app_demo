
/// totalCount : null
/// totalPage : null
/// pageSize : 10
/// count : 6
/// positionIndex : null
/// hasNext : true
/// dataList : [{"channelCode":"TB","uuid":"164820367442141210","uuidParentId":"164820367442141210","goodsId":"653553334917","goodsName":"皱新押揩甘怕宽窜湍倾郸录氓聊司氧分境禹尚","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":6,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 18:14:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}},{"channelCode":"TB","uuid":"164820072672473783","uuidParentId":"164820072672473783","goodsId":"653553334917","goodsName":"剃礼满挠慑袭淖蚁嚼颧堡弹慨膏擒翌肢溜劲覆","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":10,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 16:57:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}},{"channelCode":"TB","uuid":"164820072724171858","uuidParentId":"164820072724171858","goodsId":"653553334917","goodsName":"焊耘炒著名灾搔裤知场牌年蹬洁斑些属举逛焕","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":1,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 16:57:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}},{"channelCode":"TB","uuid":"164819964857468512","uuidParentId":"164819964857468512","goodsId":"653553334917","goodsName":"弗除爽忿惋戚捐岿扇甭鸭蒲暗买凄阵袁哨纸朝","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":1,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 16:57:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}},{"channelCode":"TB","uuid":"164819964807110535","uuidParentId":"164819964807110535","goodsId":"653553334917","goodsName":"秦慰窖伺押蜜括航露缨互遍盟兴贩飘唤吧蚀慰","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":5,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 16:57:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}},{"channelCode":"TB","uuid":"164819245225037002","uuidParentId":"164819245225037002","goodsId":"653553334917","goodsName":"憾吵使痉碴替朝砚耐寇谩棠页馅欠男陈提比担","goodsImg":"http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg","goodsNum":10,"paymentAmount":"11150.25","status":"1","commission":"7.08","firstCommission":"0","subsidy":"0","sourceCreateTime":"2022-03-25 13:56:58","sourceSettleTime":null,"privacy":false,"jump":true,"enableCopy":true,"isFirst":false,"isPlus":false,"isSelf":true,"isDeposit":false,"tbOrderType":1,"failCaseShow":null,"isLockCommission":null,"couponUrl":"","orderMarkUrl":"","extendProperty":{"isSuperRed":false}}]

class HomeBean{
  HomeBean({
    this.totalCount,
    this.totalPage,
    this.pageSize,
    this.count,
    this.positionIndex,
    this.hasNext,
    this.dataList,
  });

  HomeBean.fromJson(dynamic json) {
    totalCount = json['totalCount'];
    totalPage = json['totalPage'];
    pageSize = json['pageSize'];
    count = json['count'];
    positionIndex = json['positionIndex'];
    hasNext = json['hasNext'];
    if (json['dataList'] != null) {
      dataList = [];
      json['dataList'].forEach((v) {
        dataList.add(DataList.fromJson(v));
      });
    }
  }

  dynamic totalCount;
  dynamic totalPage;
  int pageSize;
  int count;
  dynamic positionIndex;
  bool hasNext;
  List<DataList> dataList;

  HomeBean copyWith({
    dynamic totalCount,
    dynamic totalPage,
    int pageSize,
    int count,
    dynamic positionIndex,
    bool hasNext,
    List<DataList> dataList,
  }) =>
      HomeBean(
        totalCount: totalCount ?? this.totalCount,
        totalPage: totalPage ?? this.totalPage,
        pageSize: pageSize ?? this.pageSize,
        count: count ?? this.count,
        positionIndex: positionIndex ?? this.positionIndex,
        hasNext: hasNext ?? this.hasNext,
        dataList: dataList ?? this.dataList,
      );

  Map<String, HomeBean> toJson() {
    final map = <String, dynamic>{};
    map['totalCount'] = totalCount;
    map['totalPage'] = totalPage;
    map['pageSize'] = pageSize;
    map['count'] = count;
    map['positionIndex'] = positionIndex;
    map['hasNext'] = hasNext;
    if (dataList != null) {
      map['dataList'] = dataList.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// channelCode : "TB"
/// uuid : "164820367442141210"
/// uuidParentId : "164820367442141210"
/// goodsId : "653553334917"
/// goodsName : "皱新押揩甘怕宽窜湍倾郸录氓聊司氧分境禹尚"
/// goodsImg : "http://img.alicdn.com/tfscom/i4/3407072292/O1CN0145wpoN1SnmS37s9qW_!!3407072292.jpg_200x200.jpg"
/// goodsNum : 6
/// paymentAmount : "11150.25"
/// status : "1"
/// commission : "7.08"
/// firstCommission : "0"
/// subsidy : "0"
/// sourceCreateTime : "2022-03-25 18:14:58"
/// sourceSettleTime : null
/// privacy : false
/// jump : true
/// enableCopy : true
/// isFirst : false
/// isPlus : false
/// isSelf : true
/// isDeposit : false
/// tbOrderType : 1
/// failCaseShow : null
/// isLockCommission : null
/// couponUrl : ""
/// orderMarkUrl : ""
/// extendProperty : {"isSuperRed":false}

class DataList {
  DataList({
    this.channelCode,
    this.uuid,
    this.uuidParentId,
    this.goodsId,
    this.goodsName,
    this.goodsImg,
    this.goodsNum,
    this.paymentAmount,
    this.status,
    this.commission,
    this.firstCommission,
    this.subsidy,
    this.sourceCreateTime,
    this.sourceSettleTime,
    this.privacy,
    this.jump,
    this.enableCopy,
    this.isFirst,
    this.isPlus,
    this.isSelf,
    this.isDeposit,
    this.tbOrderType,
    this.failCaseShow,
    this.isLockCommission,
    this.couponUrl,
    this.orderMarkUrl,
    this.extendProperty,
  });

  DataList.fromJson(dynamic json) {
    channelCode = json['channelCode'];
    uuid = json['uuid'];
    uuidParentId = json['uuidParentId'];
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    goodsImg = json['goodsImg'];
    goodsNum = json['goodsNum'];
    paymentAmount = json['paymentAmount'];
    status = json['status'];
    commission = json['commission'];
    firstCommission = json['firstCommission'];
    subsidy = json['subsidy'];
    sourceCreateTime = json['sourceCreateTime'];
    sourceSettleTime = json['sourceSettleTime'];
    privacy = json['privacy'];
    jump = json['jump'];
    enableCopy = json['enableCopy'];
    isFirst = json['isFirst'];
    isPlus = json['isPlus'];
    isSelf = json['isSelf'];
    isDeposit = json['isDeposit'];
    tbOrderType = json['tbOrderType'];
    failCaseShow = json['failCaseShow'];
    isLockCommission = json['isLockCommission'];
    couponUrl = json['couponUrl'];
    orderMarkUrl = json['orderMarkUrl'];
    extendProperty = json['extendProperty'] != null
        ? ExtendProperty.fromJson(json['extendProperty'])
        : null;
  }

  String channelCode;
  String uuid;
  String uuidParentId;
  String goodsId;
  String goodsName;
  String goodsImg;
  int goodsNum;
  String paymentAmount;
  String status;
  String commission;
  String firstCommission;
  String subsidy;
  String sourceCreateTime;
  dynamic sourceSettleTime;
  bool privacy;
  bool jump;
  bool enableCopy;
  bool isFirst;
  bool isPlus;
  bool isSelf;
  bool isDeposit;
  int tbOrderType;
  dynamic failCaseShow;
  dynamic isLockCommission;
  String couponUrl;
  String orderMarkUrl;
  ExtendProperty extendProperty;

  DataList copyWith({
    String channelCode,
    String uuid,
    String uuidParentId,
    String goodsId,
    String goodsName,
    String goodsImg,
    int goodsNum,
    String paymentAmount,
    String status,
    String commission,
    String firstCommission,
    String subsidy,
    String sourceCreateTime,
    dynamic sourceSettleTime,
    bool privacy,
    bool jump,
    bool enableCopy,
    bool isFirst,
    bool isPlus,
    bool isSelf,
    bool isDeposit,
    int tbOrderType,
    dynamic failCaseShow,
    dynamic isLockCommission,
    String couponUrl,
    String orderMarkUrl,
    ExtendProperty extendProperty,
  }) =>
      DataList(
        channelCode: channelCode ?? this.channelCode,
        uuid: uuid ?? this.uuid,
        uuidParentId: uuidParentId ?? this.uuidParentId,
        goodsId: goodsId ?? this.goodsId,
        goodsName: goodsName ?? this.goodsName,
        goodsImg: goodsImg ?? this.goodsImg,
        goodsNum: goodsNum ?? this.goodsNum,
        paymentAmount: paymentAmount ?? this.paymentAmount,
        status: status ?? this.status,
        commission: commission ?? this.commission,
        firstCommission: firstCommission ?? this.firstCommission,
        subsidy: subsidy ?? this.subsidy,
        sourceCreateTime: sourceCreateTime ?? this.sourceCreateTime,
        sourceSettleTime: sourceSettleTime ?? this.sourceSettleTime,
        privacy: privacy ?? this.privacy,
        jump: jump ?? this.jump,
        enableCopy: enableCopy ?? this.enableCopy,
        isFirst: isFirst ?? this.isFirst,
        isPlus: isPlus ?? this.isPlus,
        isSelf: isSelf ?? this.isSelf,
        isDeposit: isDeposit ?? this.isDeposit,
        tbOrderType: tbOrderType ?? this.tbOrderType,
        failCaseShow: failCaseShow ?? this.failCaseShow,
        isLockCommission: isLockCommission ?? this.isLockCommission,
        couponUrl: couponUrl ?? this.couponUrl,
        orderMarkUrl: orderMarkUrl ?? this.orderMarkUrl,
        extendProperty: extendProperty ?? this.extendProperty,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelCode'] = channelCode;
    map['uuid'] = uuid;
    map['uuidParentId'] = uuidParentId;
    map['goodsId'] = goodsId;
    map['goodsName'] = goodsName;
    map['goodsImg'] = goodsImg;
    map['goodsNum'] = goodsNum;
    map['paymentAmount'] = paymentAmount;
    map['status'] = status;
    map['commission'] = commission;
    map['firstCommission'] = firstCommission;
    map['subsidy'] = subsidy;
    map['sourceCreateTime'] = sourceCreateTime;
    map['sourceSettleTime'] = sourceSettleTime;
    map['privacy'] = privacy;
    map['jump'] = jump;
    map['enableCopy'] = enableCopy;
    map['isFirst'] = isFirst;
    map['isPlus'] = isPlus;
    map['isSelf'] = isSelf;
    map['isDeposit'] = isDeposit;
    map['tbOrderType'] = tbOrderType;
    map['failCaseShow'] = failCaseShow;
    map['isLockCommission'] = isLockCommission;
    map['couponUrl'] = couponUrl;
    map['orderMarkUrl'] = orderMarkUrl;
    if (extendProperty != null) {
      map['extendProperty'] = extendProperty.toJson();
    }
    return map;
  }
}

/// isSuperRed : false

class ExtendProperty {
  ExtendProperty({
    this.isSuperRed,
  });

  ExtendProperty.fromJson(dynamic json) {
    isSuperRed = json['isSuperRed'];
  }

  bool isSuperRed;

  ExtendProperty copyWith({
    bool isSuperRed,
  }) =>
      ExtendProperty(
        isSuperRed: isSuperRed ?? this.isSuperRed,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuperRed'] = isSuperRed;
    return map;
  }
}
