///
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'location.pb.dart' as $0;
export 'location.pb.dart';

class LocationClient extends $grpc.Client {
  static final _$subscribeLocation = $grpc.ClientMethod<
          $0.SubscribeLocationRequest, $0.SubscribeLocationResponse>(
      '/proto.Location/SubscribeLocation',
      ($0.SubscribeLocationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SubscribeLocationResponse.fromBuffer(value));

  LocationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.SubscribeLocationResponse> subscribeLocation(
      $0.SubscribeLocationRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribeLocation, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class LocationServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Location';

  LocationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubscribeLocationRequest,
            $0.SubscribeLocationResponse>(
        'SubscribeLocation',
        subscribeLocation_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.SubscribeLocationRequest.fromBuffer(value),
        ($0.SubscribeLocationResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SubscribeLocationResponse> subscribeLocation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SubscribeLocationRequest> request) async* {
    yield* subscribeLocation(call, await request);
  }

  $async.Stream<$0.SubscribeLocationResponse> subscribeLocation(
      $grpc.ServiceCall call, $0.SubscribeLocationRequest request);
}
