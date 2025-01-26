# Going Passwordless with py_webauthn (Sample RP)

A basic implementation of a WebAuthn RP using the [py_webauthn](https://github.com/duo-labs/py_webauthn) library for passwordless account registration and authentication.

## Requirements

- Python 3.9+

## Starting the demo

First, set up a virtual environment:

```sh
python3 -m venv venv && source venv/bin/activate
```

Next, install dependencies:

```sh
pip install -r requirements.txt
```

Finally, run the server to view the demo at http://localhost:5000:

```sh
./start-server.sh
```

Windows users can instead use

```ps1
./Start-Server.ps1
```
