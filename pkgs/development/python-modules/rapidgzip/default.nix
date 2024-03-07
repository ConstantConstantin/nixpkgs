{ lib
, buildPythonPackage
, cython
, fetchPypi
, pythonOlder
, setuptools
, nasm
}:

buildPythonPackage rec {
  pname = "rapidgzip";
  version = "0.13.0";
  pyproject = true;

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MwT4+wzlNXfDLT/o/oT1iy9cVlFIIXc18r7dg+x5SXY=";
  };

  nativeBuildInputs = [ cython nasm setuptools ];

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "rapidgzip" ];

  meta = with lib; {
    description = "Python library for parallel decompression and seeking within compressed gzip files";
    mainProgram = "rapidgzip";
    homepage = "https://github.com/mxmlnkn/rapidgzip";
    changelog = "https://github.com/mxmlnkn/rapidgzip/blob/rapidgzip-v${version}/python/rapidgzip/CHANGELOG.md";
    license = licenses.mit; # dual MIT and asl20, https://internals.rust-lang.org/t/rationale-of-apache-dual-licensing/8952
    maintainers = with lib.maintainers; [ mxmlnkn ];
  };
}
