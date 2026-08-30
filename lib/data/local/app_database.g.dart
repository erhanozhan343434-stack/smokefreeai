// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quitDateUtcMeta =
      const VerificationMeta('quitDateUtc');
  @override
  late final GeneratedColumn<DateTime> quitDateUtc = GeneratedColumn<DateTime>(
      'quit_date_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _productTypeMeta =
      const VerificationMeta('productType');
  @override
  late final GeneratedColumn<String> productType = GeneratedColumn<String>(
      'product_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitsPerDayMeta =
      const VerificationMeta('unitsPerDay');
  @override
  late final GeneratedColumn<double> unitsPerDay = GeneratedColumn<double>(
      'units_per_day', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitsPerPackMeta =
      const VerificationMeta('unitsPerPack');
  @override
  late final GeneratedColumn<int> unitsPerPack = GeneratedColumn<int>(
      'units_per_pack', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _packPriceMinorMeta =
      const VerificationMeta('packPriceMinor');
  @override
  late final GeneratedColumn<int> packPriceMinor = GeneratedColumn<int>(
      'pack_price_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
      'currency_code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 3),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        quitDateUtc,
        productType,
        unitsPerDay,
        unitsPerPack,
        packPriceMinor,
        currencyCode,
        countryCode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quit_date_utc')) {
      context.handle(
          _quitDateUtcMeta,
          quitDateUtc.isAcceptableOrUnknown(
              data['quit_date_utc']!, _quitDateUtcMeta));
    } else if (isInserting) {
      context.missing(_quitDateUtcMeta);
    }
    if (data.containsKey('product_type')) {
      context.handle(
          _productTypeMeta,
          productType.isAcceptableOrUnknown(
              data['product_type']!, _productTypeMeta));
    } else if (isInserting) {
      context.missing(_productTypeMeta);
    }
    if (data.containsKey('units_per_day')) {
      context.handle(
          _unitsPerDayMeta,
          unitsPerDay.isAcceptableOrUnknown(
              data['units_per_day']!, _unitsPerDayMeta));
    } else if (isInserting) {
      context.missing(_unitsPerDayMeta);
    }
    if (data.containsKey('units_per_pack')) {
      context.handle(
          _unitsPerPackMeta,
          unitsPerPack.isAcceptableOrUnknown(
              data['units_per_pack']!, _unitsPerPackMeta));
    } else if (isInserting) {
      context.missing(_unitsPerPackMeta);
    }
    if (data.containsKey('pack_price_minor')) {
      context.handle(
          _packPriceMinorMeta,
          packPriceMinor.isAcceptableOrUnknown(
              data['pack_price_minor']!, _packPriceMinorMeta));
    } else if (isInserting) {
      context.missing(_packPriceMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code']!, _currencyCodeMeta));
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      quitDateUtc: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}quit_date_utc'])!,
      productType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_type'])!,
      unitsPerDay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}units_per_day'])!,
      unitsPerPack: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}units_per_pack'])!,
      packPriceMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pack_price_minor'])!,
      currencyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_code'])!,
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code']),
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;

  /// DAİMA UTC. Gösterim yerel saatte yapılır; saklama asla.
  final DateTime quitDateUtc;

  /// ProductType enum'unun adı (cigarette, vape, hookah...).
  final String productType;
  final double unitsPerDay;
  final int unitsPerPack;

  /// Kuruş/cent — para asla double saklanmaz.
  final int packPriceMinor;
  final String currencyCode;
  final String? countryCode;
  const UserProfile(
      {required this.id,
      required this.quitDateUtc,
      required this.productType,
      required this.unitsPerDay,
      required this.unitsPerPack,
      required this.packPriceMinor,
      required this.currencyCode,
      this.countryCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quit_date_utc'] = Variable<DateTime>(quitDateUtc);
    map['product_type'] = Variable<String>(productType);
    map['units_per_day'] = Variable<double>(unitsPerDay);
    map['units_per_pack'] = Variable<int>(unitsPerPack);
    map['pack_price_minor'] = Variable<int>(packPriceMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || countryCode != null) {
      map['country_code'] = Variable<String>(countryCode);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      quitDateUtc: Value(quitDateUtc),
      productType: Value(productType),
      unitsPerDay: Value(unitsPerDay),
      unitsPerPack: Value(unitsPerPack),
      packPriceMinor: Value(packPriceMinor),
      currencyCode: Value(currencyCode),
      countryCode: countryCode == null && nullToAbsent
          ? const Value.absent()
          : Value(countryCode),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      quitDateUtc: serializer.fromJson<DateTime>(json['quitDateUtc']),
      productType: serializer.fromJson<String>(json['productType']),
      unitsPerDay: serializer.fromJson<double>(json['unitsPerDay']),
      unitsPerPack: serializer.fromJson<int>(json['unitsPerPack']),
      packPriceMinor: serializer.fromJson<int>(json['packPriceMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      countryCode: serializer.fromJson<String?>(json['countryCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quitDateUtc': serializer.toJson<DateTime>(quitDateUtc),
      'productType': serializer.toJson<String>(productType),
      'unitsPerDay': serializer.toJson<double>(unitsPerDay),
      'unitsPerPack': serializer.toJson<int>(unitsPerPack),
      'packPriceMinor': serializer.toJson<int>(packPriceMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'countryCode': serializer.toJson<String?>(countryCode),
    };
  }

  UserProfile copyWith(
          {int? id,
          DateTime? quitDateUtc,
          String? productType,
          double? unitsPerDay,
          int? unitsPerPack,
          int? packPriceMinor,
          String? currencyCode,
          Value<String?> countryCode = const Value.absent()}) =>
      UserProfile(
        id: id ?? this.id,
        quitDateUtc: quitDateUtc ?? this.quitDateUtc,
        productType: productType ?? this.productType,
        unitsPerDay: unitsPerDay ?? this.unitsPerDay,
        unitsPerPack: unitsPerPack ?? this.unitsPerPack,
        packPriceMinor: packPriceMinor ?? this.packPriceMinor,
        currencyCode: currencyCode ?? this.currencyCode,
        countryCode: countryCode.present ? countryCode.value : this.countryCode,
      );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      quitDateUtc:
          data.quitDateUtc.present ? data.quitDateUtc.value : this.quitDateUtc,
      productType:
          data.productType.present ? data.productType.value : this.productType,
      unitsPerDay:
          data.unitsPerDay.present ? data.unitsPerDay.value : this.unitsPerDay,
      unitsPerPack: data.unitsPerPack.present
          ? data.unitsPerPack.value
          : this.unitsPerPack,
      packPriceMinor: data.packPriceMinor.present
          ? data.packPriceMinor.value
          : this.packPriceMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      countryCode:
          data.countryCode.present ? data.countryCode.value : this.countryCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('quitDateUtc: $quitDateUtc, ')
          ..write('productType: $productType, ')
          ..write('unitsPerDay: $unitsPerDay, ')
          ..write('unitsPerPack: $unitsPerPack, ')
          ..write('packPriceMinor: $packPriceMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('countryCode: $countryCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quitDateUtc, productType, unitsPerDay,
      unitsPerPack, packPriceMinor, currencyCode, countryCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.quitDateUtc == this.quitDateUtc &&
          other.productType == this.productType &&
          other.unitsPerDay == this.unitsPerDay &&
          other.unitsPerPack == this.unitsPerPack &&
          other.packPriceMinor == this.packPriceMinor &&
          other.currencyCode == this.currencyCode &&
          other.countryCode == this.countryCode);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<DateTime> quitDateUtc;
  final Value<String> productType;
  final Value<double> unitsPerDay;
  final Value<int> unitsPerPack;
  final Value<int> packPriceMinor;
  final Value<String> currencyCode;
  final Value<String?> countryCode;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.quitDateUtc = const Value.absent(),
    this.productType = const Value.absent(),
    this.unitsPerDay = const Value.absent(),
    this.unitsPerPack = const Value.absent(),
    this.packPriceMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.countryCode = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime quitDateUtc,
    required String productType,
    required double unitsPerDay,
    required int unitsPerPack,
    required int packPriceMinor,
    required String currencyCode,
    this.countryCode = const Value.absent(),
  })  : quitDateUtc = Value(quitDateUtc),
        productType = Value(productType),
        unitsPerDay = Value(unitsPerDay),
        unitsPerPack = Value(unitsPerPack),
        packPriceMinor = Value(packPriceMinor),
        currencyCode = Value(currencyCode);
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<DateTime>? quitDateUtc,
    Expression<String>? productType,
    Expression<double>? unitsPerDay,
    Expression<int>? unitsPerPack,
    Expression<int>? packPriceMinor,
    Expression<String>? currencyCode,
    Expression<String>? countryCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quitDateUtc != null) 'quit_date_utc': quitDateUtc,
      if (productType != null) 'product_type': productType,
      if (unitsPerDay != null) 'units_per_day': unitsPerDay,
      if (unitsPerPack != null) 'units_per_pack': unitsPerPack,
      if (packPriceMinor != null) 'pack_price_minor': packPriceMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (countryCode != null) 'country_code': countryCode,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? quitDateUtc,
      Value<String>? productType,
      Value<double>? unitsPerDay,
      Value<int>? unitsPerPack,
      Value<int>? packPriceMinor,
      Value<String>? currencyCode,
      Value<String?>? countryCode}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      quitDateUtc: quitDateUtc ?? this.quitDateUtc,
      productType: productType ?? this.productType,
      unitsPerDay: unitsPerDay ?? this.unitsPerDay,
      unitsPerPack: unitsPerPack ?? this.unitsPerPack,
      packPriceMinor: packPriceMinor ?? this.packPriceMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quitDateUtc.present) {
      map['quit_date_utc'] = Variable<DateTime>(quitDateUtc.value);
    }
    if (productType.present) {
      map['product_type'] = Variable<String>(productType.value);
    }
    if (unitsPerDay.present) {
      map['units_per_day'] = Variable<double>(unitsPerDay.value);
    }
    if (unitsPerPack.present) {
      map['units_per_pack'] = Variable<int>(unitsPerPack.value);
    }
    if (packPriceMinor.present) {
      map['pack_price_minor'] = Variable<int>(packPriceMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('quitDateUtc: $quitDateUtc, ')
          ..write('productType: $productType, ')
          ..write('unitsPerDay: $unitsPerDay, ')
          ..write('unitsPerPack: $unitsPerPack, ')
          ..write('packPriceMinor: $packPriceMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('countryCode: $countryCode')
          ..write(')'))
        .toString();
  }
}

class $CravingLogsTable extends CravingLogs
    with TableInfo<$CravingLogsTable, CravingLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CravingLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _atUtcMeta = const VerificationMeta('atUtc');
  @override
  late final GeneratedColumn<DateTime> atUtc = GeneratedColumn<DateTime>(
      'at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _intensityMeta =
      const VerificationMeta('intensity');
  @override
  late final GeneratedColumn<int> intensity = GeneratedColumn<int>(
      'intensity', aliasedName, false,
      check: () => ComparableExpr(intensity).isBetweenValues(1, 10),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _cueMeta = const VerificationMeta('cue');
  @override
  late final GeneratedColumn<String> cue = GeneratedColumn<String>(
      'cue', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emotionMeta =
      const VerificationMeta('emotion');
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
      'emotion', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
      'place', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _copingMeta = const VerificationMeta('coping');
  @override
  late final GeneratedColumn<String> coping = GeneratedColumn<String>(
      'coping', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resistedMeta =
      const VerificationMeta('resisted');
  @override
  late final GeneratedColumn<bool> resisted = GeneratedColumn<bool>(
      'resisted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("resisted" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, atUtc, intensity, cue, emotion, place, coping, resisted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'craving_logs';
  @override
  VerificationContext validateIntegrity(Insertable<CravingLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('at_utc')) {
      context.handle(
          _atUtcMeta, atUtc.isAcceptableOrUnknown(data['at_utc']!, _atUtcMeta));
    } else if (isInserting) {
      context.missing(_atUtcMeta);
    }
    if (data.containsKey('intensity')) {
      context.handle(_intensityMeta,
          intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta));
    } else if (isInserting) {
      context.missing(_intensityMeta);
    }
    if (data.containsKey('cue')) {
      context.handle(
          _cueMeta, cue.isAcceptableOrUnknown(data['cue']!, _cueMeta));
    }
    if (data.containsKey('emotion')) {
      context.handle(_emotionMeta,
          emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta));
    }
    if (data.containsKey('place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['place']!, _placeMeta));
    }
    if (data.containsKey('coping')) {
      context.handle(_copingMeta,
          coping.isAcceptableOrUnknown(data['coping']!, _copingMeta));
    }
    if (data.containsKey('resisted')) {
      context.handle(_resistedMeta,
          resisted.isAcceptableOrUnknown(data['resisted']!, _resistedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CravingLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CravingLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      atUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at_utc'])!,
      intensity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intensity'])!,
      cue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cue']),
      emotion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emotion']),
      place: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place']),
      coping: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}coping']),
      resisted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}resisted'])!,
    );
  }

  @override
  $CravingLogsTable createAlias(String alias) {
    return $CravingLogsTable(attachedDatabase, alias);
  }
}

class CravingLog extends DataClass implements Insertable<CravingLog> {
  final int id;
  final DateTime atUtc;
  final int intensity;
  final String? cue;
  final String? emotion;
  final String? place;
  final String? coping;
  final bool resisted;
  const CravingLog(
      {required this.id,
      required this.atUtc,
      required this.intensity,
      this.cue,
      this.emotion,
      this.place,
      this.coping,
      required this.resisted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['at_utc'] = Variable<DateTime>(atUtc);
    map['intensity'] = Variable<int>(intensity);
    if (!nullToAbsent || cue != null) {
      map['cue'] = Variable<String>(cue);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || place != null) {
      map['place'] = Variable<String>(place);
    }
    if (!nullToAbsent || coping != null) {
      map['coping'] = Variable<String>(coping);
    }
    map['resisted'] = Variable<bool>(resisted);
    return map;
  }

  CravingLogsCompanion toCompanion(bool nullToAbsent) {
    return CravingLogsCompanion(
      id: Value(id),
      atUtc: Value(atUtc),
      intensity: Value(intensity),
      cue: cue == null && nullToAbsent ? const Value.absent() : Value(cue),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
      coping:
          coping == null && nullToAbsent ? const Value.absent() : Value(coping),
      resisted: Value(resisted),
    );
  }

  factory CravingLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CravingLog(
      id: serializer.fromJson<int>(json['id']),
      atUtc: serializer.fromJson<DateTime>(json['atUtc']),
      intensity: serializer.fromJson<int>(json['intensity']),
      cue: serializer.fromJson<String?>(json['cue']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      place: serializer.fromJson<String?>(json['place']),
      coping: serializer.fromJson<String?>(json['coping']),
      resisted: serializer.fromJson<bool>(json['resisted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'atUtc': serializer.toJson<DateTime>(atUtc),
      'intensity': serializer.toJson<int>(intensity),
      'cue': serializer.toJson<String?>(cue),
      'emotion': serializer.toJson<String?>(emotion),
      'place': serializer.toJson<String?>(place),
      'coping': serializer.toJson<String?>(coping),
      'resisted': serializer.toJson<bool>(resisted),
    };
  }

  CravingLog copyWith(
          {int? id,
          DateTime? atUtc,
          int? intensity,
          Value<String?> cue = const Value.absent(),
          Value<String?> emotion = const Value.absent(),
          Value<String?> place = const Value.absent(),
          Value<String?> coping = const Value.absent(),
          bool? resisted}) =>
      CravingLog(
        id: id ?? this.id,
        atUtc: atUtc ?? this.atUtc,
        intensity: intensity ?? this.intensity,
        cue: cue.present ? cue.value : this.cue,
        emotion: emotion.present ? emotion.value : this.emotion,
        place: place.present ? place.value : this.place,
        coping: coping.present ? coping.value : this.coping,
        resisted: resisted ?? this.resisted,
      );
  CravingLog copyWithCompanion(CravingLogsCompanion data) {
    return CravingLog(
      id: data.id.present ? data.id.value : this.id,
      atUtc: data.atUtc.present ? data.atUtc.value : this.atUtc,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      cue: data.cue.present ? data.cue.value : this.cue,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      place: data.place.present ? data.place.value : this.place,
      coping: data.coping.present ? data.coping.value : this.coping,
      resisted: data.resisted.present ? data.resisted.value : this.resisted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CravingLog(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('intensity: $intensity, ')
          ..write('cue: $cue, ')
          ..write('emotion: $emotion, ')
          ..write('place: $place, ')
          ..write('coping: $coping, ')
          ..write('resisted: $resisted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, atUtc, intensity, cue, emotion, place, coping, resisted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CravingLog &&
          other.id == this.id &&
          other.atUtc == this.atUtc &&
          other.intensity == this.intensity &&
          other.cue == this.cue &&
          other.emotion == this.emotion &&
          other.place == this.place &&
          other.coping == this.coping &&
          other.resisted == this.resisted);
}

class CravingLogsCompanion extends UpdateCompanion<CravingLog> {
  final Value<int> id;
  final Value<DateTime> atUtc;
  final Value<int> intensity;
  final Value<String?> cue;
  final Value<String?> emotion;
  final Value<String?> place;
  final Value<String?> coping;
  final Value<bool> resisted;
  const CravingLogsCompanion({
    this.id = const Value.absent(),
    this.atUtc = const Value.absent(),
    this.intensity = const Value.absent(),
    this.cue = const Value.absent(),
    this.emotion = const Value.absent(),
    this.place = const Value.absent(),
    this.coping = const Value.absent(),
    this.resisted = const Value.absent(),
  });
  CravingLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime atUtc,
    required int intensity,
    this.cue = const Value.absent(),
    this.emotion = const Value.absent(),
    this.place = const Value.absent(),
    this.coping = const Value.absent(),
    this.resisted = const Value.absent(),
  })  : atUtc = Value(atUtc),
        intensity = Value(intensity);
  static Insertable<CravingLog> custom({
    Expression<int>? id,
    Expression<DateTime>? atUtc,
    Expression<int>? intensity,
    Expression<String>? cue,
    Expression<String>? emotion,
    Expression<String>? place,
    Expression<String>? coping,
    Expression<bool>? resisted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (atUtc != null) 'at_utc': atUtc,
      if (intensity != null) 'intensity': intensity,
      if (cue != null) 'cue': cue,
      if (emotion != null) 'emotion': emotion,
      if (place != null) 'place': place,
      if (coping != null) 'coping': coping,
      if (resisted != null) 'resisted': resisted,
    });
  }

  CravingLogsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? atUtc,
      Value<int>? intensity,
      Value<String?>? cue,
      Value<String?>? emotion,
      Value<String?>? place,
      Value<String?>? coping,
      Value<bool>? resisted}) {
    return CravingLogsCompanion(
      id: id ?? this.id,
      atUtc: atUtc ?? this.atUtc,
      intensity: intensity ?? this.intensity,
      cue: cue ?? this.cue,
      emotion: emotion ?? this.emotion,
      place: place ?? this.place,
      coping: coping ?? this.coping,
      resisted: resisted ?? this.resisted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (atUtc.present) {
      map['at_utc'] = Variable<DateTime>(atUtc.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<int>(intensity.value);
    }
    if (cue.present) {
      map['cue'] = Variable<String>(cue.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    if (coping.present) {
      map['coping'] = Variable<String>(coping.value);
    }
    if (resisted.present) {
      map['resisted'] = Variable<bool>(resisted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CravingLogsCompanion(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('intensity: $intensity, ')
          ..write('cue: $cue, ')
          ..write('emotion: $emotion, ')
          ..write('place: $place, ')
          ..write('coping: $coping, ')
          ..write('resisted: $resisted')
          ..write(')'))
        .toString();
  }
}

class $SlipLogsTable extends SlipLogs with TableInfo<$SlipLogsTable, SlipLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SlipLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _atUtcMeta = const VerificationMeta('atUtc');
  @override
  late final GeneratedColumn<DateTime> atUtc = GeneratedColumn<DateTime>(
      'at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<int> units = GeneratedColumn<int>(
      'units', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, atUtc, units, context];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'slip_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SlipLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('at_utc')) {
      context.handle(
          _atUtcMeta, atUtc.isAcceptableOrUnknown(data['at_utc']!, _atUtcMeta));
    } else if (isInserting) {
      context.missing(_atUtcMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SlipLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SlipLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      atUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at_utc'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}units'])!,
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context']),
    );
  }

  @override
  $SlipLogsTable createAlias(String alias) {
    return $SlipLogsTable(attachedDatabase, alias);
  }
}

class SlipLog extends DataClass implements Insertable<SlipLog> {
  final int id;
  final DateTime atUtc;
  final int units;
  final String? context;
  const SlipLog(
      {required this.id,
      required this.atUtc,
      required this.units,
      this.context});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['at_utc'] = Variable<DateTime>(atUtc);
    map['units'] = Variable<int>(units);
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    return map;
  }

  SlipLogsCompanion toCompanion(bool nullToAbsent) {
    return SlipLogsCompanion(
      id: Value(id),
      atUtc: Value(atUtc),
      units: Value(units),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
    );
  }

  factory SlipLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SlipLog(
      id: serializer.fromJson<int>(json['id']),
      atUtc: serializer.fromJson<DateTime>(json['atUtc']),
      units: serializer.fromJson<int>(json['units']),
      context: serializer.fromJson<String?>(json['context']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'atUtc': serializer.toJson<DateTime>(atUtc),
      'units': serializer.toJson<int>(units),
      'context': serializer.toJson<String?>(context),
    };
  }

  SlipLog copyWith(
          {int? id,
          DateTime? atUtc,
          int? units,
          Value<String?> context = const Value.absent()}) =>
      SlipLog(
        id: id ?? this.id,
        atUtc: atUtc ?? this.atUtc,
        units: units ?? this.units,
        context: context.present ? context.value : this.context,
      );
  SlipLog copyWithCompanion(SlipLogsCompanion data) {
    return SlipLog(
      id: data.id.present ? data.id.value : this.id,
      atUtc: data.atUtc.present ? data.atUtc.value : this.atUtc,
      units: data.units.present ? data.units.value : this.units,
      context: data.context.present ? data.context.value : this.context,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SlipLog(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('units: $units, ')
          ..write('context: $context')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, atUtc, units, context);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SlipLog &&
          other.id == this.id &&
          other.atUtc == this.atUtc &&
          other.units == this.units &&
          other.context == this.context);
}

class SlipLogsCompanion extends UpdateCompanion<SlipLog> {
  final Value<int> id;
  final Value<DateTime> atUtc;
  final Value<int> units;
  final Value<String?> context;
  const SlipLogsCompanion({
    this.id = const Value.absent(),
    this.atUtc = const Value.absent(),
    this.units = const Value.absent(),
    this.context = const Value.absent(),
  });
  SlipLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime atUtc,
    this.units = const Value.absent(),
    this.context = const Value.absent(),
  }) : atUtc = Value(atUtc);
  static Insertable<SlipLog> custom({
    Expression<int>? id,
    Expression<DateTime>? atUtc,
    Expression<int>? units,
    Expression<String>? context,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (atUtc != null) 'at_utc': atUtc,
      if (units != null) 'units': units,
      if (context != null) 'context': context,
    });
  }

  SlipLogsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? atUtc,
      Value<int>? units,
      Value<String?>? context}) {
    return SlipLogsCompanion(
      id: id ?? this.id,
      atUtc: atUtc ?? this.atUtc,
      units: units ?? this.units,
      context: context ?? this.context,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (atUtc.present) {
      map['at_utc'] = Variable<DateTime>(atUtc.value);
    }
    if (units.present) {
      map['units'] = Variable<int>(units.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SlipLogsCompanion(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('units: $units, ')
          ..write('context: $context')
          ..write(')'))
        .toString();
  }
}

class $ConsentsTable extends Consents with TableInfo<$ConsentsTable, Consent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _docVersionMeta =
      const VerificationMeta('docVersion');
  @override
  late final GeneratedColumn<String> docVersion = GeneratedColumn<String>(
      'doc_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _grantedMeta =
      const VerificationMeta('granted');
  @override
  late final GeneratedColumn<bool> granted = GeneratedColumn<bool>(
      'granted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("granted" IN (0, 1))'));
  static const VerificationMeta _atUtcMeta = const VerificationMeta('atUtc');
  @override
  late final GeneratedColumn<DateTime> atUtc = GeneratedColumn<DateTime>(
      'at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, kind, docVersion, granted, atUtc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consents';
  @override
  VerificationContext validateIntegrity(Insertable<Consent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('doc_version')) {
      context.handle(
          _docVersionMeta,
          docVersion.isAcceptableOrUnknown(
              data['doc_version']!, _docVersionMeta));
    } else if (isInserting) {
      context.missing(_docVersionMeta);
    }
    if (data.containsKey('granted')) {
      context.handle(_grantedMeta,
          granted.isAcceptableOrUnknown(data['granted']!, _grantedMeta));
    } else if (isInserting) {
      context.missing(_grantedMeta);
    }
    if (data.containsKey('at_utc')) {
      context.handle(
          _atUtcMeta, atUtc.isAcceptableOrUnknown(data['at_utc']!, _atUtcMeta));
    } else if (isInserting) {
      context.missing(_atUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Consent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Consent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      docVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doc_version'])!,
      granted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}granted'])!,
      atUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at_utc'])!,
    );
  }

  @override
  $ConsentsTable createAlias(String alias) {
    return $ConsentsTable(attachedDatabase, alias);
  }
}

class Consent extends DataClass implements Insertable<Consent> {
  final int id;

  /// health_data | cross_border | analytics | marketing
  final String kind;

  /// Onaylanan metnin sürümü (ör. "2026-08-tr-v1").
  final String docVersion;
  final bool granted;
  final DateTime atUtc;
  const Consent(
      {required this.id,
      required this.kind,
      required this.docVersion,
      required this.granted,
      required this.atUtc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kind'] = Variable<String>(kind);
    map['doc_version'] = Variable<String>(docVersion);
    map['granted'] = Variable<bool>(granted);
    map['at_utc'] = Variable<DateTime>(atUtc);
    return map;
  }

  ConsentsCompanion toCompanion(bool nullToAbsent) {
    return ConsentsCompanion(
      id: Value(id),
      kind: Value(kind),
      docVersion: Value(docVersion),
      granted: Value(granted),
      atUtc: Value(atUtc),
    );
  }

  factory Consent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Consent(
      id: serializer.fromJson<int>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      docVersion: serializer.fromJson<String>(json['docVersion']),
      granted: serializer.fromJson<bool>(json['granted']),
      atUtc: serializer.fromJson<DateTime>(json['atUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kind': serializer.toJson<String>(kind),
      'docVersion': serializer.toJson<String>(docVersion),
      'granted': serializer.toJson<bool>(granted),
      'atUtc': serializer.toJson<DateTime>(atUtc),
    };
  }

  Consent copyWith(
          {int? id,
          String? kind,
          String? docVersion,
          bool? granted,
          DateTime? atUtc}) =>
      Consent(
        id: id ?? this.id,
        kind: kind ?? this.kind,
        docVersion: docVersion ?? this.docVersion,
        granted: granted ?? this.granted,
        atUtc: atUtc ?? this.atUtc,
      );
  Consent copyWithCompanion(ConsentsCompanion data) {
    return Consent(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      docVersion:
          data.docVersion.present ? data.docVersion.value : this.docVersion,
      granted: data.granted.present ? data.granted.value : this.granted,
      atUtc: data.atUtc.present ? data.atUtc.value : this.atUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Consent(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('docVersion: $docVersion, ')
          ..write('granted: $granted, ')
          ..write('atUtc: $atUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kind, docVersion, granted, atUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Consent &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.docVersion == this.docVersion &&
          other.granted == this.granted &&
          other.atUtc == this.atUtc);
}

class ConsentsCompanion extends UpdateCompanion<Consent> {
  final Value<int> id;
  final Value<String> kind;
  final Value<String> docVersion;
  final Value<bool> granted;
  final Value<DateTime> atUtc;
  const ConsentsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.docVersion = const Value.absent(),
    this.granted = const Value.absent(),
    this.atUtc = const Value.absent(),
  });
  ConsentsCompanion.insert({
    this.id = const Value.absent(),
    required String kind,
    required String docVersion,
    required bool granted,
    required DateTime atUtc,
  })  : kind = Value(kind),
        docVersion = Value(docVersion),
        granted = Value(granted),
        atUtc = Value(atUtc);
  static Insertable<Consent> custom({
    Expression<int>? id,
    Expression<String>? kind,
    Expression<String>? docVersion,
    Expression<bool>? granted,
    Expression<DateTime>? atUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (docVersion != null) 'doc_version': docVersion,
      if (granted != null) 'granted': granted,
      if (atUtc != null) 'at_utc': atUtc,
    });
  }

  ConsentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? kind,
      Value<String>? docVersion,
      Value<bool>? granted,
      Value<DateTime>? atUtc}) {
    return ConsentsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      docVersion: docVersion ?? this.docVersion,
      granted: granted ?? this.granted,
      atUtc: atUtc ?? this.atUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (docVersion.present) {
      map['doc_version'] = Variable<String>(docVersion.value);
    }
    if (granted.present) {
      map['granted'] = Variable<bool>(granted.value);
    }
    if (atUtc.present) {
      map['at_utc'] = Variable<DateTime>(atUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsentsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('docVersion: $docVersion, ')
          ..write('granted: $granted, ')
          ..write('atUtc: $atUtc')
          ..write(')'))
        .toString();
  }
}

class $CheckinLogsTable extends CheckinLogs
    with TableInfo<$CheckinLogsTable, CheckinLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckinLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _atUtcMeta = const VerificationMeta('atUtc');
  @override
  late final GeneratedColumn<DateTime> atUtc = GeneratedColumn<DateTime>(
      'at_utc', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _responseMeta =
      const VerificationMeta('response');
  @override
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
      'response', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, atUtc, response];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checkin_logs';
  @override
  VerificationContext validateIntegrity(Insertable<CheckinLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('at_utc')) {
      context.handle(
          _atUtcMeta, atUtc.isAcceptableOrUnknown(data['at_utc']!, _atUtcMeta));
    } else if (isInserting) {
      context.missing(_atUtcMeta);
    }
    if (data.containsKey('response')) {
      context.handle(_responseMeta,
          response.isAcceptableOrUnknown(data['response']!, _responseMeta));
    } else if (isInserting) {
      context.missing(_responseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckinLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckinLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      atUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at_utc'])!,
      response: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response'])!,
    );
  }

  @override
  $CheckinLogsTable createAlias(String alias) {
    return $CheckinLogsTable(attachedDatabase, alias);
  }
}

class CheckinLog extends DataClass implements Insertable<CheckinLog> {
  final int id;
  final DateTime atUtc;

  /// CheckinResponse enum adı ('good' | 'struggling').
  final String response;
  const CheckinLog(
      {required this.id, required this.atUtc, required this.response});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['at_utc'] = Variable<DateTime>(atUtc);
    map['response'] = Variable<String>(response);
    return map;
  }

  CheckinLogsCompanion toCompanion(bool nullToAbsent) {
    return CheckinLogsCompanion(
      id: Value(id),
      atUtc: Value(atUtc),
      response: Value(response),
    );
  }

  factory CheckinLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckinLog(
      id: serializer.fromJson<int>(json['id']),
      atUtc: serializer.fromJson<DateTime>(json['atUtc']),
      response: serializer.fromJson<String>(json['response']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'atUtc': serializer.toJson<DateTime>(atUtc),
      'response': serializer.toJson<String>(response),
    };
  }

  CheckinLog copyWith({int? id, DateTime? atUtc, String? response}) =>
      CheckinLog(
        id: id ?? this.id,
        atUtc: atUtc ?? this.atUtc,
        response: response ?? this.response,
      );
  CheckinLog copyWithCompanion(CheckinLogsCompanion data) {
    return CheckinLog(
      id: data.id.present ? data.id.value : this.id,
      atUtc: data.atUtc.present ? data.atUtc.value : this.atUtc,
      response: data.response.present ? data.response.value : this.response,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckinLog(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('response: $response')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, atUtc, response);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckinLog &&
          other.id == this.id &&
          other.atUtc == this.atUtc &&
          other.response == this.response);
}

class CheckinLogsCompanion extends UpdateCompanion<CheckinLog> {
  final Value<int> id;
  final Value<DateTime> atUtc;
  final Value<String> response;
  const CheckinLogsCompanion({
    this.id = const Value.absent(),
    this.atUtc = const Value.absent(),
    this.response = const Value.absent(),
  });
  CheckinLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime atUtc,
    required String response,
  })  : atUtc = Value(atUtc),
        response = Value(response);
  static Insertable<CheckinLog> custom({
    Expression<int>? id,
    Expression<DateTime>? atUtc,
    Expression<String>? response,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (atUtc != null) 'at_utc': atUtc,
      if (response != null) 'response': response,
    });
  }

  CheckinLogsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? atUtc, Value<String>? response}) {
    return CheckinLogsCompanion(
      id: id ?? this.id,
      atUtc: atUtc ?? this.atUtc,
      response: response ?? this.response,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (atUtc.present) {
      map['at_utc'] = Variable<DateTime>(atUtc.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckinLogsCompanion(')
          ..write('id: $id, ')
          ..write('atUtc: $atUtc, ')
          ..write('response: $response')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
      'notifications_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notifications_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, notificationsEnabled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final bool notificationsEnabled;
  const AppSetting({required this.id, required this.notificationsEnabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      notificationsEnabled: Value(notificationsEnabled),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
    };
  }

  AppSetting copyWith({int? id, bool? notificationsEnabled}) => AppSetting(
        id: id ?? this.id,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('notificationsEnabled: $notificationsEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, notificationsEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.notificationsEnabled == this.notificationsEnabled);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<bool> notificationsEnabled;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<bool>? notificationsEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id, Value<bool>? notificationsEnabled}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('notificationsEnabled: $notificationsEnabled')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $CravingLogsTable cravingLogs = $CravingLogsTable(this);
  late final $SlipLogsTable slipLogs = $SlipLogsTable(this);
  late final $ConsentsTable consents = $ConsentsTable(this);
  late final $CheckinLogsTable checkinLogs = $CheckinLogsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userProfiles, cravingLogs, slipLogs, consents, checkinLogs, appSettings];
}

typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  required DateTime quitDateUtc,
  required String productType,
  required double unitsPerDay,
  required int unitsPerPack,
  required int packPriceMinor,
  required String currencyCode,
  Value<String?> countryCode,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  Value<DateTime> quitDateUtc,
  Value<String> productType,
  Value<double> unitsPerDay,
  Value<int> unitsPerPack,
  Value<int> packPriceMinor,
  Value<String> currencyCode,
  Value<String?> countryCode,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get quitDateUtc => $composableBuilder(
      column: $table.quitDateUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitsPerDay => $composableBuilder(
      column: $table.unitsPerDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitsPerPack => $composableBuilder(
      column: $table.unitsPerPack, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get packPriceMinor => $composableBuilder(
      column: $table.packPriceMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get quitDateUtc => $composableBuilder(
      column: $table.quitDateUtc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitsPerDay => $composableBuilder(
      column: $table.unitsPerDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitsPerPack => $composableBuilder(
      column: $table.unitsPerPack,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get packPriceMinor => $composableBuilder(
      column: $table.packPriceMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get quitDateUtc => $composableBuilder(
      column: $table.quitDateUtc, builder: (column) => column);

  GeneratedColumn<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => column);

  GeneratedColumn<double> get unitsPerDay => $composableBuilder(
      column: $table.unitsPerDay, builder: (column) => column);

  GeneratedColumn<int> get unitsPerPack => $composableBuilder(
      column: $table.unitsPerPack, builder: (column) => column);

  GeneratedColumn<int> get packPriceMinor => $composableBuilder(
      column: $table.packPriceMinor, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> quitDateUtc = const Value.absent(),
            Value<String> productType = const Value.absent(),
            Value<double> unitsPerDay = const Value.absent(),
            Value<int> unitsPerPack = const Value.absent(),
            Value<int> packPriceMinor = const Value.absent(),
            Value<String> currencyCode = const Value.absent(),
            Value<String?> countryCode = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            quitDateUtc: quitDateUtc,
            productType: productType,
            unitsPerDay: unitsPerDay,
            unitsPerPack: unitsPerPack,
            packPriceMinor: packPriceMinor,
            currencyCode: currencyCode,
            countryCode: countryCode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime quitDateUtc,
            required String productType,
            required double unitsPerDay,
            required int unitsPerPack,
            required int packPriceMinor,
            required String currencyCode,
            Value<String?> countryCode = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            quitDateUtc: quitDateUtc,
            productType: productType,
            unitsPerDay: unitsPerDay,
            unitsPerPack: unitsPerPack,
            packPriceMinor: packPriceMinor,
            currencyCode: currencyCode,
            countryCode: countryCode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()>;
typedef $$CravingLogsTableCreateCompanionBuilder = CravingLogsCompanion
    Function({
  Value<int> id,
  required DateTime atUtc,
  required int intensity,
  Value<String?> cue,
  Value<String?> emotion,
  Value<String?> place,
  Value<String?> coping,
  Value<bool> resisted,
});
typedef $$CravingLogsTableUpdateCompanionBuilder = CravingLogsCompanion
    Function({
  Value<int> id,
  Value<DateTime> atUtc,
  Value<int> intensity,
  Value<String?> cue,
  Value<String?> emotion,
  Value<String?> place,
  Value<String?> coping,
  Value<bool> resisted,
});

class $$CravingLogsTableFilterComposer
    extends Composer<_$AppDatabase, $CravingLogsTable> {
  $$CravingLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intensity => $composableBuilder(
      column: $table.intensity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cue => $composableBuilder(
      column: $table.cue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emotion => $composableBuilder(
      column: $table.emotion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coping => $composableBuilder(
      column: $table.coping, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get resisted => $composableBuilder(
      column: $table.resisted, builder: (column) => ColumnFilters(column));
}

class $$CravingLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CravingLogsTable> {
  $$CravingLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intensity => $composableBuilder(
      column: $table.intensity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cue => $composableBuilder(
      column: $table.cue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emotion => $composableBuilder(
      column: $table.emotion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coping => $composableBuilder(
      column: $table.coping, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get resisted => $composableBuilder(
      column: $table.resisted, builder: (column) => ColumnOrderings(column));
}

class $$CravingLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CravingLogsTable> {
  $$CravingLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get atUtc =>
      $composableBuilder(column: $table.atUtc, builder: (column) => column);

  GeneratedColumn<int> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<String> get cue =>
      $composableBuilder(column: $table.cue, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumn<String> get coping =>
      $composableBuilder(column: $table.coping, builder: (column) => column);

  GeneratedColumn<bool> get resisted =>
      $composableBuilder(column: $table.resisted, builder: (column) => column);
}

class $$CravingLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CravingLogsTable,
    CravingLog,
    $$CravingLogsTableFilterComposer,
    $$CravingLogsTableOrderingComposer,
    $$CravingLogsTableAnnotationComposer,
    $$CravingLogsTableCreateCompanionBuilder,
    $$CravingLogsTableUpdateCompanionBuilder,
    (CravingLog, BaseReferences<_$AppDatabase, $CravingLogsTable, CravingLog>),
    CravingLog,
    PrefetchHooks Function()> {
  $$CravingLogsTableTableManager(_$AppDatabase db, $CravingLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CravingLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CravingLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CravingLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> atUtc = const Value.absent(),
            Value<int> intensity = const Value.absent(),
            Value<String?> cue = const Value.absent(),
            Value<String?> emotion = const Value.absent(),
            Value<String?> place = const Value.absent(),
            Value<String?> coping = const Value.absent(),
            Value<bool> resisted = const Value.absent(),
          }) =>
              CravingLogsCompanion(
            id: id,
            atUtc: atUtc,
            intensity: intensity,
            cue: cue,
            emotion: emotion,
            place: place,
            coping: coping,
            resisted: resisted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime atUtc,
            required int intensity,
            Value<String?> cue = const Value.absent(),
            Value<String?> emotion = const Value.absent(),
            Value<String?> place = const Value.absent(),
            Value<String?> coping = const Value.absent(),
            Value<bool> resisted = const Value.absent(),
          }) =>
              CravingLogsCompanion.insert(
            id: id,
            atUtc: atUtc,
            intensity: intensity,
            cue: cue,
            emotion: emotion,
            place: place,
            coping: coping,
            resisted: resisted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CravingLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CravingLogsTable,
    CravingLog,
    $$CravingLogsTableFilterComposer,
    $$CravingLogsTableOrderingComposer,
    $$CravingLogsTableAnnotationComposer,
    $$CravingLogsTableCreateCompanionBuilder,
    $$CravingLogsTableUpdateCompanionBuilder,
    (CravingLog, BaseReferences<_$AppDatabase, $CravingLogsTable, CravingLog>),
    CravingLog,
    PrefetchHooks Function()>;
typedef $$SlipLogsTableCreateCompanionBuilder = SlipLogsCompanion Function({
  Value<int> id,
  required DateTime atUtc,
  Value<int> units,
  Value<String?> context,
});
typedef $$SlipLogsTableUpdateCompanionBuilder = SlipLogsCompanion Function({
  Value<int> id,
  Value<DateTime> atUtc,
  Value<int> units,
  Value<String?> context,
});

class $$SlipLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SlipLogsTable> {
  $$SlipLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnFilters(column));
}

class $$SlipLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SlipLogsTable> {
  $$SlipLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnOrderings(column));
}

class $$SlipLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SlipLogsTable> {
  $$SlipLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get atUtc =>
      $composableBuilder(column: $table.atUtc, builder: (column) => column);

  GeneratedColumn<int> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);
}

class $$SlipLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SlipLogsTable,
    SlipLog,
    $$SlipLogsTableFilterComposer,
    $$SlipLogsTableOrderingComposer,
    $$SlipLogsTableAnnotationComposer,
    $$SlipLogsTableCreateCompanionBuilder,
    $$SlipLogsTableUpdateCompanionBuilder,
    (SlipLog, BaseReferences<_$AppDatabase, $SlipLogsTable, SlipLog>),
    SlipLog,
    PrefetchHooks Function()> {
  $$SlipLogsTableTableManager(_$AppDatabase db, $SlipLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SlipLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SlipLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SlipLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> atUtc = const Value.absent(),
            Value<int> units = const Value.absent(),
            Value<String?> context = const Value.absent(),
          }) =>
              SlipLogsCompanion(
            id: id,
            atUtc: atUtc,
            units: units,
            context: context,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime atUtc,
            Value<int> units = const Value.absent(),
            Value<String?> context = const Value.absent(),
          }) =>
              SlipLogsCompanion.insert(
            id: id,
            atUtc: atUtc,
            units: units,
            context: context,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SlipLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SlipLogsTable,
    SlipLog,
    $$SlipLogsTableFilterComposer,
    $$SlipLogsTableOrderingComposer,
    $$SlipLogsTableAnnotationComposer,
    $$SlipLogsTableCreateCompanionBuilder,
    $$SlipLogsTableUpdateCompanionBuilder,
    (SlipLog, BaseReferences<_$AppDatabase, $SlipLogsTable, SlipLog>),
    SlipLog,
    PrefetchHooks Function()>;
typedef $$ConsentsTableCreateCompanionBuilder = ConsentsCompanion Function({
  Value<int> id,
  required String kind,
  required String docVersion,
  required bool granted,
  required DateTime atUtc,
});
typedef $$ConsentsTableUpdateCompanionBuilder = ConsentsCompanion Function({
  Value<int> id,
  Value<String> kind,
  Value<String> docVersion,
  Value<bool> granted,
  Value<DateTime> atUtc,
});

class $$ConsentsTableFilterComposer
    extends Composer<_$AppDatabase, $ConsentsTable> {
  $$ConsentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get docVersion => $composableBuilder(
      column: $table.docVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get granted => $composableBuilder(
      column: $table.granted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnFilters(column));
}

class $$ConsentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConsentsTable> {
  $$ConsentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get docVersion => $composableBuilder(
      column: $table.docVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get granted => $composableBuilder(
      column: $table.granted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnOrderings(column));
}

class $$ConsentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConsentsTable> {
  $$ConsentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get docVersion => $composableBuilder(
      column: $table.docVersion, builder: (column) => column);

  GeneratedColumn<bool> get granted =>
      $composableBuilder(column: $table.granted, builder: (column) => column);

  GeneratedColumn<DateTime> get atUtc =>
      $composableBuilder(column: $table.atUtc, builder: (column) => column);
}

class $$ConsentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConsentsTable,
    Consent,
    $$ConsentsTableFilterComposer,
    $$ConsentsTableOrderingComposer,
    $$ConsentsTableAnnotationComposer,
    $$ConsentsTableCreateCompanionBuilder,
    $$ConsentsTableUpdateCompanionBuilder,
    (Consent, BaseReferences<_$AppDatabase, $ConsentsTable, Consent>),
    Consent,
    PrefetchHooks Function()> {
  $$ConsentsTableTableManager(_$AppDatabase db, $ConsentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConsentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> kind = const Value.absent(),
            Value<String> docVersion = const Value.absent(),
            Value<bool> granted = const Value.absent(),
            Value<DateTime> atUtc = const Value.absent(),
          }) =>
              ConsentsCompanion(
            id: id,
            kind: kind,
            docVersion: docVersion,
            granted: granted,
            atUtc: atUtc,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String kind,
            required String docVersion,
            required bool granted,
            required DateTime atUtc,
          }) =>
              ConsentsCompanion.insert(
            id: id,
            kind: kind,
            docVersion: docVersion,
            granted: granted,
            atUtc: atUtc,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConsentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConsentsTable,
    Consent,
    $$ConsentsTableFilterComposer,
    $$ConsentsTableOrderingComposer,
    $$ConsentsTableAnnotationComposer,
    $$ConsentsTableCreateCompanionBuilder,
    $$ConsentsTableUpdateCompanionBuilder,
    (Consent, BaseReferences<_$AppDatabase, $ConsentsTable, Consent>),
    Consent,
    PrefetchHooks Function()>;
typedef $$CheckinLogsTableCreateCompanionBuilder = CheckinLogsCompanion
    Function({
  Value<int> id,
  required DateTime atUtc,
  required String response,
});
typedef $$CheckinLogsTableUpdateCompanionBuilder = CheckinLogsCompanion
    Function({
  Value<int> id,
  Value<DateTime> atUtc,
  Value<String> response,
});

class $$CheckinLogsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckinLogsTable> {
  $$CheckinLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get response => $composableBuilder(
      column: $table.response, builder: (column) => ColumnFilters(column));
}

class $$CheckinLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckinLogsTable> {
  $$CheckinLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get atUtc => $composableBuilder(
      column: $table.atUtc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get response => $composableBuilder(
      column: $table.response, builder: (column) => ColumnOrderings(column));
}

class $$CheckinLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckinLogsTable> {
  $$CheckinLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get atUtc =>
      $composableBuilder(column: $table.atUtc, builder: (column) => column);

  GeneratedColumn<String> get response =>
      $composableBuilder(column: $table.response, builder: (column) => column);
}

class $$CheckinLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CheckinLogsTable,
    CheckinLog,
    $$CheckinLogsTableFilterComposer,
    $$CheckinLogsTableOrderingComposer,
    $$CheckinLogsTableAnnotationComposer,
    $$CheckinLogsTableCreateCompanionBuilder,
    $$CheckinLogsTableUpdateCompanionBuilder,
    (CheckinLog, BaseReferences<_$AppDatabase, $CheckinLogsTable, CheckinLog>),
    CheckinLog,
    PrefetchHooks Function()> {
  $$CheckinLogsTableTableManager(_$AppDatabase db, $CheckinLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckinLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckinLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckinLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> atUtc = const Value.absent(),
            Value<String> response = const Value.absent(),
          }) =>
              CheckinLogsCompanion(
            id: id,
            atUtc: atUtc,
            response: response,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime atUtc,
            required String response,
          }) =>
              CheckinLogsCompanion.insert(
            id: id,
            atUtc: atUtc,
            response: response,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CheckinLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CheckinLogsTable,
    CheckinLog,
    $$CheckinLogsTableFilterComposer,
    $$CheckinLogsTableOrderingComposer,
    $$CheckinLogsTableAnnotationComposer,
    $$CheckinLogsTableCreateCompanionBuilder,
    $$CheckinLogsTableUpdateCompanionBuilder,
    (CheckinLog, BaseReferences<_$AppDatabase, $CheckinLogsTable, CheckinLog>),
    CheckinLog,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<bool> notificationsEnabled,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<bool> notificationsEnabled,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            notificationsEnabled: notificationsEnabled,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            notificationsEnabled: notificationsEnabled,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$CravingLogsTableTableManager get cravingLogs =>
      $$CravingLogsTableTableManager(_db, _db.cravingLogs);
  $$SlipLogsTableTableManager get slipLogs =>
      $$SlipLogsTableTableManager(_db, _db.slipLogs);
  $$ConsentsTableTableManager get consents =>
      $$ConsentsTableTableManager(_db, _db.consents);
  $$CheckinLogsTableTableManager get checkinLogs =>
      $$CheckinLogsTableTableManager(_db, _db.checkinLogs);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
