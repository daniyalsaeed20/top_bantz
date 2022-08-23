import 'dart:convert';
/// data : [{"id":271,"active":true,"type":"domestic","legacy_id":43,"country_id":320,"logo_path":"https://cdn.sportmonks.com/images/soccer/leagues/271.png","name":"Superliga","is_cup":false,"is_friendly":false,"current_season_id":19686,"current_round_id":274233,"current_stage_id":77457696,"live_standings":true,"coverage":{"predictions":true,"topscorer_goals":true,"topscorer_assists":true,"topscorer_cards":true}},{"id":501,"active":true,"type":"domestic","legacy_id":66,"country_id":1161,"logo_path":"https://cdn.sportmonks.com/images/soccer/leagues/501.png","name":"Premiership","is_cup":false,"is_friendly":false,"current_season_id":19735,"current_round_id":274714,"current_stage_id":77457866,"live_standings":true,"coverage":{"predictions":true,"topscorer_goals":true,"topscorer_assists":true,"topscorer_cards":true}},{"id":513,"active":true,"type":"domestic","legacy_id":null,"country_id":1161,"logo_path":"https://cdn.sportmonks.com/images/soccer/leagues/1/513.png","name":"Premiership Play-Offs","is_cup":false,"is_friendly":false,"current_season_id":19611,"current_round_id":null,"current_stage_id":null,"live_standings":false,"coverage":{"predictions":true,"topscorer_goals":true,"topscorer_assists":true,"topscorer_cards":true}},{"id":1659,"active":true,"type":"domestic","legacy_id":null,"country_id":320,"logo_path":"https://cdn.sportmonks.com/images//soccer/leagues/27/1659.png","name":"Superliga Play-offs","is_cup":false,"is_friendly":false,"current_season_id":18101,"current_round_id":null,"current_stage_id":null,"live_standings":false,"coverage":{"predictions":true,"topscorer_goals":true,"topscorer_assists":true,"topscorer_cards":true}}]
/// meta : {"plans":[{"name":"Football Free Plan","features":"Standard","price_monthly":"0.00","price_yearly":"0.00","request_limit":"180,60","sport":"Soccer"}],"sports":[{"id":1,"name":"Soccer","current":true}],"pagination":{"total":4,"count":4,"per_page":100,"current_page":1,"total_pages":1,"links":{}}}

LiveScore liveScoreFromJson(String str) => LiveScore.fromJson(json.decode(str));
String liveScoreToJson(LiveScore data) => json.encode(data.toJson());
class LiveScore {
  LiveScore({
      List<Data>? data, 
      Meta? meta,}){
    _data = data;
    _meta = meta;
}

  LiveScore.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Data>? _data;
  Meta? _meta;
LiveScore copyWith({  List<Data>? data,
  Meta? meta,
}) => LiveScore(  data: data ?? _data,
  meta: meta ?? _meta,
);
  List<Data>? get data => _data;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// plans : [{"name":"Football Free Plan","features":"Standard","price_monthly":"0.00","price_yearly":"0.00","request_limit":"180,60","sport":"Soccer"}]
/// sports : [{"id":1,"name":"Soccer","current":true}]
/// pagination : {"total":4,"count":4,"per_page":100,"current_page":1,"total_pages":1,"links":{}}

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      List<Plans>? plans, 
      List<Sports>? sports, 
      Pagination? pagination,}){
    _plans = plans;
    _sports = sports;
    _pagination = pagination;
}

  Meta.fromJson(dynamic json) {
    if (json['plans'] != null) {
      _plans = [];
      json['plans'].forEach((v) {
        _plans?.add(Plans.fromJson(v));
      });
    }
    if (json['sports'] != null) {
      _sports = [];
      json['sports'].forEach((v) {
        _sports?.add(Sports.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Plans>? _plans;
  List<Sports>? _sports;
  Pagination? _pagination;
Meta copyWith({  List<Plans>? plans,
  List<Sports>? sports,
  Pagination? pagination,
}) => Meta(  plans: plans ?? _plans,
  sports: sports ?? _sports,
  pagination: pagination ?? _pagination,
);
  List<Plans>? get plans => _plans;
  List<Sports>? get sports => _sports;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_plans != null) {
      map['plans'] = _plans?.map((v) => v.toJson()).toList();
    }
    if (_sports != null) {
      map['sports'] = _sports?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

/// total : 4
/// count : 4
/// per_page : 100
/// current_page : 1
/// total_pages : 1
/// links : {}

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      num? total, 
      num? count, 
      num? perPage, 
      num? currentPage, 
      num? totalPages, 
      dynamic links,}){
    _total = total;
    _count = count;
    _perPage = perPage;
    _currentPage = currentPage;
    _totalPages = totalPages;
    _links = links;
}

  Pagination.fromJson(dynamic json) {
    _total = json['total'];
    _count = json['count'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _totalPages = json['total_pages'];
    _links = json['links'];
  }
  num? _total;
  num? _count;
  num? _perPage;
  num? _currentPage;
  num? _totalPages;
  dynamic _links;
Pagination copyWith({  num? total,
  num? count,
  num? perPage,
  num? currentPage,
  num? totalPages,
  dynamic links,
}) => Pagination(  total: total ?? _total,
  count: count ?? _count,
  perPage: perPage ?? _perPage,
  currentPage: currentPage ?? _currentPage,
  totalPages: totalPages ?? _totalPages,
  links: links ?? _links,
);
  num? get total => _total;
  num? get count => _count;
  num? get perPage => _perPage;
  num? get currentPage => _currentPage;
  num? get totalPages => _totalPages;
  dynamic get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['count'] = _count;
    map['per_page'] = _perPage;
    map['current_page'] = _currentPage;
    map['total_pages'] = _totalPages;
    map['links'] = _links;
    return map;
  }

}

/// id : 1
/// name : "Soccer"
/// current : true

Sports sportsFromJson(String str) => Sports.fromJson(json.decode(str));
String sportsToJson(Sports data) => json.encode(data.toJson());
class Sports {
  Sports({
      num? id, 
      String? name, 
      bool? current,}){
    _id = id;
    _name = name;
    _current = current;
}

  Sports.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _current = json['current'];
  }
  num? _id;
  String? _name;
  bool? _current;
Sports copyWith({  num? id,
  String? name,
  bool? current,
}) => Sports(  id: id ?? _id,
  name: name ?? _name,
  current: current ?? _current,
);
  num? get id => _id;
  String? get name => _name;
  bool? get current => _current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['current'] = _current;
    return map;
  }

}

