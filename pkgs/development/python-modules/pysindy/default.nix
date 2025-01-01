{ lib, fetchPypi, derivative, jax, scikit-learn, typing-extensions, setuptools
, setuptools-scm, setuptools-scm-git-archive, }:

buildPythonPackage rec {
  pname = "pysindy";
  version = "1.7.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a99c99b7a1e032e53113e2174abcf22d04ce1f0404deb8994fc4e3b6d34c7820";
  };

  format = "pyproject";

  buildInputs = [ setuptools-scm setuptools-scm-git-archive ];

  propagatedBuildInputs = [
    # From pyproject.toml
    derivative
    jax
    scikit-learn
    typing-extensions

    # Additional required inputs
    setuptools
  ];
}
