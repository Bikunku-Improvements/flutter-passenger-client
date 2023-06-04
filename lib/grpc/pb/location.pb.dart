///
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SubscribeLocationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeLocationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SubscribeLocationRequest._() : super();
  factory SubscribeLocationRequest() => create();
  factory SubscribeLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeLocationRequest clone() => SubscribeLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeLocationRequest copyWith(void Function(SubscribeLocationRequest) updates) => super.copyWith((message) => updates(message as SubscribeLocationRequest)) as SubscribeLocationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeLocationRequest create() => SubscribeLocationRequest._();
  SubscribeLocationRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeLocationRequest> createRepeated() => $pb.PbList<SubscribeLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeLocationRequest>(create);
  static SubscribeLocationRequest? _defaultInstance;
}

class SubscribeLocationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeLocationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'busId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plate')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'route')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isActive')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'long', $pb.PbFieldType.OF)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lat', $pb.PbFieldType.OF)
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speed', $pb.PbFieldType.OF)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heading', $pb.PbFieldType.OF)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..hasRequiredFields = false
  ;

  SubscribeLocationResponse._() : super();
  factory SubscribeLocationResponse({
    $fixnum.Int64? busId,
    $fixnum.Int64? number,
    $core.String? plate,
    $core.String? status,
    $core.String? route,
    $core.bool? isActive,
    $core.double? long,
    $core.double? lat,
    $core.double? speed,
    $core.double? heading,
    $core.String? createdAt,
  }) {
    final _result = create();
    if (busId != null) {
      _result.busId = busId;
    }
    if (number != null) {
      _result.number = number;
    }
    if (plate != null) {
      _result.plate = plate;
    }
    if (status != null) {
      _result.status = status;
    }
    if (route != null) {
      _result.route = route;
    }
    if (isActive != null) {
      _result.isActive = isActive;
    }
    if (long != null) {
      _result.long = long;
    }
    if (lat != null) {
      _result.lat = lat;
    }
    if (speed != null) {
      _result.speed = speed;
    }
    if (heading != null) {
      _result.heading = heading;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory SubscribeLocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeLocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeLocationResponse clone() => SubscribeLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeLocationResponse copyWith(void Function(SubscribeLocationResponse) updates) => super.copyWith((message) => updates(message as SubscribeLocationResponse)) as SubscribeLocationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeLocationResponse create() => SubscribeLocationResponse._();
  SubscribeLocationResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeLocationResponse> createRepeated() => $pb.PbList<SubscribeLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeLocationResponse>(create);
  static SubscribeLocationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get busId => $_getI64(0);
  @$pb.TagNumber(1)
  set busId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get plate => $_getSZ(2);
  @$pb.TagNumber(3)
  set plate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlate() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get route => $_getSZ(4);
  @$pb.TagNumber(5)
  set route($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoute() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoute() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isActive => $_getBF(5);
  @$pb.TagNumber(6)
  set isActive($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsActive() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get long => $_getN(6);
  @$pb.TagNumber(7)
  set long($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLong() => $_has(6);
  @$pb.TagNumber(7)
  void clearLong() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get lat => $_getN(7);
  @$pb.TagNumber(8)
  set lat($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLat() => $_has(7);
  @$pb.TagNumber(8)
  void clearLat() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get speed => $_getN(8);
  @$pb.TagNumber(9)
  set speed($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSpeed() => $_has(8);
  @$pb.TagNumber(9)
  void clearSpeed() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get heading => $_getN(9);
  @$pb.TagNumber(10)
  set heading($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHeading() => $_has(9);
  @$pb.TagNumber(10)
  void clearHeading() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdAt($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => clearField(11);
}

