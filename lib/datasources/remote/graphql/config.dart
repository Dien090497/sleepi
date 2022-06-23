import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static String _token =
      'QEduvlhzwY71NByw0litRtGwycLSFGVmtcrr820d7LUyu57tm2ALOV8rL9GDJ5Xh';

  static final HttpLink _httpLink =
      HttpLink('https://trusting-pup-46.hasura.app/v1/graphql');

  static final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer <$_token>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static final Link link = _authLink.concat(_httpLink);

  static ValueNotifier<GraphQLClient> initializeClient(
      [String token = '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']) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return client;
  }

  static GraphQLConfig? _instance;

  GraphQLConfig._();

  static GraphQLConfig get I => _instance ??= GraphQLConfig._();
}
