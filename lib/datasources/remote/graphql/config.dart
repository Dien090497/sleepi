import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:slee_fi/secret.dart';

class GraphQLConfig {
  static String _token = hasuraAdminKey;

  static final HttpLink _httpLink =
      HttpLink('https://trusting-pup-46.hasura.app/v1/graphql');

  static final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer <$_token>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static final Link link = _authLink.concat(_httpLink);

  static ValueNotifier<GraphQLClient> initializeClient([String? token]) {
    _token = token ?? _token;
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
