import packageInfo from '../../package.json';

export const environment = {
  production: false,
  clientName: 'Bem Estar',
  apiUrl: 'http://localhost:8009',
  version: packageInfo.version
};
