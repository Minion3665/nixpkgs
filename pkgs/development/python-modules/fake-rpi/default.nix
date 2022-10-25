{ lib
, buildPythonPackage
, fetchPypi
, numpy
, pytest
}:

buildPythonPackage rec {
  pname = "fake-rpi";
  version = "0.7.1";

  src = fetchPypi {
    pname = "fake_rpi";
    inherit version;
    hash = "sha256-kZSELEmtF6+ltJLFIXLX4VeQVj42oB/F9SW2BkFuAO4=";
  };

  propagatedBuildInputs = [
    numpy
  ];

  checkInputs = [
    pytest
  ];

  pythonImportsCheck = [ "fake_rpi" ];

  meta = with lib; {
    description = "A bunch of fake interfaces for development when not using the RPi or unit testing";
    homepage = "https://github.com/MomsFriendlyRobotCompany/fake_rpi";
    license = licenses.mit;
    maintainers = with maintainers; [ minion3665 ];
  };
}
