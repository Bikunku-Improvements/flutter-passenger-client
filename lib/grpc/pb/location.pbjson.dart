///
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use subscribeLocationRequestDescriptor instead')
const SubscribeLocationRequest$json = const {
  '1': 'SubscribeLocationRequest',
};

/// Descriptor for `SubscribeLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeLocationRequestDescriptor = $convert.base64Decode('ChhTdWJzY3JpYmVMb2NhdGlvblJlcXVlc3Q=');
@$core.Deprecated('Use subscribeLocationResponseDescriptor instead')
const SubscribeLocationResponse$json = const {
  '1': 'SubscribeLocationResponse',
  '2': const [
    const {'1': 'bus_id', '3': 1, '4': 1, '5': 4, '10': 'busId'},
    const {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
    const {'1': 'plate', '3': 3, '4': 1, '5': 9, '10': 'plate'},
    const {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'route', '3': 5, '4': 1, '5': 9, '10': 'route'},
    const {'1': 'is_active', '3': 6, '4': 1, '5': 8, '10': 'isActive'},
    const {'1': 'long', '3': 7, '4': 1, '5': 2, '10': 'long'},
    const {'1': 'lat', '3': 8, '4': 1, '5': 2, '10': 'lat'},
    const {'1': 'speed', '3': 9, '4': 1, '5': 2, '10': 'speed'},
    const {'1': 'heading', '3': 10, '4': 1, '5': 2, '10': 'heading'},
    const {'1': 'created_at', '3': 11, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `SubscribeLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeLocationResponseDescriptor = $convert.base64Decode('ChlTdWJzY3JpYmVMb2NhdGlvblJlc3BvbnNlEhUKBmJ1c19pZBgBIAEoBFIFYnVzSWQSFgoGbnVtYmVyGAIgASgDUgZudW1iZXISFAoFcGxhdGUYAyABKAlSBXBsYXRlEhYKBnN0YXR1cxgEIAEoCVIGc3RhdHVzEhQKBXJvdXRlGAUgASgJUgVyb3V0ZRIbCglpc19hY3RpdmUYBiABKAhSCGlzQWN0aXZlEhIKBGxvbmcYByABKAJSBGxvbmcSEAoDbGF0GAggASgCUgNsYXQSFAoFc3BlZWQYCSABKAJSBXNwZWVkEhgKB2hlYWRpbmcYCiABKAJSB2hlYWRpbmcSHQoKY3JlYXRlZF9hdBgLIAEoCVIJY3JlYXRlZEF0');
