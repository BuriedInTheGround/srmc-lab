{
  buildPythonPackage,
  fetchPypi,
  pydantic,
  pythonOlder,
  python-dateutil,
  setuptools,
  urllib3,
  websocket-client,
}:

buildPythonPackage rec {
  pname = "cheshire_cat_api";
  version = "1.4.9";
  pyproject = true;

  disabled = pythonOlder "3.10";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-w+sNF/C4ADhxpwMV1Vjk0grSoSMyLde18IpDEOeZpOI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pydantic
    python-dateutil
    urllib3
    websocket-client
  ];

  doCheck = false;
}
