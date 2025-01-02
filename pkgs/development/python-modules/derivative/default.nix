{ lib, fetchPypi, poetry-core, }:

buildPythonPackage rec {
  pname = "derivative";
  version = "0.6.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-cuf9VukmZfk5tUScS5zuqI/fAu2nN4zwo+lhqw31gYE=";
  };

  format = "pyproject";

  buildInputs = [ poetry-core ];
}