/// name : "Football Free Plan"
/// features : "Standard"
/// price_monthly : "0.00"
/// price_yearly : "0.00"
/// request_limit : "180,60"
/// sport : "Soccer"

Plans plansFromJson(String str) => Plans.fromJson(json.decode(str));
String plansToJson(Plans data) => json.encode(data.toJson());
class Plans {
  Plans({
      String? name, 
      String? features, 
      String? priceMonthly, 
      String? priceYearly, 
      String? requestLimit, 
      String? sport,}){
    _name = name;
    _features = features;
    _priceMonthly = priceMonthly;
    _priceYearly = priceYearly;
    _requestLimit = requestLimit;
    _sport = sport;
}

  Plans.fromJson(dynamic json) {
    _name = json['name'];
    _features = json['features'];
    _priceMonthly = json['price_monthly'];
    _priceYearly = json['price_yearly'];
    _requestLimit = json['request_limit'];
    _sport = json['sport'];
  }
  String? _name;
  String? _features;
  String? _priceMonthly;
  String? _priceYearly;
  String? _requestLimit;
  String? _sport;
Plans copyWith({  String? name,
  String? features,
  String? priceMonthly,
  String? priceYearly,
  String? requestLimit,
  String? sport,
}) => Plans(  name: name ?? _name,
  features: features ?? _features,
  priceMonthly: priceMonthly ?? _priceMonthly,
  priceYearly: priceYearly ?? _priceYearly,
  requestLimit: requestLimit ?? _requestLimit,
  sport: sport ?? _sport,
);
  String? get name => _name;
  String? get features => _features;
  String? get priceMonthly => _priceMonthly;
  String? get priceYearly => _priceYearly;
  String? get requestLimit => _requestLimit;
  String? get sport => _sport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['features'] = _features;
    map['price_monthly'] = _priceMonthly;
    map['price_yearly'] = _priceYearly;
    map['request_limit'] = _requestLimit;
    map['sport'] = _sport;
    return map;
  }

}

