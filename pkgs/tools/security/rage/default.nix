{ stdenv, rustPlatform, fetchFromGitHub, Security }:

rustPlatform.buildRustPackage rec {
  pname = "rage";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = pname;
    rev = "v${version}";
    sha256 = "1lfp9vyrk8880j7p5i73zja9dglvl1lvvh7286rwd1a9gbcj6grb";
  };

  # Delete this on next update; see #79975 for details
  legacyCargoFetcher = true;

  cargoSha256 = "09dg43vba8hwivng2h70qmpxnijad171mf02vwjw0gqxk83ql28v";

  buildInputs = stdenv.lib.optionals stdenv.isDarwin [ Security ];

  meta = with stdenv.lib; {
    description = "A simple, secure and modern encryption tool with small explicit keys, no config options, and UNIX-style composability";
    homepage = "https://github.com/str4d/rage";
    changelog = "https://github.com/str4d/rage/releases/tag/v${version}";
    license = licenses.asl20;
    maintainers = [ maintainers.marsam ];
  };
}
