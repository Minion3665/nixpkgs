{ lib
, buildPythonPackage
, fetchPypi
, libxcrypt
}:

buildPythonPackage rec {
  pname = "wiringpi";
  version = "2.60.1";

  src = fetchPypi {
    pname = "wiringpi";
    inherit version;
    hash = "sha256-sMZdXXxl0LvvJcVtkCN8pAmLHtq8Uo+0jca2HWLNS30=";
  };

  buildInputs = [
    libxcrypt
  ];
  
  pythonImportsCheck = [ "wiringpi" ];

  meta = with lib; {
    description = "A python interface to WiringPi 2.0 library which allows for easily interfacing with the GPIO pins of the Raspberry Pi. Also supports i2c and SPI.";
    homepage = "https://github.com/WiringPi/WiringPi-Python/";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ minion3665 ];
  };
}