/// id : 271
/// active : true
/// type : "domestic"
/// legacy_id : 43
/// country_id : 320
/// logo_path : "https://cdn.sportmonks.com/images/soccer/leagues/271.png"
/// name : "Superliga"
/// is_cup : false
/// is_friendly : false
/// current_season_id : 19686
/// current_round_id : 274233
/// current_stage_id : 77457696
/// live_standings : true
/// coverage : {"predictions":true,"topscorer_goals":true,"topscorer_assists":true,"topscorer_cards":true}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      bool? active, 
      String? type, 
      num? legacyId, 
      num? countryId, 
      String? logoPath, 
      String? name, 
      bool? isCup, 
      bool? isFriendly, 
      num? currentSeasonId, 
      num? currentRoundId, 
      num? currentStageId, 
      bool? liveStandings, 
      Coverage? coverage,}){
    _id = id;
    _active = active;
    _type = type;
    _legacyId = legacyId;
    _countryId = countryId;
    _logoPath = logoPath;
    _name = name;
    _isCup = isCup;
    _isFriendly = isFriendly;
    _currentSeasonId = currentSeasonId;
    _currentRoundId = currentRoundId;
    _currentStageId = currentStageId;
    _liveStandings = liveStandings;
    _coverage = coverage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _active = json['active'];
    _type = json['type'];
    _legacyId = json['legacy_id'];
    _countryId = json['country_id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _isCup = json['is_cup'];
    _isFriendly = json['is_friendly'];
    _currentSeasonId = json['current_season_id'];
    _currentRoundId = json['current_round_id'];
    _currentStageId = json['current_stage_id'];
    _liveStandings = json['live_standings'];
    _coverage = json['coverage'] != null ? Coverage.fromJson(json['coverage']) : null;
  }
  num? _id;
  bool? _active;
  String? _type;
  num? _legacyId;
  num? _countryId;
  String? _logoPath;
  String? _name;
  bool? _isCup;
  bool? _isFriendly;
  num? _currentSeasonId;
  num? _currentRoundId;
  num? _currentStageId;
  bool? _liveStandings;
  Coverage? _coverage;
Data copyWith({  num? id,
  bool? active,
  String? type,
  num? legacyId,
  num? countryId,
  String? logoPath,
  String? name,
  bool? isCup,
  bool? isFriendly,
  num? currentSeasonId,
  num? currentRoundId,
  num? currentStageId,
  bool? liveStandings,
  Coverage? coverage,
}) => Data(  id: id ?? _id,
  active: active ?? _active,
  type: type ?? _type,
  legacyId: legacyId ?? _legacyId,
  countryId: countryId ?? _countryId,
  logoPath: logoPath ?? _logoPath,
  name: name ?? _name,
  isCup: isCup ?? _isCup,
  isFriendly: isFriendly ?? _isFriendly,
  currentSeasonId: currentSeasonId ?? _currentSeasonId,
  currentRoundId: currentRoundId ?? _currentRoundId,
  currentStageId: currentStageId ?? _currentStageId,
  liveStandings: liveStandings ?? _liveStandings,
  coverage: coverage ?? _coverage,
);
  num? get id => _id;
  bool? get active => _active;
  String? get type => _type;
  num? get legacyId => _legacyId;
  num? get countryId => _countryId;
  String? get logoPath => _logoPath;
  String? get name => _name;
  bool? get isCup => _isCup;
  bool? get isFriendly => _isFriendly;
  num? get currentSeasonId => _currentSeasonId;
  num? get currentRoundId => _currentRoundId;
  num? get currentStageId => _currentStageId;
  bool? get liveStandings => _liveStandings;
  Coverage? get coverage => _coverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['active'] = _active;
    map['type'] = _type;
    map['legacy_id'] = _legacyId;
    map['country_id'] = _countryId;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['is_cup'] = _isCup;
    map['is_friendly'] = _isFriendly;
    map['current_season_id'] = _currentSeasonId;
    map['current_round_id'] = _currentRoundId;
    map['current_stage_id'] = _currentStageId;
    map['live_standings'] = _liveStandings;
    if (_coverage != null) {
      map['coverage'] = _coverage?.toJson();
    }
    return map;
  }

}

/// predictions : true
/// topscorer_goals : true
/// topscorer_assists : true
/// topscorer_cards : true

Coverage coverageFromJson(String str) => Coverage.fromJson(json.decode(str));
String coverageToJson(Coverage data) => json.encode(data.toJson());
class Coverage {
  Coverage({
      bool? predictions, 
      bool? topscorerGoals, 
      bool? topscorerAssists, 
      bool? topscorerCards,}){
    _predictions = predictions;
    _topscorerGoals = topscorerGoals;
    _topscorerAssists = topscorerAssists;
    _topscorerCards = topscorerCards;
}

  Coverage.fromJson(dynamic json) {
    _predictions = json['predictions'];
    _topscorerGoals = json['topscorer_goals'];
    _topscorerAssists = json['topscorer_assists'];
    _topscorerCards = json['topscorer_cards'];
  }
  bool? _predictions;
  bool? _topscorerGoals;
  bool? _topscorerAssists;
  bool? _topscorerCards;
Coverage copyWith({  bool? predictions,
  bool? topscorerGoals,
  bool? topscorerAssists,
  bool? topscorerCards,
}) => Coverage(  predictions: predictions ?? _predictions,
  topscorerGoals: topscorerGoals ?? _topscorerGoals,
  topscorerAssists: topscorerAssists ?? _topscorerAssists,
  topscorerCards: topscorerCards ?? _topscorerCards,
);
  bool? get predictions => _predictions;
  bool? get topscorerGoals => _topscorerGoals;
  bool? get topscorerAssists => _topscorerAssists;
  bool? get topscorerCards => _topscorerCards;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['predictions'] = _predictions;
    map['topscorer_goals'] = _topscorerGoals;
    map['topscorer_assists'] = _topscorerAssists;
    map['topscorer_cards'] = _topscorerCards;
    return map;
  }

}