const baseUrl = 'faqpqzhd74.execute-api.us-east-1.amazonaws.com';
const env = 'prod';
const scheme = 'https';

final getSpacesUri = Uri(
  scheme: scheme,
  host: baseUrl,
  path: '$env/spaces',
);
